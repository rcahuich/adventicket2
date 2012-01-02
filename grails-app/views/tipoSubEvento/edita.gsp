<%@ page import="general.TipoSubEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoSubEvento.edita" /></title>
	</head>
        
	<body>
          <div class="container">
   
            <div class="hero-unitCuenta">
              
              <div class="tabs">
                        <li><g:link class="list" action="lista"><g:message code="tipoSubEvento.lista" /></g:link></li>
              </div>
              
                              <div class="page-header">
                                    <h1><small><g:message code="tipoSubEvento.edita" /></small></h1>
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

                            <g:form method="post">
                                    <fieldset>
                                      <g:render template="form"/>
                                            
                                      <div class="input">
                                        <fieldset class="buttones">
                                            <g:hiddenField name="id" value="${tipoSubEvento?.id}" />
                                            <g:hiddenField name="version" value="${tipoSubEvento?.version}" />  
                                            <g:actionSubmit class="actualizar" action="actualiza" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                            <g:actionSubmit class="eliminar" action="elimina" value="${message(code: 'tipoSubEvento.elimina')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                        </fieldset>
                                      </div>
                                    </fieldset>
                            </g:form>
		</div>
            </div>
        </body>
</html>
