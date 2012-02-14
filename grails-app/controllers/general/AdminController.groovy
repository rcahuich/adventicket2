package general

import grails.converters.JSON
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

@Secured(['ROLE_ADMIN'])
class AdminController {
     
    def admin = {
        log.debug "Bienvenido Jefe xD"
    }
}
