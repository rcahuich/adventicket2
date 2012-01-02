
<%@ page import="general.TipoEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoEvento.lista" /></title>
	</head>
        
	<body>
          
          <div class="container">
          
            <div class="hero-unitCuenta">
                
                <ul class="tabs">
                  <li class="active"><a><g:message code="tipoEvento.lista" /></a></li>
                  <li><g:link action="nuevo"><g:message code="tipoEvento.nuevo" /></g:link></li>
                  <li><g:link controller="tipoSubEvento" ><g:message code="tipoEvento.tipoSubEvento" /></g:link></li>
                </ul>
                <br>
                
                <div id="list-tipoEvento" class="content scaffold-list" role="main">
			<div class="page-header">
                          <h1><g:message code="tipoEvento.lista" /> <small><g:message code="tipoEvento.listasubTitulo" /></small></h1>
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
					
						<g:sortableColumn property="nombre" title="${message(code: 'tipoEvento.nombre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoEventos}" status="i" var="tipoEvento">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="ver" id="${tipoEvento.id}">${fieldValue(bean: tipoEvento, field: "nombre")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
                        
			<div class="pagination">
				<g:paginate total="${totalTipoEventos}" />
			</div>
		</div>
                </div>
             </div>   
	</body>
</html>
