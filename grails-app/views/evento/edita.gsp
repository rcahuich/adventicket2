<%@ page import="general.Evento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="evento.edita" /></title>
	</head>
        
	<body>
          
          <div class="container">
            <section>
              <ul class="breadcrumb">
                <li><a href="${createLink(uri: '/')}"><g:message code="inicio.home" /></a> <span class="divider">/</span></li>
                <li><a href="${createLink(controller:'usuario', action:'ver')}"><g:message code="usuario.miPerfil" /></a> <span class="divider">/</span></li>
                <li class="active"><g:message code="evento.edita" /> </li>
              </ul>
            </section>
    
            <div class="well">
               
                              <div class="marketing">
                                    <h1><g:message code="evento.editaTitulo" /></h1>
                                    <p class="marketing-byline"><g:message code="evento.edita" /></p>
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

                            <g:form method="post">
                                    <fieldset>
                                      <div class="control-group" style="margin-left: 30px;">
                                        <g:render template="form_edita"/>
                                      </div>
                                   
                                      <div class="hero-unit">
                                        <div class="control-group">
                                        <div class="controls">
                                            <g:hiddenField name="id" value="${evento?.id}" />
                                            <g:hiddenField name="version" value="${evento?.version}" /> 
                                            <center>
                                            <g:actionSubmit class="btn btn-success" action="actualiza" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                            <g:actionSubmit class="btn btn-danger" action="elimina" value="${message(code: 'evento.elimina')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                            </center>
                                        </div>
                                        </div>
                                      </div>
                                    </fieldset>
                            </g:form>
		</div>
            </div>
        </body>
</html>
