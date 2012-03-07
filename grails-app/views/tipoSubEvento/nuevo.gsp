<%@ page import="general.TipoSubEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoSubEvento.nuevo" /></title>
	</head>
        
	<body>
          <div class="container">
            <section>      
            <div class="well">

		
                  <div class="page-header">
                    <h1><small><g:message code="tipoSubEvento.nuevo" /></small></h1>
                  </div>      

                              <g:hasErrors bean="${tipoSubEvento}">

                              <div class="alert alert-error fade in">
                                <a class="close" data-dismiss="alert" href="#">&times;</a>
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

                            <g:form action="crea" class="form-horizontal">
                                    <fieldset>
                                          <div class="control-group">
                                            <g:render template="form"/>
                                          </div>  
                                          <div class="control-group"</div>
                                              <div class="controls">
                                                <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'tipoSubEvento.nuevoCrea')}" />
                                              </div>
                                          </div>
                                    </fieldset>
                            </g:form>
		</div>
          </section>
            </div>
	</body>

</html>
