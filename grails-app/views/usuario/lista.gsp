
<%@ page import="general.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="usuario.lista" /></title>
	</head>
        
	<body>
          
          <div class="container-fluid">
            
                       <div class="span16">
                            <ul class="breadcrumb">
                              <li><a href="${createLink(uri: '/')}"><g:message code="inicio.home" /></a> <span class="divider">/</span></li>
                              <li><a href="${createLink(controller: 'admin', action:'admin')}"><g:message code="admin.inicio" /></a> <span class="divider">/</span></li>
                              <li class="active"><g:message code="usuario.lista" /></li>
                            </ul>
                       </div>
		
                       <div class="sidebar">
                         <div class="well">
                            <h4>Panel de Control</h4>
                            <ul>
                              <li><a href="${createLink(controller:'evento')}"><g:message code="evento.lista" /></a></li>
                              <li><a href="${createLink(controller:'tipoEvento')}"><g:message code="tipoEvento.lista" /></a></li>
                              <li><a href="${createLink(controller:'tipoSubEvento')}"><g:message code="tipoSubEvento.lista" /></a></li>
                            </ul>
                         </div>
                       </div>
            
            <div class="content">
                
                
                <div class="hero-unitPortal">
                        <ul class="tabs">
                            <li class="active"><a>Usuarios</a></li>
                            <li><g:link class="create" action="nuevo">Nuevo Usuario</g:link></li>
                        </ul>
                          <br>
			<div class="page-header">
                          <h1><g:message code="usuario.lista" /> <small><g:message code="usuario.listaDeUsuarios" /></small></h1>
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
                
                </div>
             </div>   
	</body>
</html>
