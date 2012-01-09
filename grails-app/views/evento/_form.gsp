<%@ page import="general.Evento" %>

<div class="page-header">
    <h2>1. <small> <g:message code="evento.nombreTitulo" /></small></h2>
</div>

<div class="clearfix ${hasErrors(bean: evento, field: 'nombre', 'error')} required">
                  <label for="xlInput">
                    <g:message code="evento.nombre" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="nombre" type="text" required="" value="${evento?.nombre}" autofocus/>
                  </div>
</div><!-- /clearfix -->

<div class="page-header">
    <h2>2. <small> <g:message code="evento.lugarTitulo" /></small></h2>
</div>

<div class="clearfix ${hasErrors(bean: evento, field: 'lugar', 'error')} required">
                  <label for="xlInput">
                    <g:message code="evento.lugar" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="lugar" type="text" required="" value="${evento?.lugar}" />
                  </div>
</div><!-- /clearfix -->

<div class="page-header">
    <h2>3. <small> <g:message code="evento.fechaTitulo" /></small></h2>
</div>

<div class="clearfix ${hasErrors(bean: evento, field: 'fechaInicio', 'error')} required">
            <label for="mediumSelect">
              <g:message code="evento.fechaInicio" />
              <span class="required-indicator">*</span>
            </label>
            <div class="input">
              <g:datePicker class="small" name="fechaInicio" precision="minute"  value="${evento?.fechaInicio}"/>
            </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: evento, field: 'fechaFin', 'error')} required">
            <label for="mediumSelect">
              <g:message code="evento.fechaFin" />
              <span class="required-indicator">*</span>
            </label>
            <div class="input">
              <g:datePicker class="small" name="fechaFin" precision="minute"  value="${evento?.fechaFin}"/>
            </div>
</div><!-- /clearfix -->

<div class="page-header">
    <h2>4. <small> <g:message code="evento.tipoEventoTitulo" /></small></h2>
</div>

<div class="clearfix ${hasErrors(bean: evento, field: 'tipoSubEvento', 'error')} required">
                  <label for="xlInput">
                    <g:message code="evento.tipoEvento" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input"> 
                    <g:select id="tipoSubEvento" class="span9" name="tipoSubEvento.id" from="${general.TipoSubEvento.list()}" optionKey="id" required="" value="${evento?.tipoSubEvento?.id}" class="many-to-one"/>
                  </div>
</div><!-- /clearfix -->

<div class="page-header">
    <h2>5. <small> <g:message code="evento.costoTitulo" /></small></h2>
</div>

<div class="clearfix ${hasErrors(bean: evento, field: 'costo', 'error')} required">
                  <label for="xlInput">
                    <g:message code="evento.costo" />
                    
                  </label>
                  <div class="input">
                    <g:field type="number" class="span3" name="costo" value="${fieldValue(bean: evento, field: 'costo')}"/>
                  </div>
</div><!-- /clearfix -->

<!--<div class="fieldcontain ${hasErrors(bean: evento, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="evento.usuario.label" default="Usuario" />
		
	</label>
	
</div>-->

