package general

class Evento {
    
    String nombre
    Date fechaInicio
    Date fechaFin
    TipoSubEvento tipoSubEvento
    BigDecimal costo
    Set usuario
    
    static belongsTo = [Usuario]

    static constraints = {
        
    }
    
    static mapping = {
        table 'eventos'
    }
    
    String toString() {
        return nombre
    }
}
