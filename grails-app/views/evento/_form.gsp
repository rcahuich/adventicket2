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

<div class="clearfix ${hasErrors(bean: evento, field: 'lugarDescripcion', 'error')} required">
                  <label for="xlInput">
                    <g:message code="evento.lugarDescripcion" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="lugarDescripcion" type="text" required="" value="${evento?.lugarDescripcion}" />
                  </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: evento, field: 'calle', 'error')} required">
                  <label for="xlInput">
                    <g:message code="evento.calle" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="calle" type="text" required="" value="${evento?.calle}" />
                  </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: evento, field: 'ciudad', 'error')} required">
                  <label for="xlInput">
                    <g:message code="evento.ciudad" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="ciudad" type="text" required="" value="${evento?.ciudad}" />
                  </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: evento, field: 'pais', 'error')} required">
                  <label for="xlInput">
                    <g:message code="evento.pais" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <g:select name="pais" from="${evento.constraints.pais.inList}" value="${evento?.pais}" valueMessagePrefix="evento.pais"  />
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
        <a id="si" href="#si">Si</a> | <a id="no" href="#no">No</a>
  </label>
  <br></br>
  <div id="divSi" style="display:none">
            
          <label for="xlInput">
            <g:message code="evento.costo" />
          </label>
          <div class="input">
            <g:field type="number" class="span3" name="costo" value="${evento.costo}" step="0.01"/>
            <p>
              El costo de evento implica que se realizara un pago como inscripcion al evento.
            </p>
          </div>
            
  </div>
  
  <div id="divNo">
    <div class="input">
      El evento se creara automaticamente y podra hacerlo publico.
    </div>
  </div>
  
</div>
          

<!--<div class="fieldcontain ${hasErrors(bean: evento, field: 'asistentes', 'error')} ">
	<label for="usuario">
		<g:message code="evento.asistentes.label" default="Ayasistentes" />
		
	</label>
	
</div>-->

<r:script>
    $(document).ready(function(){
      $("a#si").click(function(e){
        e.preventDefault();
        $("#divNo").slideUp();
        $("#divSi").slideDown();
        $("input#costo").focus();
      });
      $("a#no").click(function(e){
        e.preventDefault();
        $("#divSi").slideUp();
        $("#divNo").slideDown();
        
      });
    });
</r:script>