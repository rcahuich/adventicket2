
<%@ page import="general.TipoEvento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="tipoEvento.verDetalles" /></title>
	</head>
        
	<body>
          
          <div class="container">
           <section>
            <div class="well">
              
                  <div class="page-header">
                    <h1><small><g:message code="tipoEvento.verDetalles" /></small></h1>
                  </div>
            
                        <g:if test="${flash.message}">
                                <div class="alert alert-info fade in">
                                  <a class="close" data-dismiss="alert" href="#">&times;</a>
                                  <p><strong>Muy bien! </strong>${flash.message}</p>
                                </div>
                        </g:if>
                               
                               
                               <fieldset>
                                 
                                    <g:if test="${tipoEvento?.nombre}">
                                   <g:message code="tipoEvento.nombre" />:<h4><g:fieldValue bean="${tipoEvento}" field="nombre"/></h4>
                                    </g:if>
                                    <br>
                                    
                               </fieldset>
                               
                               <fieldset>
                                 <div class="control-group"> 
                                   <div class="controls">
                                    <g:hiddenField name="id" value="${tipoEvento?.id}" />
                                    <g:link class="btn btn-success" action="edita" id="${tipoEvento?.id}"><g:message code="tipoEvento.edita" /></g:link>
                                   </div>
                                 </div>  
                               </fieldset>
            
            </div>
           </section>
          </div>
	</body>
</html>
