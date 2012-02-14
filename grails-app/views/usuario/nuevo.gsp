<%@ page import="general.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="usuario.nuevaTituloCuenta" /></title>
	</head>
        
	<body>
          
          <div class="container">
            
            <div class="hero-unit">
		
                  <div class="page-header">
                    <h1><g:message code="usuario.nuevaTituloCuenta" /> <small><g:message code="usuario.nuevaCuenta" /></small>
                    </h1>
                  </div>      
                            <g:if test="${flash.message}">
                              <div class="alert alert-error fade in" >
                                <a class="close" data-dismiss="alert" href="#">&times;</a>
                                    <p><strong>Ups... ha ocurrido un error. </strong> ${flash.message}</p>
                              </div>
                            </g:if>
              
                          <g:hasErrors bean="${usuario}">
                              <div class="alert alert-error fade in" >
                                
                                <a class="close" data-dismiss="alert" href="#">&times;</a>
                                
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

                            <g:form action="crea" class="form-horizontal" enctype="multipart/form-data">
                                    <fieldset>
                                            <g:render template="form"/>
                                            <div class="control-group"> 
                                              <div class="controls">
                                                  <g:submitButton  class="btn btn-primary" name="create" value="${message(code: 'usuario.crearMiCuenta')}" />
                                              </div>
                                            </div>
                                    </fieldset>
                            </g:form>
		</div>
            </div>
	</body>

</html>
