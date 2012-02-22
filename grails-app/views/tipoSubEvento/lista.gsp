
<%@ page import="general.TipoSubEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoSubEvento.lista" /></title>
	</head>
        
	<body>
          
          <div class="container">
              <section>        
                <div class="well">

			<div class="page-header">
                          <h1><g:message code="tipoSubEvento.lista" /> <small><g:message code="tipoSubEvento.listasubTitulo" /></small></h1>
                        </div> 
                <br>        
                
                <g:if test="${flash.message}">
			<div class="alert alert-info fade in" >
                                <a class="close" data-dismiss="alert" href="#">&times;</a>
                                    ${flash.message}
                        </div>
                </g:if>
                          <form class="well form-search">
                            <a class="btn btn-primary" href="${createLink(controller:'tipoSubEvento', action:'nuevo')}"><i class="icon-plus-sign icon-white"></i> <g:message code="tipoSubEvento.nuevo" /></a>
                            <input type="text" class="input-medium search-query">
                            <button type="submit" class="btn">Buscar</button>
                          </form>
			<table class="table table-bordered">
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
                </section>
             </div>   
	</body>
</html>
