<%@ page import="general.TipoSubEvento" %>



<div class="clearfix ${hasErrors(bean: tipoSubEvento, field: 'nombre', 'error')} required">
                  <label for="xlInput">
                    <g:message code="tipoSubEvento.nombre" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="nombre" type="text" required="" value="${tipoSubEvento?.nombre}"/>
                  </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: tipoSubEvento, field: 'nombre', 'error')} required">
                  <label for="xlInput">
                    <g:message code="tipoSubEvento.tipoEvento" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <g:select id="tipoEvento" name="tipoEvento.id" from="${general.TipoEvento.list()}" optionKey="id" required="" value="${tipoSubEvento?.tipoEvento?.id}" class="many-to-one"/>
                  </div>
</div><!-- /clearfix -->

