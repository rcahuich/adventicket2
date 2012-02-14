<%@ page import="general.TipoSubEvento" %>

            <label class="control-label" for="input01"><g:message code="tipoSubEvento.nombre" /> *</label>
            <div class="controls">
              <input class="input-xlarge" name="nombre" type="text" required="" value="${tipoSubEvento?.nombre}"/>
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="tipoSubEvento.tipoEvento" /> *</label>
            <div class="controls">
              <g:select id="tipoEvento" name="tipoEvento.id" from="${general.TipoEvento.list()}" optionKey="id" required="" value="${tipoSubEvento?.tipoEvento?.id}" class="many-to-one"/>
            </div>
            <br>