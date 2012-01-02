<%@ page import="general.TipoSubEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoSubEvento.nuevo" /></title>
	</head>
        
	<body>
          <div class="container">
          
            <div class="hero-unitCuenta">

		<div class="tabs">
                        <li><g:link class="list" action="lista"><g:message code="tipoSubEvento.lista" /></g:link></li>
		</div>

		
                  <div class="page-header">
                    <h1><small><g:message code="tipoSubEvento.nuevo" /></small></h1>
                  </div>      

                              <g:hasErrors bean="${tipoSubEvento}">

                              <div class="alert-message block-message error fade in" data-alert="alert" >
                                <a class="close" href="#">&times;</a>
                                <g:eachError bean="${tipoSubEvento}" var="error">
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
                                                <g:submitButton name="create" class="nuevo" value="${message(code: 'tipoSubEvento.nuevoCrea')}" />
                                              </fieldset>
                                            </div>
                                    </fieldset>
                            </g:form>
		</div>
            </div>
	</body>

</html>