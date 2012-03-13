<div class="alert alert-success fade in">
  <a class="close" data-dismiss="alert" href="#">&times;</a>
  <i class="icon-info-sign"></i> Resultados de la Búsqueda:
</div>
<table class="table table-bordered">
    <thead>
            <tr>
                    <h5><g:sortableColumn property="nombre" title="${message(code: 'evento.nombre')}" /></h5>
                    <h5><g:sortableColumn property="nombre" title="${message(code: 'evento.fechaInicio')}" /></h5>
                    <h5><g:sortableColumn property="nombre" title="${message(code: 'evento.costo')}" /></h5>
                    <h5><g:sortableColumn property="nombre" title="${message(code: 'evento.usuario')}" /></h5>
                    <h5><g:sortableColumn property="status" title="${message(code: 'evento.status')}" /></h5>
                    <h5><g:sortableColumn property="nombre" title="${message(code: 'evento.modifica')}" /></h5>
            </tr>
    </thead>
    <tbody>
    <g:each in="${resultados}" status="i" var="evento">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><g:link action="ver" id="${evento.id}"><h5>${fieldValue(bean: evento, field: "nombre")}</h5></g:link></td>
                    <td><h5><g:formatDate date="${evento?.fechaInicio}"/></h5></td>
                    <td><h5><g:checkBox name="precio" value="${evento?.precio}" disabled="true"/></h5></td>
                    <td><g:link controller="usuario" action="ver" id="${evento?.usuario?.id}"><h5>${fieldValue(bean: evento, field: "usuario.username")}</h5></g:link></td>
                    <td><h5>${fieldValue(bean: evento, field: "statusSolicitud")}</td>
                    <td><g:link action="edita" id="${evento.id}"><h5>Editar</h5></g:link></td>
            </tr>
    </g:each>
    </tbody>
</table>
