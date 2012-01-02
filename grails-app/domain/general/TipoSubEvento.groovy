package general

class TipoSubEvento {
    
    String nombre
    TipoEvento tipoEvento
    
    static belongsTo = [tipoEvento : TipoEvento]
    
    static mapping = {
        table 'tipoSubEventos'
    }

    static constraints = {
    }
    
    String toString(){
        return "$nombre | $tipoEvento"
    }
}