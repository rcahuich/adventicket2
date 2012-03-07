<%@ page import="general.TipoEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoEvento.edita" /></title>
	</head>
        
	<body>
          <div class="container">
            <section>
            <div class="well">
              
                              <div class="page-header">
                                    <h1><small><g:message code="tipoEvento.edita" /></small></h1>
                              </div>  
            
		

                              <g:hasErrors bean="${tipoEvento}">

                              <div class="alert alert-error fade in" >
                                <a class="close" data-dismiss="alert" href="#">&times;</a>
                                <g:eachError bean="${tipoEvento}" var="error">
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

                            <g:form method="post" class="form-horizontal">
                                    <fieldset>
                                      <div class="control-group">
                                      <g:render template="form"/>
                                      </div>
                                      <br>
                                      <div class="control-group"> 
                                        <div class="controls">
                                            <g:hiddenField name="id" value="${tipoEvento?.id}" />
                                            <g:hiddenField name="version" value="${tipoEvento?.version}" />  
                                            <g:actionSubmit class="btn btn-success" action="actualiza" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                            <g:actionSubmit class="btn btn-danger" action="elimina" value="${message(code: 'tipoEvento.elimina')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                        </div>
                                      </div>
                                    </fieldset>
                            </g:form>
		</div>
              </section>
            </div>
        </body>
</html>
