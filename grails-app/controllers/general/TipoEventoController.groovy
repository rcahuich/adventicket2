package general

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
class TipoEventoController {

    static allowedMethods = [crea: "POST", actualiza: "POST", elimina: "POST"]

    def index = {
        redirect(action: "lista", params: params)
    }
    
    def lista = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tipoEventos: TipoEvento.list(params), totalTipoEventos: TipoEvento.count()]
    }
    
    def nuevo = {
        def tipoEvento = new TipoEvento()
        tipoEvento.properties = params

        return [tipoEvento: tipoEvento]
    }
    
    def crea = {
        TipoEvento.withTransaction {
            def tipoEvento = new TipoEvento(params)
            
            if (tipoEvento.save(flush: true)) {
                flash.message = message(code: 'tipoEvento.creo', args: [tipoEvento.nombre])
                redirect(action: "ver", id: tipoEvento.id)
                               
            } else {
                log.error("Hubo un error al crear el tipo de Evento ${tipoEvento.errors}")
                render(view: "nuevo", model: [tipoEvento: tipoEvento])
            }
        }
    }
    
    def ver = {
        def tipoEvento = TipoEvento.get(params.id)
        
        if (!tipoEvento) {
            flash.message = message(code: 'tipoEvento.noVer', args: [tipoEvento.nombre])
            redirect(action: "lista")
        }
        else {
            return [tipoEvento: tipoEvento]
        }
    }
    
    def edita = {
        
        def tipoEvento = TipoEvento.get(params.id)
        if (!tipoEvento) {
            flash.message = message(code: 'tipoEvento.noEdita', args: [tipoEvento.nombre])
            redirect(action: "lista")
        }
        else {
            return [tipoEvento: tipoEvento]
        }
    }
    
    def actualiza = {
        TipoEvento.withTransaction {
            def tipoEvento = TipoEvento.get(params.id)
            if (tipoEvento) {
                if (params.version) {
                    def version = params.version.toLong()
                    if (tipoEvento.version > version) {
                        
                        tipoEvento.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tipoEvento.label', default: 'Tipo de Evento')] as Object[], "Another user has updated this tipoEvento while you were editing")
                        render(view: "edita", model: [tipoEvento: tipoEvento])
                        return
                    }
                }
                
                tipoEvento.properties = params
                
               if (!tipoEvento.hasErrors() && tipoEvento.save(flush: true)) {
                
                    flash.message = message(code: 'tipoEvento.actualiza', args: [tipoEvento.nombre])
                    redirect(action: "ver", id: tipoEvento.id)
               }

               if (!tipoEvento.save(flush: true)) {
                    render(view: "edita", model: [tipoEvento: tipoEvento])
                    return
                }
                
            }
            else {
                
                flash.message = message(code: 'tipoEvento.noActualiza', args: [tipoEvento.nombre])
                redirect(action: "lista")
            }
        }
    }
    
    def elimina = {
        def tipoEvento = TipoEvento.get(params.id)
        def nombre = tipoEvento.nombre
        if (!tipoEvento) {
            flash.message = message(code: 'tipoEvento.noId', args: [tipoEvento.id])
            redirect(action: "lista")
            return
        }

        try {
            tipoEvento.delete(flush: true)
            flash.message = message(code: 'tipoEvento.elimino', args: [nombre])
            redirect(action: "lista")
        }   catch (org.springframework.dao.DataIntegrityViolationException e) {
            flash.message = message(code: 'tipoEvento.noElimino', args: [nombre])
            redirect(action: "ver", id: params.id)
        }
    }
    
}
