package general

class CodigoRegistracion {

        String username
	String token = UUID.randomUUID().toString().replaceAll('-', '')
	Date fechaCreada = new Date()

	static mapping = {
		version false
	}
}
