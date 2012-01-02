
<%@ page import="general.TipoSubEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoSubEvento.verDetalles" /></title>
	</head>
        
	<body>
          
          <div class="container">
           
            <div class="hero-unitCuenta">
			<ul class="tabs">
				<li><g:link action="lista"><g:message code="tipoSubEvento.lista" /></g:link></li>
				<li><g:link action="nuevo"><g:message code="tipoSubEvento.nuevo" /></g:link></li>
			</ul>
              
                  <div class="page-header">
                    <h1><small><g:message code="tipoSubEvento.verDetalles" /></small></h1>
                  </div>
            
                        <g:if test="${flash.message}">
                                <div class="message" ></div>
                                <div class="alert-message success fade in" data-alert="alert" role="status">
                                  <a class="close" href="#">&times;</a>
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
                                    
                               </fieldset>
                               
                               <fieldset class="buttones">
                                    <g:hiddenField name="id" value="${tipoSubEvento?.id}" />
                                    <g:link class="editar" action="edita" id="${tipoSubEvento?.id}"><g:message code="tipoSubEvento.edita" /></g:link>
                               </fieldset>
            
            </div>
           
          </div>
	</body>
</html>
