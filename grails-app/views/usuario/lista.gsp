
<%@ page import="general.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="usuario.lista" /></title>
	</head>
        
	<body>
          
          <div class="container">
            <section>
                <div class="well">
                        <div class="page-header">
                          <h1><g:message code="usuario.lista" /> <small><g:message code="usuario.listaDeUsuarios" /></small></h1>
                        </div> 
                <br>

                <g:if test="${flash.message}">
			<div class="alert alert-info fade in" >
                                <a class="close" data-dismiss="alert" href="#">&times;</a>
                                    ${flash.message}
                        </div>
                </g:if>
                
                  <div class="hero-unit">
                    <a class="btn btn-primary" href="${createLink(controller:'usuario', action:'nuevo')}"><i class="icon-plus-sign icon-white"></i> <g:message code="usuario.nuevo" /></a>
                    |   Buscar por Nombre:
                    <g:remoteField class="input-medium search-query"
                                   name="search" 
                                   update="resultados" 
                                   paramName="nombre" 
                                   url="[controller:'usuario', action:'busquedaPorNombre']">
                    </g:remoteField>
                  </div>
                
                            <div id="resultados">
                              <g:if test="${resultados}">
                              
                              </g:if>
                              <g:else>
                                <table class="table table-bordered">
                                        <thead>
                                                <tr>

                                                        <g:sortableColumn property="username" title="${message(code: 'usuario.username')}" />

                                                        <g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre')}" />

                                                        <g:sortableColumn property="correo" title="${message(code: 'usuario.correo')}" />

                                                        <g:sortableColumn property="correo" title="${message(code: 'usuario.authorities')}" />

                                                </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${usuarios}" status="i" var="usuario">
                                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                                        <td><g:link action="ver" id="${usuario.id}">${fieldValue(bean: usuario, field: "username")}</g:link></td>

                                                        <td>${fieldValue(bean: usuario, field: "nombreCompleto")}</td>

                                                        <td>${fieldValue(bean: usuario, field: "correo")}</td>

                                                        <td>${fieldValue(bean: usuario, field: "authorities")}</td>

                                                </tr>
                                        </g:each>
                                        </tbody>
                                </table>
                              </g:else>
                            </div>
                        
			<div class="pagination">
				<g:paginate total="${totalDeUsuarios}" />
			</div>
		</div>
                </section>
             </div>   
	</body>
</html>
