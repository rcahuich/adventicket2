
<%@ page import="general.Evento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="evento.lista" /></title>
	</head>
        
	<body>
          
          <div class="container">
            <section>
                <div class="well">
                      
			<div class="page-header">
                          <h1><g:message code="evento.lista" /> <small><g:message code="evento.listasubTitulo" /></small></h1>
                        </div> 
                <br>        
                
                <g:if test="${flash.message}">
			<div class="alert alert-info fade in" >
                                <a class="close" data-dismiss="alert" href="#">&times;</a>
                                    ${flash.message}
                        </div>
                </g:if>
                
                <div class="hero-unit">
                    Seleccione el Estatus de la Solicitud
                    <g:select name="filter" 
                      from="${['ENVIADO', 'ACEPTADO', 'CANCELADO', 'RECHAZADO']}"
                      valueMessagePrefix="filter" 
                      noSelection="['todos':'Todos']"
                      value="${filter}"
                      onchange="${remoteFunction(controller:'evento', action:'listaEventosPorAceptar', 
                                  update:'resultados',
                                  params:'\'filter=\' + escape(this.value)' )}" />
                </div>
                
                <div id="resultados">
                </div>   
                
		</div>
              </section>
             </div>   
	</body>
</html>
