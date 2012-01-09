
<%@ page import="general.Evento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="evento.lista" /></title>
	</head>
        
	<body>
          
          <div class="container">
          
            <div class="hero-unitCuenta">
                
                <ul class="tabs">
                  <li class="active"><a><g:message code="evento.lista" /></a></li>
                  <li><g:link action="nuevo"><g:message code="evento.nuevo" /></g:link></li>
                  
                </ul>
                <br>
                
                <div id="list-evento" class="content scaffold-list" role="main">
			<div class="page-header">
                          <h1><g:message code="evento.lista" /> <small><g:message code="evento.listasubTitulo" /></small></h1>
                        </div> 
                <br>        
                
                <g:if test="${flash.message}">
			<div class="alert-message info" data-alert="alert" >
                                <a class="close" href="#">&times;</a>
                                    ${flash.message}
                        </div>
                </g:if>
                        
			<table class="bordered-table zebra-striped">
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'evento.nombre')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.lugar')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.fechaInicio')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.fechaFin')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.tipoEvento')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.costo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventos}" status="i" var="evento">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="ver" id="${evento.id}">${fieldValue(bean: evento, field: "nombre")}</g:link></td>
						<td>${fieldValue(bean: evento, field: "lugar")}</td>
						<td>${fieldValue(bean: evento, field: "fechaInicio")}</td>
						<td>${fieldValue(bean: evento, field: "fechaFin")}</td>
						<td>${fieldValue(bean: evento, field: "tipoSubEvento")}</td>
						<td>${fieldValue(bean: evento, field: "costo")}</td>
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
                        
			<div class="pagination">
				<g:paginate total="${totalEventos}" />
			</div>
		</div>
                </div>
             </div>   
	</body>
</html>
