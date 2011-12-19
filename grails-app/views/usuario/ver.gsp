
<%@ page import="general.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="usuario.lista" /></title>
	</head>
        
	<body>
          <div class="container">
            <sec:ifAllGranted roles="ROLE_ADMIN">
            <div class="hero-unitCuenta">
			<ul class="tabs">
				<li><g:link action="lista">Lista de Usuarios</g:link></li>
				<li><g:link action="nuevo">Nuevo Usuario</g:link></li>
			</ul>
              </div>
            </sec:ifAllGranted>
          </div>
          
          <div class="container-fluid">
		
                       <div class="span16">
                            <ul class="breadcrumb">
                              <li><a href="${createLink(uri: '/')}"><g:message code="inicio.home" /></a> <span class="divider">/</span></li>
                              <li class="active"><g:message code="usuario.miPerfil" /></li>
                            </ul>
                       </div>
		
                          <div class="sidebar">
                                <div class="well">
                                         <img style="width: 180px; height: 210px;" src="${createLink(action:'imagen', id:usuario?.id)}" />
                                <fieldset class="buttones">
					<g:hiddenField name="id" value="${usuario?.id}" />
					<g:link class="editar" action="edita" id="${usuario?.id}"><g:message code="usuario.modificaPerfil" /></g:link>
				</fieldset>
                                </div>        
                          </div>
                          
                           <div class="content">
                             <div class="hero-unitPortal">
                               
                               <g:if test="${flash.message}">
                                <div class="message" ></div>
                                <div class="alert-message success fade in" data-alert="alert" role="status">
                                  <a class="close" href="#">&times;</a>
                                  <p><strong>Muy bien! </strong>${flash.message}</p>
                                </div>
                               </g:if>
                               
                               
                               <fieldset>
                                <g:if test="${usuario?.nombre}">
                                <g:message code="usuario.nombreCompleto" />: <h4><g:fieldValue bean="${usuario}" field="nombreCompleto"/></h4>
                                </g:if>
                                <br>
                                <g:if test="${usuario?.username}">
                                <g:message code="usuario.username" />: <g:fieldValue bean="${usuario}" field="username"/>
                                </g:if>
                                <br>
                                <br>
                                <g:if test="${usuario?.telefono}">
                                <g:message code="usuario.telefono" />: <g:fieldValue bean="${usuario}" field="telefono"/>
                                </g:if>
                                <br>
                                <br>
                                <g:if test="${usuario?.correo}">
                                <g:message code="usuario.correo" />: <g:fieldValue bean="${usuario}" field="correo"/>
                                </g:if>
                                <br>
                                <br>
                                <sec:ifAllGranted roles="ROLE_ADMIN">
                                <g:if test="${usuario?.accountExpired}">
                                <g:message code="usuario.accountExpired" />: <g:checkBox name="accountExpired" value="${usuario?.accountExpired}" disabled="true" />
                                </g:if>
                                
                                <g:if test="${usuario?.accountLocked}">
                                <g:message code="usuario.accountLocked" />: <g:checkBox name="accountExpired" value="${usuario?.accountLocked}" disabled="true" />
                                </g:if>
                                
                                <g:if test="${usuario?.enabled}">
                                <g:message code="usuario.enabled" />: <g:checkBox name="accountExpired" value="${usuario?.enabled}" disabled="true" />
                                </g:if>
                                
                                <g:if test="${usuario?.passwordExpired}">
                                <g:message code="usuario.passwordExpired" />: <g:checkBox name="accountExpired" value="${usuario?.passwordExpired}" disabled="true" />
                                </g:if>
                                
                                <g:if test="${usuario?.accountExpired}">
                                <g:message code="usuario.accountExpired" />: <g:checkBox name="accountExpired" value="${usuario?.accountExpired}" disabled="true" />
                                </g:if>
                                <br>
                                
                                <g:if test="${roles}">
                                <g:message code="usuario.authorities" />: 
                                          <g:each var="entry" in="${roles}">
                                                <g:checkBox disabled="true" name="${entry.key.authority}" value="${entry.value}"/> ${entry.key.authority}<br/>
                                          </g:each>
                                </g:if>
                                </sec:ifAllGranted>
                                <br>
                                <br>
                                <br>
                                <br>
                                <h3>Eventos</h3>                                  

                               </fieldset>
                             
                          </div>
                  </div>
             </div>
	</body>
</html>
