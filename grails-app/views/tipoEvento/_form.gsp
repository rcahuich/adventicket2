<%@ page import="general.TipoEvento" %>

<div class="clearfix ${hasErrors(bean: tipoEvento, field: 'nombre', 'error')} required">
                  <label for="xlInput">
                    <g:message code="tipoEvento.nombre" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="nombre" type="text" required="" value="${tipoEvento?.nombre}"/>
                  </div>
</div><!-- /clearfix -->
