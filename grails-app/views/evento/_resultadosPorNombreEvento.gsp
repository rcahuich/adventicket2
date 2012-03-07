<div class="alert alert-success fade in">
  <a class="close" data-dismiss="alert" href="#">&times;</a>
  <i class="icon-info-sign"></i> Resultados de la Búsqueda:
</div>
<table class="table table-bordered">
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
    <g:each in="${resultados}" status="i" var="evento">
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
