
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
                
                  <g:form class="well form-search" action="search">
                    <table>
                      <tbody>
                        <tr class="prop">             
                          <td class="name" valign="top">Title:</td>             
                          <td class="value" valign="top"><input name="title" type="text" ></td>          
                        </tr>
                        <tr class="prop">             
                          <td class="name" valign="top">Publisher:</td>             
                          <td class="value" valign="top"><input name="publisher" type="text" ></td>          
                        </tr>
                    </tbody>      
                    </table>
                    <g:submitToRemote 
                      oncomplete="showSpinner(false)" 
                      onloading="showSpinner(true)" 
                      update="searchresults" 
                      url="[controller:'book', action:'search']" value="Search">
                    </g:submitToRemote>
                  </g:form>
                
                  <div class="well form-search">
                    <a class="btn btn-primary" href="${createLink(controller:'usuario', action:'nuevo')}"><i class="icon-plus-sign icon-white"></i> <g:message code="usuario.nuevo" /></a>
                    <input type="text" class="input-medium search-query">
                    <button type="submit" class="btn">Buscar</button>
                  </div>
                        
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
                        
			<div class="pagination">
				<g:paginate total="${totalDeUsuarios}" />
			</div>
		</div>
                </section>
             </div>   
	</body>
</html>
