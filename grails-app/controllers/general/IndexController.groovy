package general
import grails.converters.JSON
import grails.plugins.springsecurity.Secured 
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class IndexController {
    
    def eventoService
    def springSecurityService
    
    def index = {
        log.debug "Pagina de inicio"
        def eventos = general.Evento.executeQuery("select evento from Evento evento where evento.fechaInicio >= :fechaActual and evento.statusSolicitud = :statusSolicitud and evento.statusEvento = :statusEvento ", [fechaActual: new Date(), statusSolicitud:"ACEPTADO",statusEvento:"ACTIVO", max:4])
        [eventos: eventos]
    }
    
    def index2 = {
        
    }
}
