
<%@ page import="general.TipoSubEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoSubEvento.lista" /></title>
	</head>
        
	<body>
          
          <div class="container">
          
            <div class="hero-unitCuenta">
                
                <ul class="tabs">
                  <li class="active"><a><g:message code="tipoSubEvento.lista" /></a></li>
                  <li><g:link action="nuevo"><g:message code="tipoSubEvento.nuevo" /></g:link></li>
                <li><g:link controller="tipoEvento" ><g:message code="tipoSubEvento.tipoEvento" /></g:link></li>
                </ul>
                <br>
                
                <div id="list-tipoSubEvento" class="content scaffold-list" role="main">
			<div class="page-header">
                          <h1><g:message code="tipoSubEvento.lista" /> <small><g:message code="tipoSubEvento.listasubTitulo" /></small></h1>
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
					
						<g:sortableColumn property="nombre" title="${message(code: 'tipoSubEvento.nombre')}" />
						<g:sortableColumn property="tipoEvento" title="${message(code: 'tipoSubEvento.tipoEvento')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoSubEventos}" status="i" var="tipoSubEvento">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="ver" id="${tipoSubEvento.id}">${fieldValue(bean: tipoSubEvento, field: "nombre")}</g:link></td>
						<td>${fieldValue(bean: tipoSubEvento, field: "tipoEvento")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
                        
			<div class="pagination">
				<g:paginate total="${totalTipoSubEventos}" />
			</div>
		</div>
                </div>
             </div>   
	</body>
</html>
