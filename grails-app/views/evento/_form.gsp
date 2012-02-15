<%@ page import="general.Evento" %>

<legend>1. <g:message code="evento.nombreTitulo" /></legend>
<div style="margin-left: 50px;">
            <label class="control-label" for="input01"><g:message code="evento.nombre" /> *</label>
            <div class="controls">
              <input type="text" class="input-xlarge" name="nombre" required="" value="${evento?.nombre}" autofocus>
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.descripcion" /> *</label>
            <div class="controls">
              <textarea id="textarea" rows="5" type="text" class="input-xlarge" name="descripcion" required="" value="${evento?.descripcion}"></textarea>
            </div>
</div>            
<legend>2. <g:message code="evento.lugarTitulo" /></legend>
<div style="margin-left: 50px;">
            <label class="control-label" for="input01"><g:message code="evento.lugarDescripcion" /> *</label>
            <div class="controls">
              <input class="input-xlarge" name="lugarDescripcion" type="text" required="" value="${evento?.lugarDescripcion}">
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.calle" /> *</label>
            <div class="controls">
              <input class="input-xlarge" name="calle" type="text" required="" value="${evento?.calle}">
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.ciudad" /> *</label>
            <div class="controls">
              <input class="input-xlarge" name="ciudad" type="text" required="" value="${evento?.ciudad}">
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.pais" /> *</label>
            <div class="controls">
              <g:select name="pais" from="${evento.constraints.pais.inList}" value="${evento?.pais}" valueMessagePrefix="evento.pais"  />
            </div>
</div>
<legend>3. <g:message code="evento.fechaTitulo" /></legend>
<div style="margin-left: 50px;">
            <label class="control-label" for="input01"><g:message code="evento.fechaInicio" /> *</label>
            <div class="controls">
              <g:datePicker class="small" name="fechaInicio" precision="minute"  value="${evento?.fechaInicio}"/>
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.fechaFin" /> *</label>
            <div class="controls">
              <g:datePicker class="small" name="fechaFin" precision="minute"  value="${evento?.fechaFin}"/>
            </div>
            <br>
</div>
<legend>4. <g:message code="evento.tipoEventoTitulo" /></legend>
<div style="margin-left: 50px;">
            <label class="control-label" for="input01"><g:message code="evento.tipoEvento" /> *</label>
            <div class="controls">
              <g:select id="tipoSubEvento" class="span9" name="tipoSubEvento.id" from="${general.TipoSubEvento.list()}" optionKey="id" required="" value="${evento?.tipoSubEvento?.id}" class="many-to-one"/>
            </div>
            <br>
</div>
<legend>5. <g:message code="evento.costoTitulo" /></legend>
<div style="margin-left: 50px;">
            <label class="control-label" for="input01">
              <div class="btn-group" data-toggle="buttons-radio">
                                <a id="si" href="#si" class="btn btn-primary">Si</a>
                                <a id="no" href="#no" class="btn btn-primary">No</a>
              </div>
            </label>
            <div class="controls">
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