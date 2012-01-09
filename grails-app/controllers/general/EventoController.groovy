package general

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ASISTENTE'])
class EventoController {

    static allowedMethods = [crea: "POST", actualiza: "POST", elimina: "POST"]

    def index = {
        redirect(action: "lista", params: params)
    }
    
    def lista = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [eventos: Evento.list(params), totalEventos: Evento.count()]
    }
    
    def nuevo = {
        def evento = new Evento()
        evento.properties = params

        return [evento: evento]
    }
    
    def crea = {
        Evento.withTransaction {
            def evento = new Evento(params)
            
            if (evento.save(flush: true)) {
                flash.message = message(code: 'evento.creo', args: [evento.nombre])
                redirect(action: "ver", id: evento.id)
                               
            } else {
                log.error("Hubo un error al crear el tipo de Evento ${evento.errors}")
                render(view: "nuevo", model: [evento: evento])
            }
        }
    }
    
    def ver = {
        def evento = Evento.get(params.id)
        
        if (!evento) {
            flash.message = message(code: 'evento.noVer', args: [evento.nombre])
            redirect(action: "lista")
        }
        else {
            return [evento: evento]
        }
    }
    
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
                redirect(action: "lista")
            }
        }
    }
    
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
}
