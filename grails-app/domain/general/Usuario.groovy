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
        String telefono
        String correo
        String nombreCompleto
        
        static transients = ['nombreCompleto']

	static constraints = {
		username blank: false, unique: true
		password blank: false
                nombre   blank: false, maxSize: 64
                apellidoPaterno blank: false, maxSize: 64
                apellidoMaterno blank: true, maxSize: 64
                correo   blank: false, maxSize: 128, email:true
                telefono blank: false, size:1..10
	}

	static mapping = {
                table 'usuarios'
		password column: '`password`'
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
                return "$apellidoPaterno, $nombre"
            }else{
                return "$apellidoPaterno $apellidoMaterno, $nombre"
            }
        }
        
        String toString() {
            return nombreCompleto
        }
}
