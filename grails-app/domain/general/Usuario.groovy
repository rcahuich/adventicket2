package general

class Usuario {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false
        String nombre
        String apellidoPaterno
        String apellidoMaterno
        Date fechaDeNacimiento
        String sexo
        String correo
        String nombreCompleto
        //Foto
        Set imagenes
        //Eventos
        Set evento
        
        static transients = ['nombreCompleto']
        static hasMany = [imagenes: Imagen, evento: Evento]

	static constraints = {
		username blank: false, unique: true
		password blank: false
                nombre   blank: false, maxSize: 64
                apellidoPaterno blank: false, maxSize: 64
                apellidoMaterno blank: true, maxSize: 64
                sexo inList: ["Femenino", "Masculino"]
                correo   blank: false, maxSize: 128, email:true
                
	}

	static mapping = {
                table 'usuarios'
		password column: '`password`'
                imagenes cascade:'all-delete-orphan'
	}

	Set<Rol> getAuthorities() {
		UsuarioRol.findAllByUsuario(this).collect { it.rol } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
        
        String getNombreCompleto() {
            if(apellidoMaterno == ""){
                return "$nombre $apellidoPaterno "
            }else{
                return "$nombre $apellidoPaterno $apellidoMaterno"
            }
        }
        
        static final passwordValidator = { String password, obj ->
		if (obj.username && obj.username.equals(password)) {
			return 'command.password.error.username'
		}

		if (password && password.length() >= 8 && password.length() <= 64 &&
				(!password.matches('^.*\\p{Alpha}.*$') ||
				!password.matches('^.*\\p{Digit}.*$') ||
				!password.matches('^.*[!@#$%^&].*$'))) {
			return 'command.password.error.strength'
		}
	}

	static final password2Validator = { value, command ->
		if (command.password != command.password2) {
			return 'command.password2.error.mismatch'
		}
	}
        
        String toString() {
            return nombreCompleto
        }
}
