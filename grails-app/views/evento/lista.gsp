
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
                      <form class="well form-search">
                        <a class="btn btn-primary" href="${createLink(controller:'evento', action:'nuevo')}"><i class="icon-plus-sign icon-white"></i> <g:message code="evento.nuevo" /></a>
                        <input type="text" class="input-medium search-query">
                        <button type="submit" class="btn">Buscar</button>
                      </form>
			<table class="table table-bordered">
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'evento.nombre')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.fechaInicio')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.costo')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.usuario')}" />
                                                <g:sortableColumn property="status" title="${message(code: 'evento.status')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.modifica')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventos}" status="i" var="evento">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="ver" id="${evento.id}">${fieldValue(bean: evento, field: "nombre")}</g:link></td>
						<td><g:formatDate date="${evento?.fechaInicio}"/></td>
						<td>${fieldValue(bean: evento, field: "costo")}</td>
                                                <td><g:link controller="usuario" action="ver" id="${evento?.usuario?.id}">${fieldValue(bean: evento, field: "usuario.username")}</g:link></td>
                                                <td>${fieldValue(bean: evento, field: "statusSolicitud")}</td>
                                                <td><g:link action="edita" id="${evento.id}">Editar</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
                        
			<div class="pagination">
				<g:paginate total="${totalEventos}" />
			</div>
		</div>
              </section>
             </div>   
	</body>
</html>
