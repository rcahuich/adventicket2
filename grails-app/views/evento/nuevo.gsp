<%@ page import="general.Evento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="evento.nuevo" /></title>
	</head>
        
	<body>
          <div class="container">
            <section>
            <div class="well">

              <div class="marketing">
                    <h1><g:message code="evento.nuevoTitulo" /></h1>
                    <p class="marketing-byline"><g:message code="evento.nuevo" /></p>
              </div>
              <hr class="soften">
                              <g:hasErrors bean="${evento}">

                              <div class="alert alert-error fade in" >
                                <a class="close" data-dismiss="alert" href="#">&times;</a>
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
                                            <div class="control-group" style="margin-left: 30px;">
                                            <g:render template="form"/>
                                            </div>
                                            
                                            <div class="hero-unit">
                                              <div class="control-group"> 
                                                <div class="controls">
                                                  <center>
                                                  <g:submitButton name="create" class="btn btn-large btn-primary" value="${message(code: 'evento.nuevoCrea')}" />
                                                  </center>
                                                </div>
                                              </div>
                                            </div>
                                    </fieldset>
                            </g:form>
                   </div>
              </section>
		</div>
	</body>

</html>
