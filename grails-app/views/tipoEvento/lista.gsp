
<%@ page import="general.TipoEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoEvento.lista" /></title>
	</head>
        
	<body>
          
          <div class="container">
            <section>
                <div class="well">

			<div class="page-header">
                          <h1><g:message code="tipoEvento.lista" /> <small><g:message code="tipoEvento.listasubTitulo" /></small></h1>
                        </div> 
                <br>        
                
                <g:if test="${flash.message}">
                  alert alert-info
			<div class="alert alert-info fade in">
                                <a class="close" data-dismiss="alert" href="#">&times;</a>
                                    ${flash.message}
                        </div>
                </g:if>
                
                  <form class="hero-unit">
                    <a class="btn btn-primary" href="${createLink(controller:'tipoEvento', action:'nuevo')}"><i class="icon-plus-sign icon-white"></i> <g:message code="tipoEvento.nuevo" /></a>
                   
                  </form>
                        
			<table class="table table-bordered">
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
              </section>
             </div>   
	</body>
</html>
