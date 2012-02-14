<%@ page import="general.TipoEvento" %>

            <label class="control-label" for="input01"><g:message code="tipoEvento.nombre" /> *</label>
            <div class="controls">
              <input class="input-xlarge" name="nombre" type="text" required="" value="${tipoEvento?.nombre}">
            </div>