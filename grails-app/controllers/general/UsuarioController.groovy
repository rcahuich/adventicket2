package general

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils


class UsuarioController {

    def springSecurityService

    static allowedMethods = [crea: "POST", actualiza: "POST", elimina: "POST"]

    def index = {
        redirect(action: "lista", params: params)
    }

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
            def usuario = new Usuario(params)
            
            if (usuario.save(flush: true)) {
                def roles = asignaRoles(params)
                for(rol in roles) {
                    UsuarioRol.create(usuario, rol, false)
                }
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.username])
                redirect(action: "ver", id: usuario.id)
            } else {
                log.error("Hubo un error al crear el usuario ${usuario.errors}")
                render(view: "nuevo", model: [usuario: usuario])
            }
        }
    }

    def ver = {
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
                if (usuario.password != params.password) {
                    usuario.password = springSecurityService.encodePassword(params.password)
                }
                params.remove('password')
                usuario.properties = params

                if (!usuario.hasErrors() && usuario.save(flush: true)) {
                    UsuarioRol.removeAll(usuario)
                    def roles = asignaRoles(params)
                    for(rol in roles) {
                        UsuarioRol.create(usuario, rol, false)
                    }
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.username])
                    redirect(action: "ver", id: usuario.id)
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
                def nombre = usuario.username
                UsuarioRol.removeAll(usuario)
                usuario.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), nombre])
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
        log.debug "Obteniendo lista de roles"
        def roles = Rol.list()

        def rolesFiltrados = [] as Set
        if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
            log.debug "Roles para ADMIN"
            rolesFiltrados = roles
        } else if(SpringSecurityUtils.ifAnyGranted('ROLE_EVENTO')) {
            log.debug "Roles para EVENTO"
            for(rol in roles) {
                if (!rol.authority.equals('ROLE_ADMIN') && !rol.authority.equals('ROLE_EVENTO')) {
                    rolesFiltrados << rol
                }
            }
        } else if(SpringSecurityUtils.ifAnyGranted('ROLE_ASISTENTE')) {
            log.debug "Roles para ASISTENTE"
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
        } else if (params.ROLE_ORG) {
            roles << Rol.findByAuthority('ROLE_EVENTO')
        } else if (params.ROLE_EMP) {
            roles << Rol.findByAuthority('ROLE_ASISTENTE')
        } else {
            roles << Rol.findByAuthority('ROLE_USER')
        }
        return roles
    }
}