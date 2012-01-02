
<%@ page import="general.TipoEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoEvento.verDetalles" /></title>
	</head>
        
	<body>
          
          <div class="container">
           
            <div class="hero-unitCuenta">
			<ul class="tabs">
				<li><g:link action="lista"><g:message code="tipoEvento.lista" /></g:link></li>
				<li><g:link action="nuevo"><g:message code="tipoEvento.nuevo" /></g:link></li>
			</ul>
              
                  <div class="page-header">
                    <h1><small><g:message code="tipoEvento.verDetalles" /></small></h1>
                  </div>
            
                        <g:if test="${flash.message}">
                                <div class="message" ></div>
                                <div class="alert-message success fade in" data-alert="alert" role="status">
                                  <a class="close" href="#">&times;</a>
                                  <p><strong>Muy bien! </strong>${flash.message}</p>
                                </div>
                               </g:if>
                               
                               
                               <fieldset>
                                 
                                    <g:if test="${tipoEvento?.nombre}">
                                   <g:message code="tipoEvento.nombre" />:<h4><g:fieldValue bean="${tipoEvento}" field="nombre"/></h4>
                                    </g:if>
                                    <br>
                                    
                               </fieldset>
                               
                               <fieldset class="buttones">
                                    <g:hiddenField name="id" value="${tipoEvento?.id}" />
                                    <g:link class="editar" action="edita" id="${tipoEvento?.id}"><g:message code="tipoEvento.edita" /></g:link>
                               </fieldset>
            
            </div>
           
          </div>
	</body>
</html>
