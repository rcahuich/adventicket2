<%@ page import="general.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="usuario.nuevo" /></title>
	</head>
        
	<body>
          <div class="container">
            
            <sec:ifAllGranted roles="ROLE_ADMIN">
		<div class="tabs">
                        <li><g:link class="list" action="lista"><g:message code="usuario.lista" /></g:link></li>
		</div>
              </sec:ifAllGranted>
            
                <div class="span16">
                                <ul class="breadcrumb">
                                  <li><a href="${createLink(uri: '/')}"><g:message code="inicio.home" /></a> <span class="divider">/</span></li>
                                  <li><a href="${createLink(controller:'usuario', action:'ver')}"><g:message code="usuario.miPerfil" /></a> <span class="divider">/</span></li>
                                  <li class="active"><g:message code="usuario.modificaPerfil" /></li>
                                </ul>
                </div>
            
            <div class="hero-unitCuenta">
              
                              <div class="page-header">
                                    <h1><g:message code="usuario.actualizaTitulo" /> <small><g:message code="usuario.actualiza" /></small></h1>
                              </div>  
            
		

                              <g:hasErrors bean="${usuario}">

                              <div class="alert-message block-message error fade in" data-alert="alert" >
                                <a class="close" href="#">&times;</a>
                                <g:eachError bean="${usuario}" var="error">
                                  <p><strong>Ups... ha ocurrido un error. </strong><g:message error="${error}"/></p>
                                </g:eachError>
                                <g:if test="${flash.message}">
                                    flash ${flash.message}
                                </g:if>
                                <g:if test="${error in org.springframework.validation.FieldError}">
                                  data-field-id="${error.field}"
                                </g:if>
                              </div>

                            </g:hasErrors>

                            <g:form method="post" enctype="multipart/form-data">
                                    <fieldset>
                                      <g:render template="form"/>
                                            
                                      <div class="input">
                                        <fieldset class="buttones">
                                            <g:hiddenField name="id" value="${usuario?.id}" />
                                            <g:hiddenField name="version" value="${usuario?.version}" />  
                                            <g:actionSubmit class="actualizar" action="actualiza" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                            <sec:ifAllGranted roles="ROLE_ADMIN">
                                            <g:actionSubmit class="eliminar" action="elimina" value="${message(code: 'usuario.cancelarCuenta')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                            </sec:ifAllGranted>
                                        </fieldset>
                                      </div>
                                    </fieldset>
                            </g:form>
		</div>
            </div>
        </body>
</html>
