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
                password:'admin00',
                nombre: 'Ruben A.',
                apellidoPaterno: 'Cahuich',
                apellidoMaterno: '',
                fechaDeNacimiento: '07/10/2011',
                sexo: 'Masculino',
                correo: 'rcc@um.edu.mx'
            )
            admin.save(flush:true)
            UsuarioRol.create(admin, rolAdmin, true)
        }
        
        println "Creando Tipos de Eventos Inicial"
        def tipoEvento = TipoEvento.findByNombre("Campamentos")
        if (!tipoEvento) {
            tipoEvento = new TipoEvento(
            nombre: 'Campamentos'
            )
            tipoEvento.save(flush:true)
            println "Tipo de Evento creado > $tipoEvento"
        }    
        
        println "Creando SubTiposEvento Inicial"
        def tipoSubEvento = TipoSubEvento.findByNombre("Jovenes")
        if (!tipoSubEvento) {
            tipoSubEvento = new TipoSubEvento(
                nombre: 'Jovenes',
                tipoEvento: tipoEvento
            )    
            tipoSubEvento.save(flush:true)
            println "SubTipo de Evento creado > $tipoSubEvento"
        }

        log.debug "Aplicacion inicializada"
    }
    def destroy = {
    }
}
