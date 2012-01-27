<%@ page import="general.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="usuario.nuevaTituloCuenta" /></title>
	</head>
        
	<body>
          <div class="container">
          
            <sec:ifAllGranted roles="ROLE_ADMIN">
		<div class="span16">
                            <ul class="breadcrumb">
                              <li><a href="${createLink(uri: '/')}"><g:message code="inicio.home" /></a> <span class="divider">/</span></li>
                              <li><a href="${createLink(controller: 'admin', action:'admin')}"><g:message code="admin.inicio" /></a> <span class="divider">/</span></li>
                              <li><a href="${createLink(controller: 'usuario', action:'lista')}"><g:message code="usuario.lista" /></a> <span class="divider">/</span></li>
                              <li class="active"><g:message code="usuario.nuevo" /></li>
                            </ul>
                </div>
            </sec:ifAllGranted>
            
            <div class="hero-unitCuenta">
		
                  <div class="page-header">
                    <h1><g:message code="usuario.nuevaTituloCuenta" /> <small><g:message code="usuario.nuevaCuenta" /></small></h1>
                  </div>      
                                
              
              
                            <g:if test="${flash.message}">
                              <div class="alert-message block-message error fade in" data-alert="alert" >
                                <a class="close" href="#">&times;</a>
                                    <p><strong>Ups... ha ocurrido un error. </strong> ${flash.message}</p>
                              </div>
                             </g:if>
              
                          <g:hasErrors bean="${usuario}">
                              <div class="alert-message block-message error fade in" data-alert="alert" >
                                
                                <a class="close" href="#">&times;</a>
                                
                                  <g:eachError bean="${usuario}" var="error">
                                    <p><strong>Ups... ha ocurrido un error. </strong><g:message error="${error}"/></p>
                                  </g:eachError>
                                
                                <g:if test="${flash.error}">
                                  <p><strong>Ups... ha ocurrido un error. </strong> ${flash.error}</p>
                                </g:if>
                                
                                
                                <g:if test="${error in org.springframework.validation.FieldError}">
                                  <p><strong>Ups... ha ocurrido un error. </strong> data-field-id="${error.field}"</p>
                                </g:if>
                                
                              </div>
                           </g:hasErrors>

                            <g:form action="crea" enctype="multipart/form-data">
                                    <fieldset>
                                            
                                            <g:render template="form"/>
                                            
                                            <div class="input">
                                              <fieldset class="buttones">
                                                <g:submitButton name="create" class="nuevo" value="${message(code: 'usuario.crearMiCuenta')}" />
                                              </fieldset>
                                            </div>
                                    </fieldset>
                            </g:form>
		</div>
            </div>
	</body>

</html>
