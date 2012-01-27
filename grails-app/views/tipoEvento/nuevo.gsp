<%@ page import="general.TipoEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoEvento.nuevo" /></title>
	</head>
        
	<body>
          <div class="container">
                  <sec:ifAllGranted roles="ROLE_ADMIN">
		<div class="span16">
                            <ul class="breadcrumb">
                              <li><a href="${createLink(uri: '/')}"><g:message code="inicio.home" /></a> <span class="divider">/</span></li>
                              <li><a href="${createLink(controller: 'admin', action:'admin')}"><g:message code="admin.inicio" /></a> <span class="divider">/</span></li>
                              <li><a href="${createLink(controller: 'tipoEvento', action:'lista')}"><g:message code="tipoEvento.lista" /></a> <span class="divider">/</span></li>
                              <li class="active"><g:message code="tipoEvento.nuevo" /></li>
                            </ul>
                </div>
            </sec:ifAllGranted>
            <div class="hero-unitCuenta">

		
                  <div class="page-header">
                    <h1><small><g:message code="tipoEvento.nuevo" /></small></h1>
                  </div>      

                              <g:hasErrors bean="${tipoEvento}">

                              <div class="alert-message block-message error fade in" data-alert="alert" >
                                <a class="close" href="#">&times;</a>
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

                            <g:form action="crea" >
                                    <fieldset>
                                            
                                            <g:render template="form"/>
                                            
                                            <div class="input">
                                              <fieldset class="buttones">
                                                <g:submitButton name="create" class="nuevo" value="${message(code: 'tipoEvento.nuevoCrea')}" />
                                              </fieldset>
                                            </div>
                                    </fieldset>
                            </g:form>
		</div>
            </div>
	</body>

</html>
