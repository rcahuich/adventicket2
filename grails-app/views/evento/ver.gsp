
<%@ page import="general.Evento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="evento.verDetalles" /></title>
	</head>
        
	<body>
          
          <div class="container">
           
            <div class="hero-unitCuenta">
                  <sec:ifAllGranted roles="ROLE_ADMIN">
                            <ul class="tabs">
                                    <li><g:link action="lista"><g:message code="evento.lista" /></g:link></li>
                                    <li><g:link action="nuevo"><g:message code="evento.nuevo" /></g:link></li>
                            </ul>
                  </sec:ifAllGranted>
                  <div class="page-header">
                    <h1><small><g:message code="evento.verDetalles" /></small></h1>
                  </div>
            
                        <g:if test="${flash.message}">
                                <div class="message" ></div>
                                <div class="alert-message success fade in" data-alert="alert" role="status">
                                  <a class="close" href="#">&times;</a>
                                  <p><strong>Muy bien! </strong>${flash.message}</p>
                                </div>
                               </g:if>
                               
                               
                               <fieldset>
                                 
                                    <g:if test="${evento?.nombre}">
                                      <g:message code="evento.nombre" />:<h4><g:fieldValue bean="${evento}" field="nombre"/></h4>
                                    </g:if>
                                    <br>
                                    <g:if test="${evento?.nombre}">
                                      <g:message code="evento.lugar" />:<h4><g:fieldValue bean="${evento}" field="lugar"/></h4>
                                    </g:if>
                                    <br>
                                    <g:if test="${evento?.fechaInicio}">
                                      <g:message code="evento.fechaInicio" />:<h4><g:formatDate date="${evento?.fechaInicio}"/></h4>
                                    </g:if>
                                    <br>
                                    <br>
                                    <g:if test="${evento?.fechaFin}">
                                      <g:message code="evento.fechaFin" />:<h4><g:formatDate date="${evento?.fechaFin}"/></h4>
                                    </g:if>
                                    <br>
                                    <br>
                                    <g:if test="${evento?.tipoSubEvento}">
                                      <g:message code="evento.tipoEvento" />:<h4><g:fieldValue bean="${evento}" field="tipoSubEvento"/></h4>
                                    </g:if>
                                    <br>
                                    <br>
                                    <g:if test="${evento?.costo}">
                                      <g:message code="evento.costo" />:<h4><g:fieldValue bean="${evento}" field="costo"/></h4>
                                    </g:if>
                                    <br>
                                    
                               </fieldset>
                               
                               <fieldset class="buttones">
                                    <g:hiddenField name="id" value="${evento?.id}" />
                                    <g:link class="editar" action="edita" id="${evento?.id}"><g:message code="evento.edita" /></g:link>
                               </fieldset>
            
            </div>
           
          </div>
	</body>
</html>
