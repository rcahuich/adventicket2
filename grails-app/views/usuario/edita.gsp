<%@ page import="general.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="usuario.actualizaTitulo" /></title>
	</head>
        
	<body>
          <div class="container">
            <section>          
            <ul class="breadcrumb">
              <li><a href="${createLink(uri: '/')}"><g:message code="inicio.home" /></a> <span class="divider">/</span></li>
              <li><a href="${createLink(controller:'usuario', action:'ver')}"><g:message code="usuario.miPerfil" /></a> <span class="divider">/</span></li>
              <li class="active"><g:message code="usuario.modificaPerfil" /></li>
            </ul>
            </section>
            </div>
          
          <div class="container">
            
            
            <div class="well">
              
                              <div class="page-header">
                                <h1><g:message code="usuario.actualizaTitulo" /> <small><g:message code="usuario.actualiza" /></small>
                                </h1>
                              </div>  
            
		

                              <g:hasErrors bean="${usuario}">

                              <div class="alert alert-error fade in" >
                                <a class="close" data-dismiss="alert" href="#">&times;</a>
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

                            <g:form action="actualiza" method="post" class="form-horizontal" enctype="multipart/form-data">
                                    <fieldset>
                                      <div class="control-group">
                                      <g:render template="form_edita"/>
                                      </div>
                                      <div class="hero-unit">
                                      <div class="control-group"> 
                                        <div class="controls">
                                            <g:hiddenField name="id" value="${usuario?.id}" />
                                            <g:hiddenField name="version" value="${usuario?.version}" />  
                                            <g:submitButton name="edita" class="btn btn-success" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                            <sec:ifAllGranted roles="ROLE_ADMIN">
                                            <g:actionSubmit class="btn btn-danger" action="elimina" value="${message(code: 'usuario.cancelarCuenta')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                            </sec:ifAllGranted>
                                        </div>
                                      </div>
                                      </div>
                                    </fieldset>
                            </g:form>
		</div>
            
            </div>
        </body>
</html>
