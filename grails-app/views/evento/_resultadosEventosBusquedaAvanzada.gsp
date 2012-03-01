<g:if test="${busquedaAvanzada}">
      <table class="table table-bordered">
              <thead>
                      <tr>
                              <g:sortableColumn property="nombre" title="${message(code: 'evento.nombre')}" />
                              <g:sortableColumn property="nombre" title="${message(code: 'evento.lugar')}" />
                              <g:sortableColumn property="nombre" title="${message(code: 'evento.fechaInicio')}" />
                      </tr>
              </thead>
              <tbody>
              <g:each in="${busquedaAvanzada}" status="i" var="evento">
                      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                              <td><g:link action="ver">${fieldValue(bean: evento, field: "nombre")}</g:link></td>
                              <td>${fieldValue(bean: evento, field: "lugarCompleto")}</td>
                              <td><g:formatDate date="${evento?.fechaInicio}"/></td>
                      </tr>
              </g:each>
              </tbody>
      </table>
</g:if>
<g:else>
  NO se encontro nada avanzada
</g:else>