<%@ page import="general.Evento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="evento.nuevo" /></title>
	</head>
        
	<body>
          <div class="container">
          
            <div class="hero-unitCuenta">
              <sec:ifAllGranted roles="ROLE_ADMIN">
		<div class="tabs">
                        <li><g:link class="list" action="lista"><g:message code="evento.lista" /></g:link></li>
		</div>
              </sec:ifAllGranted>

		
                  <div class="page-header">
                    <h1><g:message code="evento.nuevoTitulo" /><small> <g:message code="evento.nuevo" /></small></h1>
                  </div>      

                              <g:hasErrors bean="${evento}">

                              <div class="alert-message block-message error fade in" data-alert="alert" >
                                <a class="close" href="#">&times;</a>
                                <g:eachError bean="${evento}" var="error">
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

                            <g:form action="crea" >
                                    <fieldset>
                                            
                                            <g:render template="form"/>
                                            
                                            <div class="input">
                                              <fieldset class="buttones">
                                                <g:submitButton name="create" class="nuevo" value="${message(code: 'evento.nuevoCrea')}" />
                                              </fieldset>
                                            </div>
                                    </fieldset>
                            </g:form>
		</div>
            </div>
	</body>

</html>
