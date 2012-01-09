package general

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils


class UsuarioController {

    def springSecurityService

    static allowedMethods = [crea: "POST", actualiza: "POST", elimina: "POST"]

    @Secured(['ROLE_ADMIN'])
    def index = {
        redirect(action: "lista", params: params)
    }

    @Secured(['ROLE_ADMIN'])
    def lista = {
            params.max = Math.min(params.max ? params.int('max') : 10, 100)
            [usuarios: Usuario.list(params), totalDeUsuarios: Usuario.count()]
    }

    
    def nuevo = {
        def usuario = new Usuario()
        usuario.properties = params

        def roles = obtieneListaDeRoles(null)

        return [usuario: usuario, roles: roles]
    }

    def crea = {
        Usuario.withTransaction {
            def contra = params.password
            def usuario = new Usuario(params)
            
            if (usuario.save(flush: true)) {
                def roles = asignaRoles(params)
                def roles2 = [] as Set
                
                //Su foto
                def archivo = request.getFile('imagen')
                if (!archivo.empty) {
                    byte[] f = archivo.bytes
                    def imagen = new Imagen(
                        nombre : archivo.originalFilename
                        , tipoContenido : archivo.contentType
                        , tamano : archivo.size
                        , archivo : f
                    )
                    log.debug "Mostrando imagen ${imagen.nombre}"
                    if (usuario.imagenes) {
                        usuario.imagenes?.clear()
                    } else {
                        usuario.imagenes = []
                    }
                    usuario.imagenes << imagen
                    usuario.save()
                }
                
                
                //Cuando el Administrador registra al Usuario
                if(SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')){
                    usuario.password = contra
                        for(rol in roles) {
                            UsuarioRol.create(usuario, rol, false)
                        }
                        //Envio de e-mail
                        try {
                                sendMail {
                                    to      "${usuario.correo}"
                                    subject "Bienvenido a AdvenTicket"
                                    html    g.render(template:'/mail/envioRegistroAdministrador', model:[usuario:usuario])
                                }
                                    flash.message = message(code: 'usuario.creadoMail', args: [usuario.username, usuario.correo])
                                } catch(Exception e) {
                                    log.error "Problema al enviar el mail = $e.message", e
                                    flash.message = message(code: 'usuario.creadoNoMail', args: [usuario.username, usuario.correo])
                            }
                        flash.message = message(code: 'usuario.creado', args: [usuario.nombreCompleto])
                        redirect(action: "ver", id: usuario.id)
                    }else{
                        
                        //Cuando un Usuario se registra
                        usuario.password = contra
                        roles2 << Rol.findByAuthority('ROLE_ASISTENTE')
                        for(rol in roles2) {
                            UsuarioRol.create(usuario, rol, false)
                        }
                        //Envio de e-mail
                        try {
                                sendMail {
                                    to      "${usuario.correo}"
                                    subject "Bienvenido a AdvenTicket"
                                    html    g.render(template:'/mail/envioRegistroAsistente', model:[usuario:usuario])
                                }
                                flash.message = message(code: 'usuario.registradoMail', args: [usuario.username, usuario.correo])
                                } catch(Exception e) {
                                    log.error "Problema al enviar el mail = $e.message", e
                                    flash.message = message(code: 'usuario.registradoNoMail', args: [usuario.username, usuario.correo])
                            }
                        springSecurityService.reauthenticate(usuario.username)
                        //flash.message = message(code: 'usuario.registrado', args: [usuario.username])
                        redirect(action: "ver", id: usuario.id)
                    }

                
            } else {
                log.error("Hubo un error al crear el usuario ${usuario.errors}")
                render(view: "nuevo", model: [usuario: usuario])
            }
        }
    }
    
    @Secured(['ROLE_USER'])
    def vericaRegistro = {
        
        if(params.id == null){
            params.id = springSecurityService.principal.id
        }
        
        def usuario = Usuario.get(params.id)
        
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect(action: "lista")
        }
        else {
            def roles = obtieneListaDeRoles(usuario)
            return [usuario: usuario, roles: roles]
        }
    }
    
    @Secured(['ROLE_USER'])
    def ver = {
        
        if(params.id == null){
            params.id = springSecurityService.principal.id
        }
        
        def usuario = Usuario.get(params.id)
        
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect(action: "lista")
        }
        else {
            def roles = obtieneListaDeRoles(usuario)
            return [usuario: usuario, roles: roles]
        }
    }

    @Secured(['ROLE_USER'])
    def edita = {
        
        def usuario = Usuario.get(params.id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect(action: "lista")
        }
        else {
            def roles = obtieneListaDeRoles(usuario)

            return [usuario: usuario, roles: roles]
        }
    }

    @Secured(['ROLE_USER'])
    def actualiza = {
        Usuario.withTransaction {
            def usuario = Usuario.get(params.id)
            if (usuario) {
                if (params.version) {
                    def version = params.version.toLong()
                    if (usuario.version > version) {
                        
                        usuario.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'usuario.label', default: 'Usuario')] as Object[], "Another user has updated this Usuario while you were editing")
                        render(view: "edita", model: [usuario: usuario])
                        return
                    }
                }
                //Si cambio password
                if (usuario.password != params.password) {
                    usuario.password = springSecurityService.encodePassword(params.password)
                }
                params.remove('password')
                usuario.properties = params

                if (!usuario.hasErrors() && usuario.save(flush: true)) {
                    
                   if(SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')){
                        UsuarioRol.removeAll(usuario)
                        def roles = asignaRoles(params)
                        for(rol in roles) {
                            UsuarioRol.create(usuario, rol, false)
                        }
                    }
                    
                    if(SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')){
                        
                        flash.message = message(code: 'usuario.actualizado', args: [usuario.username])
                        redirect(action: "ver", id: usuario.id)
                    }else
                    if(SpringSecurityUtils.ifAnyGranted('ROLE_ASISTENTE')){
                        
                        flash.message = message(code: 'usuario.actualizadoMiCuenta')
                        redirect(action: "ver", id: usuario.id)
                    }
                }
                else {
                    render(view: "edita", model: [usuario: usuario])
                }
            }
            else {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect(action: "lista")
            }
        }
    }

    def elimina = {
        def usuario = Usuario.get(params.id)
        if (usuario) {
            try {
                def nombre = usuario.nombreCompleto
                UsuarioRol.removeAll(usuario)
                usuario.delete(flush: true)
                flash.message = message(code: 'usuario.eliminado', args: [nombre])
                redirect(action: "lista")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect(action: "ver", id: params.id)
            }
        }
        else {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect(action: "lista")
        }
    }

    def obtieneListaDeRoles = { usuario ->
        //log.debug "Obteniendo lista de roles"
        def roles = Rol.list()

        def rolesFiltrados = [] as Set
        if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
            //log.debug "Roles para ADMIN"
            rolesFiltrados = roles
        } else if(SpringSecurityUtils.ifAnyGranted('ROLE_EVENTO')) {
            //log.debug "Roles para EVENTO"
            for(rol in roles) {
                if (!rol.authority.equals('ROLE_ADMIN') && !rol.authority.equals('ROLE_EVENTO')) {
                    rolesFiltrados << rol
                }
            }
        } else if(SpringSecurityUtils.ifAnyGranted('ROLE_ASISTENTE')) {
            //log.debug "Roles para ASISTENTE"
            for(rol in roles) {
                if (rol.authority.equals('ROLE_USER')) {
                    rolesFiltrados << rol
                }
            }
        }
        roles = rolesFiltrados
        roles.sort { r1, r2 ->
            r1.authority <=> r2.authority
        }
        Set userRoleNames = []
        for (role in usuario?.authorities) {
            userRoleNames << role.authority
        }
        LinkedHashMap<Rol, Boolean> roleMap = [:]
        for (role in roles) {
            roleMap[(role)] = userRoleNames.contains(role.authority)
        }
        return roleMap
    }

    def asignaRoles = { params ->
        def roles = [] as Set
        if (params.ROLE_ADMIN) {
            roles << Rol.findByAuthority('ROLE_ADMIN')
        } else if (params.ROLE_EVENTO) {
            roles << Rol.findByAuthority('ROLE_EVENTO')
        } else if (params.ROLE_ASISTENTE) {
            roles << Rol.findByAuthority('ROLE_ASISTENTE')
        } else {
            roles << Rol.findByAuthority('ROLE_USER')
        }
        return roles
    }
    
    
       
    //Foto
    @Secured(['ROLE_USER'])
    def imagen = {
        try {
                       
            def usuario = Usuario.get(params.id)
            def foto
            for(x in usuario?.imagenes) {
                foto = x
                break;
            }
            if (!foto) {
                def directorio = servletContext.getRealPath("/images")
                def file = new File("${directorio}/userT.png")
                foto = new Imagen(
                    nombre : 'userT.png'
                    , tipoContenido : 'image/png'
                    , tamano : file.size()
                    , archivo : file.getBytes()
                )
            }
            //log.debug "Mostrando imagen ${foto.nombre}"
            //log.debug "TipoContenido: ${foto.tipoContenido}"
            response.contentType = foto.tipoContenido
            //response.setHeader("Content-disposition", "attachment; filename=${foto?.nombre}")
            //log.debug "Tamano: ${foto.tamano}"
            response.contentLength = foto.tamano
            response.outputStream << foto.archivo
            //response.outputStream.flush()
            //return;
        } catch(Exception e) {
            log.error("No se pudo obtener la imagen", e)
        }
    }
}