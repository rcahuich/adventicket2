package general

class Evento {
    
    String nombre
    String descripcion
    String quienesPuedenAsistir
    Integer capacidad = 0
    String nombreConferencias
    String nombrePonentes
    BigDecimal costo = new BigDecimal('0')
    String queIncluyeElPago
    Integer numeroComidas = 0
    BigDecimal costoComida = new BigDecimal('0')
    //Si hay descuento por pago anticipado
    boolean descuento = false
    BigDecimal costoPagoAnticipado = new BigDecimal('0')
    Date finPagoAnticipado
    //Lugar del Evento
    String lugarDescripcion
    String calle
    String ciudad
    String pais
    //Fechas
    Date fechaInicio
    Date fechaFin
    Date cierreInscripciones
    //Tipo de Evento
    TipoSubEvento tipoSubEvento
    //Costo
    Usuario usuario
    Set asistentes
    String statusSolicitud
    String statusEvento
    String statusCosto
    //Donde tener contacto para el evento
    String contacto
    String telefono
    String correo
    
    static belongsTo = Usuario
    static hasMany = [asistentes: Usuario]
    

    static constraints = {
        nombre blank:false
        descripcion blank:false, maxSize: 600
        quienesPuedenAsistir blank:false, maxSize: 600
        nombreConferencias blank:true, maxSize: 600
        nombrePonentes blank:true, maxSize: 600
        queIncluyeElPago maxSize: 600
        fechaFin(validator: { val, obj ->
                    val?.after(obj.fechaInicio)
                })
        finPagoAnticipado(validator: { val, obj ->
                    if(obj.descuento == true){val?.after(obj.fechaFin)}
                })
        cierreInscripciones(validator: { val, obj ->
                    val?.before(obj.fechaInicio)
                })
        statusSolicitud inList: ["ACEPTADO", "RECHAZADO", "CANCELADO", "ENVIADO"]
        statusEvento inList: ["ACTIVO", "INACTIVO", "STANBY"]
        statusCosto inList: ["SI", "NO"]
        pais inList:['Mexico','Anguila','Antigua & Barbuda','Antillas Holandesas'
                    ,'Aruba','Bahamas','Barbados'
                    ,'Belize','Colombia','Costa Rica'
                    ,'Cuba','Dominica','Ecuador'
                    ,'El Salvador','Estados Unidos','Granada'
                    ,'Guadalupe','Guatemala','Guyana'
                    ,'Guyana Francesa','Haiti','Honduras'
                    ,'Islas Caiman','Islas Turcas y Caicos','Islas Virgenes (U.K)'
                    ,'Islas Virgenes (U.S)','Jamaica','Martinica'
                    ,'Monserrat','Nicaragua'
                    ,'Panama','Puerto Rico','Republica Dominicana'
                    ,'Saint Kitts & Nevis','St. Lucia','St. Vicente & Las Gradinas'
                    ,'Surinam','Trinidad y Tobago','Venezuela','Otro...']
        telefono matches:"[0-9]{10}"
        correo mail:true
    }
    
    static mapping = {
        table 'eventos'
    }
    
    String toString() {
        return nombre
    }
}
