
<%@ page import="general.Evento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="evento.lista" /></title>
	</head>
        
	<body>
          
          <div class="container-fluid">
               <div class="span16">
                    <ul class="breadcrumb">
                      <li><a href="${createLink(uri: '/')}"><g:message code="inicio.home" /></a> <span class="divider">/</span></li>
                      <li><a href="${createLink(controller: 'admin', action:'admin')}"><g:message code="admin.inicio" /></a> <span class="divider">/</span></li>
                      <li class="active"><g:message code="evento.lista" /></li>
                    </ul>
               </div>

               <div class="sidebar">
                 <div class="well">
                    <h4>Panel de Control</h4>
                    <ul>
                      <li><a href="${createLink(controller:'usuario')}"><g:message code="usuario.lista" /></a></li>
                      <li><a href="${createLink(controller:'tipoEvento')}"><g:message code="tipoEvento.lista" /></a></li>
                      <li><a href="${createLink(controller:'tipoSubEvento')}"><g:message code="tipoSubEvento.lista" /></a></li>
                    </ul>
                 </div>
               </div>
            
            <div class="content">
                
                
                <div class="hero-unitPortal">
                        <ul class="tabs">
                          <li class="active"><a><g:message code="evento.lista" /></a></li>
                          <li><g:link action="nuevo"><g:message code="evento.nuevo" /></g:link></li>

                        </ul>
                        <br>
			<div class="page-header">
                          <h1><g:message code="evento.lista" /> <small><g:message code="evento.listasubTitulo" /></small></h1>
                        </div> 
                <br>        
                
                <g:if test="${flash.message}">
			<div class="alert-message info" data-alert="alert" >
                                <a class="close" href="#">&times;</a>
                                    ${flash.message}
                        </div>
                </g:if>
                        
			<table class="bordered-table zebra-striped">
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'evento.nombre')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.fechaInicio')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.costo')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.usuario')}" />
                                                <g:sortableColumn property="status" title="${message(code: 'evento.status')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'evento.modifica')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventos}" status="i" var="evento">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="ver" id="${evento.id}">${fieldValue(bean: evento, field: "nombre")}</g:link></td>
						<td><g:formatDate date="${evento?.fechaInicio}"/></td>
						<td>${fieldValue(bean: evento, field: "costo")}</td>
                                                <td><g:link controller="usuario" action="ver" id="${evento?.usuario?.id}">${fieldValue(bean: evento, field: "usuario.username")}</g:link></td>
                                                <td>${fieldValue(bean: evento, field: "statusSolicitud")}</td>
                                                <td><g:link action="edita" id="${evento.id}">Editar</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
                        
			<div class="pagination">
				<g:paginate total="${totalEventos}" />
			</div>
		</div>
                </div>
             </div>   
	</body>
</html>
