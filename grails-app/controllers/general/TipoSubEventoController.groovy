package general

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
class TipoSubEventoController {

    static allowedMethods = [crea: "POST", actualiza: "POST", elimina: "POST"]

    def index = {
        redirect(action: "lista", params: params)
    }
    
    def lista = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tipoSubEventos: TipoSubEvento.list(params), totalTipoSubEventos: TipoSubEvento.count()]
    }
    
    def nuevo = {
        def tipoSubEvento = new TipoSubEvento()
        tipoSubEvento.properties = params

        return [tipoSubEvento: tipoSubEvento]
    }
    
    def crea = {
        TipoSubEvento.withTransaction {
            def tipoSubEvento = new TipoSubEvento(params)
            
            if (tipoSubEvento.save(flush: true)) {
                flash.message = message(code: 'tipoSubEvento.creo', args: [tipoSubEvento.nombre])
                redirect(action: "ver", id: tipoSubEvento.id)
                               
            } else {
                log.error("Hubo un error al crear el tipo de Evento ${tipoSubEvento.errors}")
                render(view: "nuevo", model: [tipoSubEvento: tipoSubEvento])
            }
        }
    }
    
    def ver = {
        def tipoSubEvento = TipoSubEvento.get(params.id)
        
        if (!tipoSubEvento) {
            flash.message = message(code: 'tipoSubEvento.noVer', args: [tipoSubEvento.nombre])
            redirect(action: "lista")
        }
        else {
            return [tipoSubEvento: tipoSubEvento]
        }
    }
    
    def edita = {
        
        def tipoSubEvento = TipoSubEvento.get(params.id)
        if (!tipoSubEvento) {
            flash.message = message(code: 'tipoSubEvento.noEdita', args: [tipoSubEvento.nombre])
            redirect(action: "lista")
        }
        else {
            return [tipoSubEvento: tipoSubEvento]
        }
    }
    
    def actualiza = {
        TipoSubEvento.withTransaction {
            def tipoSubEvento = TipoSubEvento.get(params.id)
            if (tipoSubEvento) {
                if (params.version) {
                    def version = params.version.toLong()
                    if (tipoSubEvento.version > version) {
                        
                        tipoSubEvento.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tipoSubEvento.label', default: 'Tipo de Evento')] as Object[], "Another user has updated this tipoSubEvento while you were editing")
                        render(view: "edita", model: [tipoSubEvento: tipoSubEvento])
                        return
                    }
                }
                
                tipoSubEvento.properties = params
                
                if (!tipoSubEvento.hasErrors() && tipoSubEvento.save(flush: true)) {
                
                    flash.message = message(code: 'tipoSubEvento.actualiza', args: [tipoSubEvento.nombre])
                    redirect(action: "ver", id: tipoSubEvento.id)
               }

               if (!tipoSubEvento.save(flush: true)) {
                    render(view: "edita", model: [tipoSubEvento: tipoSubEvento])
                    return
                }
            }
            else {
                flash.message = message(code: 'tipoSubEvento.noActualiza', args: [tipoSubEvento.nombre])
                redirect(action: "lista")
            }
        }
    }
    
    def elimina = {
        def tipoSubEvento = TipoSubEvento.get(params.id)
        def nombre = tipoSubEvento.nombre
        if (!tipoSubEvento) {
            flash.message = message(code: 'tipoSubEvento.noId', args: [tipoSubEvento.id])
            redirect(action: "lista")
            return
        }

        try {
            tipoSubEvento.delete(flush: true)
            flash.message = message(code: 'tipoSubEvento.elimino', args: [nombre])
            redirect(action: "lista")
        }   catch (org.springframework.dao.DataIntegrityViolationException e) {
            flash.message = message(code: 'tipoSubEvento.noElimino', args: [nombre])
            redirect(action: "ver", id: params.id)
        }
    }
}
