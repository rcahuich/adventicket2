package general

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

//@Secured(['ROLE_ASISTENTE'])
class EventoController {

    def springSecurityService
    
    static allowedMethods = [crea: "POST", actualiza: "POST", elimina: "POST"]
    @Secured(['ROLE_ADMIN'])
    def index = {
        redirect(action: "lista", params: params)
    }
    
    @Secured(['ROLE_ADMIN'])
    def lista = {
        params.max = Math.min(params.max ? params.int('max') : 2, 100)
        [eventos: Evento.list(params), totalEventos: Evento.count()]
    }
    
    @Secured(['ROLE_ASISTENTE'])
    def nuevo = {
        def evento = new Evento()
        evento.properties = params

        return [evento: evento]
    }
    
    @Secured(['ROLE_ASISTENTE'])
    def crea = {
        log.debug "Params: $params"
        Evento.withTransaction {
            
            def evento = new Evento(params)
            
            Usuario usuario = Usuario.get(springSecurityService.getPrincipal().id)
            evento.usuario = usuario
        log.debug "parmas de precio: $params.precio"
        log.debug "ahora con el evento precio: $evento.precio"
            
            if(evento.precio == true){
                log.debug "Con costo"
                evento.statusSolicitud = "ENVIADO"//"ACEPTADO", "RECHAZADO", "CANCELADO", "ENVIADO"
                evento.statusEvento = "ACTIVO"
            }else{
                log.debug "Sin costo"
                evento.costo = 0
                evento.statusSolicitud = "ACEPTADO"
                evento.statusEvento = "ACTIVO"
             }
            
            if (evento.save(flush: true)) {
                
                if(evento.precio == true){
                    flash.message = message(code: 'evento.creoConPrecio', args: [evento.nombre])
                    redirect( controller: "usuario", action: "ver")
                }else{
                    flash.message = message(code: 'evento.creoSinPrecio', args: [evento.nombre])
                    redirect( action: "ver", id: evento.id)
                }
                               
            } else {
                log.error("Hubo un error al crear el tipo de Evento ${evento.errors}")
                render(view: "nuevo", model: [evento: evento])
            }
        }
    }
    
    
    def ver = {
        def evento = Evento.get(params.id)
        
        if (!evento) {
            flash.message = message(code: 'evento.noVer')
            redirect(uri: "/")
        }
        
        log.debug "REGLAS"
        log.debug "precio: $evento.precio"
        log.debug "statusSolicitud $evento.statusSolicitud"
        log.debug "statusEvento $evento.statusEvento"
        
        if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')){
                log.debug "EL ADMINISTRADOR ESTA VIENDO EL EVENTO"
                return [evento: evento]
        }else{
                if(evento.precio == true && evento.statusSolicitud.equals("ENVIADO")){
                    log.debug "El evento aun no ha sido aceptado se encuentra con estatus precioTRUE y solicitudENVIADO"
                    flash.message = message(code:'evento.noAccesoNOACEPTADO', args: [evento.nombre])
                    redirect( controller: "usuario", action: "ver")
                }
                else
                if(evento.statusSolicitud.equals("RECHAZADO")){
                    log.debug "El evento ha sido RECHAZADO"
                    flash.message = message(code:'evento.noAccesoRECHAZADO', args: [evento.nombre])
                    redirect( controller: "usuario", action: "ver")
                }
                else
                if(evento.statusSolicitud.equals("CANCELADO")){
                    log.debug "El evento ha sido CANCELADO"
                    flash.message = message(code:'evento.noAccesoCANCELADO', args: [evento.nombre])
                    redirect( controller: "usuario", action: "ver")
                }
                else
                if(evento.statusEvento.equals("STANBY")){
                    log.debug "El evento ha sido puesto en STANBY"
                    flash.message = message(code:'evento.noAccesoSTANBY', args: [evento.nombre])
                    redirect( controller: "usuario", action: "ver")
                }
                else
                if((evento.precio == false || evento.precio == true) && evento.statusSolicitud.equals("ACEPTADO") && evento.statusEvento.equals("ACTIVO")){
                    log.debug "El evento es aceptado"
                    return [evento: evento]
                }
                else {
                    flash.message = message(code: 'evento.noAcceso', args: [evento.nombre])
                    log.debug "ELSE"
                    redirect( controller: "usuario", action: "ver")
                }
            }
        
    }
    
    @Secured(['ROLE_ASISTENTE'])
    def edita = {
        
        def evento = Evento.get(params.id)
        if (!evento) {
            flash.message = message(code: 'evento.noEdita', args: [evento.nombre])
            redirect(action: "lista")
        }
        else {
            return [evento: evento]
        }
    }
    
    @Secured(['ROLE_ASISTENTE'])
    def actualiza = {
        Evento.withTransaction {
            def evento = Evento.get(params.id)
            if (evento) {
                if (params.version) {
                    def version = params.version.toLong()
                    if (evento.version > version) {
                        
                        evento.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'evento.label', default: 'Tipo de Evento')] as Object[], "Another user has updated this evento while you were editing")
                        render(view: "edita", model: [evento: evento])
                        return
                    }
                }
                
                evento.properties = params
                
               if (!evento.hasErrors() && evento.save(flush: true)) {
                
                    flash.message = message(code: 'evento.actualiza', args: [evento.nombre])
                    redirect(action: "ver", id: evento.id)
               }

               if (!evento.save(flush: true)) {
                    render(view: "edita", model: [evento: evento])
                    return
                }
                
            }
            else {
                
                flash.message = message(code: 'evento.noActualiza', args: [evento.nombre])
                redirect(controller:"usuario", action: "ver")
            }
        }
    }
    
    @Secured(['ROLE_ASISTENTE'])
    def asistir = {
        Evento evento = Evento.get(params.id)
        
        if (springSecurityService.isLoggedIn()){
        
        Evento.withTransaction {
        
        def usuario = Usuario.get(springSecurityService.getPrincipal().id)
        //def usuario =  springSecurityService.currentUser
        log.debug "Usuario: $usuario"

           if(evento){
                
                log.debug "Evento: $evento"
                log.debug "Usuario: $usuario"
                
                if(!evento.findByAsistentes(usuario)){
                    log.debug "El $usuario NO se ha registrado, por lo tanto SI puede asistir al evento"
                    evento.asistentes = usuario
                    evento.asistentes.asistir = true
                }else{
                    log.debug "El $usuario YA se ha registrado, por lo tanto NO puede asistir al evento"
                    flash.message = message(code: 'evento.asistirExiste', args: [evento.nombre])
                    redirect(action: "ver", id: evento.id)
                }
                
                if (!evento.hasErrors() && evento.save(flush: true)) {
                    
                    log.debug "El usuario: $usuario, asistira al evento: $evento"
                    flash.message = message(code: 'evento.asistir', args: [evento.nombre])
                    redirect(action: "ver", id: evento.id)
               }

                
            } else {
                
                flash.message = message(code: 'evento.noAsistir', args: [evento.nombre])
                redirect(action: "ver", id: evento.id)
            }
        
            }
        } else{
                flash.message = message(code: 'evento.loguearse')
                redirect(action: "ver", id: evento.id)
            }
    }
    
    @Secured(['ROLE_ASISTENTE'])
    def elimina = {
        def evento = Evento.get(params.id)
        def nombre = evento.nombre
        if (!evento) {
            flash.message = message(code: 'evento.noId', args: [evento.id])
            redirect(action: "lista")
            return
        }

        try {
            evento.delete(flush: true)
            flash.message = message(code: 'evento.elimino', args: [nombre])
            redirect(action: "lista")
        }   catch (org.springframework.dao.DataIntegrityViolationException e) {
            flash.message = message(code: 'evento.noElimino', args: [nombre])
            redirect(action: "ver", id: params.id)
        }
    }
    
    def eventos = {
        
    }
}
