package general

class TipoEvento {
    
    String nombre
    
    static mapping = {
        table 'tipoEventos'
    }

    static constraints = {
    }
    
    String toString() {
        return nombre
    }
}
