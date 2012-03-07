package general

class EventoService {

    List<Evento> eventosPorVenir(){
        log.debug "Buscando Eventos por venir"
        def eventos = general.Evento.executeQuery("select evento from Evento evento where evento.fechaInicio >= :fechaActual", [fechaActual: new Date()])
        log.debug "Eventos encontrados: $eventos"
        return [lista:eventos]
    }
    

}
