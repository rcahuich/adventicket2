<div class="alert alert-success fade in">
  <a class="close" data-dismiss="alert" href="#">&times;</a>
  <i class="icon-info-sign"></i> Resultados de la Búsqueda:
</div>
<table class="table table-bordered">
      <thead>
              <tr>
                      <g:sortableColumn property="username" title="${message(code: 'usuario.username')}" />
                      <g:sortableColumn property="nombre" title="${message(code: 'usuario.nombre')}" />
                      <g:sortableColumn property="correo" title="${message(code: 'usuario.correo')}" />
                      <g:sortableColumn property="correo" title="${message(code: 'usuario.authorities')}" />
              </tr>
      </thead>
      <tbody>
      <g:each in="${resultados}" status="i" var="usuario">
              <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                      <td><g:link action="ver" id="${usuario.id}">${fieldValue(bean: usuario, field: "username")}</g:link></td>
                      <td>${fieldValue(bean: usuario, field: "nombreCompleto")}</td>
                      <td>${fieldValue(bean: usuario, field: "correo")}</td>
                      <td>${fieldValue(bean: usuario, field: "authorities")}</td>
              </tr>
      </g:each>
      </tbody>
</table>

