package general
import grails.converters.JSON
import grails.plugins.springsecurity.Secured 
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import java.util.regex.Matcher;
import java.util.regex.Pattern;

class IndexController {
    
    def eventoService
    def springSecurityService
    
    def index = {
        def eventos = general.Evento.executeQuery("select evento from Evento evento where evento.fechaInicio >= :fechaActual and evento.statusSolicitud = :statusSolicitud and evento.statusEvento = :statusEvento ", [fechaActual: new Date(), statusSolicitud:"ACEPTADO",statusEvento:"ACTIVO", max:4])
        [eventos: eventos]
    }
    
    def index2 = {
        
    }
    
    def solicitud = {
        
        String nombre = params.nombre
        String email = params.email
        String comentario = params.comentario
        
        if (nombre.isEmpty() || nombre == null){
            render "El campo -Nombre- no puede ser vacio"
            return
        }else
        if(email.isEmpty() || email == null){
            render "El campo -Email- no puede ser vacio"
            return
        }else
        if(comentario.isEmpty() || comentario == null){
            render "El campo -Comentario- no puede ser vacio"
            return
        }else
        if(!comentario.isEmpty() && validaEmail(email) == false){
                render "Introduzca un correo electronico valido"
                return
        }
        else{
            try {
                sendMail {
                    to      "hospitalgdl@gmail.com"
                    subject "Solicitud de Informacion"
                    body     """
                                   Nombre: ${params.nombre},
                                   Email: ${params.email},
                                   Comentario: ${params.comentario},

                                   Solicitud de Informacion.
                                   Thanks"""
            }
            def mensaje = message(code: 'solicitud.Envio')
            render "$mensaje"
            } catch(Exception e) {
                log.error "Problema al enviar el mail = $e.message", e
                flash.error = message(code: 'solicitud.noEnvio')
            }
        }
    }
    
    boolean validaEmail(def mail){
        Pattern pat = null;
        Matcher mat = null;
        pat = Pattern.compile("[a-zA-Z0-9][a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)*@[a-zA-Z0-9_]+(\\.[a-zA-Z]+)+")
        mat = pat.matcher(mail)
        if (mat.find()) {
            return true
        }else{
            return false
        }        
    }
}
