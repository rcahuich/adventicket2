package general

class Evento {
    
    String nombre
    String lugar
    Date fechaInicio
    Date fechaFin
    TipoSubEvento tipoSubEvento
    BigDecimal costo
    Set usuario
    
    static belongsTo = Usuario
    static hasMany = [usuario: Usuario]
    

    static constraints = {
        fechaFin(validator: { val, obj ->
                    val?.after(obj.fechaInicio)
                })
    }
    
    static mapping = {
        table 'eventos'
    }
    
    String toString() {
        return nombre
    }
}
