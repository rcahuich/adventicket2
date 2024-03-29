
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
                    <a class="btn btn-primary" href="${createLink(controller:'evento', action:'nuevo')}"><i class="icon-plus-sign icon-white"></i> <g:message code="evento.nuevo" /></a>
                    |   Buscar por Nombre:
                    <g:remoteField class="input-medium search-query"
                                   name="search" 
                                   update="resultados" 
                                   paramName="nombre" 
                                   url="[controller:'evento', action:'busquedaPorNombre']">
                    </g:remoteField>
                </div>
                
                <div id="resultados">
                    <g:if test="${resultados}">

                    </g:if>
                    <g:else>
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
                                            <td><g:link action="ver" id="${evento.id}"><h5>${fieldValue(bean: evento, field: "nombre")}</h5></g:link></td>
                                            <td><h5><g:formatDate date="${evento?.fechaInicio}"/></h5></td>
                                            <td><h5><g:checkBox name="precio" value="${evento?.precio}" disabled="true"/></h5></td>
                                            <td><g:link controller="usuario" action="ver" id="${evento?.usuario?.id}"><h5>${fieldValue(bean: evento, field: "usuario.username")}</h5></g:link></td>
                                            <td><h5>${fieldValue(bean: evento, field: "statusSolicitud")}</td>
                                            <td><g:link action="edita" id="${evento.id}"><h5>Editar</h5></g:link></td>
                                          </tr>
                                  </g:each>
                                  </tbody>
                          </table>
                      </g:else>
                </div>   
			<div class="pagination">
				<g:paginate total="${totalEventos}" />
			</div>
		</div>
              </section>
             </div>   
	</body>
</html>
