import general.*

class BootStrap {

    def springSecurityService
    
    def init = { servletContext ->
        log.debug "Iniciando aplicacion"
        
        log.debug "Validando roles"
        def rolAdmin = Rol.findByAuthority('ROLE_ADMIN') ?: new Rol(authority: 'ROLE_ADMIN').save(failOnError: true)
        def rolEvento = Rol.findByAuthority('ROLE_EVENTO') ?: new Rol(authority: 'ROLE_EVENTO').save(failOnError: true)
        def rolAsistente = Rol.findByAuthority('ROLE_ASISTENTE') ?: new Rol(authority: 'ROLE_ASISTENTE').save(failOnError: true)
        def rolUser = Rol.findByAuthority('ROLE_USER') ?: new Rol(authority: 'ROLE_USER').save(failOnError: true)
              
        log.debug "Validando usuarios"
        def admin = UsuarioRol.findByRol(rolAdmin)
        if (!admin) {
            admin = new Usuario(
                username:'admin',
                password:'admin',
                nombre: 'Ruben A.',
                apellidoPaterno: 'Cahuich',
                apellidoMaterno: '',
                fechaDeNacimiento: '07/12/2011',
                sexo: 'Masculino',
                telefono: '1234567890',
                correo: 'rcc@um.edu.mx'
            )
            admin.save(flush:true)
            UsuarioRol.create(admin, rolAdmin, true)
        }

        log.debug "Aplicacion inicializada"
    }
    def destroy = {
    }
}
