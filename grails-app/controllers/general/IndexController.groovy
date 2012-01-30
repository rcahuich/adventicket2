package general
import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class IndexController {
    
    def eventoService
    def springSecurityService
    
    def index = {
        if (SpringSecurityUtils.ifAnyGranted('ROLE_USER')) {
            log.debug "Roles para USER"
        }
        if (SpringSecurityUtils.ifAnyGranted('ROLE_ASISTENTE')) {
            log.debug "Roles para ASISTENTE"
        }
        if (SpringSecurityUtils.ifAnyGranted('ROLE_EVENTO')) {
            log.debug "Roles para EVENTO"
        }
        if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
            log.debug "Roles para ADMIN"
        }else{
            log.debug "Ningun ROL =("
        }
        
        
        
        log.debug "Pagina de inicio"
        def eventos = general.Evento.executeQuery("select evento from Evento evento where evento.fechaInicio >= :fechaActual and evento.statusCosto = :statusCosto and evento.statusSolicitud = :statusSolicitud and evento.statusEvento = :statusEvento ", [fechaActual: new Date(), statusCosto:"NO", statusSolicitud:"ACEPTADO",statusEvento:"ACTIVO"])
        [eventos: eventos]
    }
}
