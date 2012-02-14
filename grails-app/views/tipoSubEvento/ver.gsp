
<%@ page import="general.TipoSubEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoSubEvento.verDetalles" /></title>
	</head>
        
	<body>
          
          <div class="container">
           
            <div class="hero-unit">
                  <div class="page-header">
                    <h1><small><g:message code="tipoSubEvento.verDetalles" /></small></h1>
                  </div>
            
                        <g:if test="${flash.message}">
                                <div class="alert alert-info fade in">
                                  <a class="close" data-dismiss="alert" href="#">&times;</a>
                                  <p><strong>Muy bien! </strong>${flash.message}</p>
                                </div>
                               </g:if>
                               
                               
                               <fieldset>
                                 
                                    <g:if test="${tipoSubEvento?.nombre}">
                                    <g:message code="tipoSubEvento.nombre" />:<h4><g:fieldValue bean="${tipoSubEvento}" field="nombre"/></h4>
                                    </g:if>
                                    <br>
                                    <g:if test="${tipoSubEvento?.tipoEvento}">
                                    <g:message code="tipoSubEvento.tipoEvento" />:<h4><g:fieldValue bean="${tipoSubEvento}" field="tipoEvento"/></h4>
                                    </g:if>
                                    <br>
                                    
                               
                              
                                    <g:hiddenField name="id" value="${tipoSubEvento?.id}" />
                                    <g:link class="btn btn-success" action="edita" id="${tipoSubEvento?.id}"><g:message code="tipoSubEvento.edita" /></g:link>
                               </fieldset>
            
            </div>
           
          </div>
	</body>
</html>
