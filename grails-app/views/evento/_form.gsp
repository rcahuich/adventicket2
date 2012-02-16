<%@ page import="general.Evento" %>

<legend>1. <g:message code="evento.informacionGeneral" /></legend>
<div style="margin-left: 50px;">
            <label class="control-label" for="input01"><g:message code="evento.nombre" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <input type="text" class="input-xlarge" name="nombre" required="" value="${evento?.nombre}" autofocus>
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.descripcion" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <textarea id="textarea" rows="3" type="text" class="span9" name="descripcion" required="" value="${evento?.descripcion}"></textarea>
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.quienesPuedenAsistir" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <textarea id="textarea" rows="2" type="text" class="span9" name="quienesPuedenAsistir" required="" value="${evento?.quienesPuedenAsistir}"></textarea>
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.capacidad" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <g:field type="number" class="input-mini" name="capacidad" required="" value="${evento.capacidad}"/>
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.nombreConferencias" /> </label>
            <div class="controls" style="margin-left: 30px;">
              <textarea id="textarea" rows="4" type="text" class="span9" name="nombreConferencias"  value="${evento?.nombreConferencias}"></textarea>
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.nombrePonentes" /> </label>
            <div class="controls" style="margin-left: 30px;">
              <textarea id="textarea" rows="4" type="text" class="span9" name="nombrePonentes" value="${evento?.nombrePonentes}"></textarea>
            </div>
            <br>
            <label class="control-label" for="input01">
              <g:message code="evento.costoTitulo" />
            </label>
            <label class="control-label" for="input01" style="margin-left: 30px;">
              <div class="btn-group" data-toggle="buttons-radio">
                                <a id="si" href="#si" class="btn btn-primary">Si</a>
                                <a id="no" href="#no" class="btn btn-primary">No</a>
              </div>
            </label>
            <div class="controls" style="margin-left: 30px;">
            <div id="divSi" style="display:none">
                    <label class="control-label" for="xlInput">
                      <g:message code="evento.costo" />
                    </label>
                    <div class="controls">
                      <g:field type="number" class="input-mini" name="costo" value="${evento.costo}" step="0.01"/>
                      <p>
                        <g:message code="evento.costoMensaje" />
                      </p>
                    </div>
                    <br>
                    <label class="control-label" for="input01"><g:message code="evento.queIncluyeElPago" /> *</label>
                    <div class="controls">
                      <textarea id="textarea" rows="2" type="text" class="span9" name="queIncluyeElPago" value="${evento?.queIncluyeElPago}"></textarea>
                    </div>
                    <br>
                    <label class="control-label" for="input01">
                      <g:message code="evento.descuentoAnticipado" />
                    </label>
                    <label class="control-label" for="input01" style="margin-left: 30px;">
                      <div class="btn-group" data-toggle="buttons-radio">
                                        <a id="siDescuento" href="#siDescuento" class="btn btn-primary">Si</a>
                                        <a id="noDescuento" href="#noDescuento" class="btn btn-primary">No</a>
                      </div>
                    </label>
                    <div class="controls" style="margin-left: 30px;">
                    <div id="divSiDescuento" style="display:none">
                            <label class="control-label" for="xlInput">
                              <g:message code="evento.costoPagoAnticipado" />
                            </label>
                            <div class="controls">
                              <g:field type="number" class="input-mini" name="costoPagoAnticipado" value="${evento.costoPagoAnticipado}" step="0.01"/>
                            </div>
                            <br>
                            <label class="control-label" for="input01"><g:message code="evento.finPagoAnticipado" /> </label>
                            <div class="controls">
                              <g:datePicker class="small" name="finPagoAnticipado" precision="minute"  value="${evento?.finPagoAnticipado}"/>
                            </div>
                    </div>
                    <div id="divNoDescuento">
                      <div class="input">
                        <g:message code="evento.costoPagoAnticipadoMensajeNO" />
                      </div>
                    </div>
                    </div>
                    
            </div>
            <div id="divNo">
              <div class="input">
                <g:message code="evento.costoMensajeNoCosto" />
              </div>
            </div>
            </div>
            <br>
            <label class="control-label" for="input01">
              <g:message code="evento.incluiraComida" />
            </label>
            <label class="control-label" for="input01" style="margin-left: 30px;">
              <div class="btn-group" data-toggle="buttons-radio">
                                <a id="siComida" href="#siComida" class="btn btn-primary">Si</a>
                                <a id="noComida" href="#noComida" class="btn btn-primary">No</a>
              </div>
            </label>
            <div class="controls" style="margin-left: 30px;">
            <div id="divSiComida" style="display:none">
                    <div class="controls">
                      <g:message code="evento.incluyeComida" /> :<g:field type="number" class="input-mini" name="numeroComidas" value="${evento.numeroComidas}"/> <g:message code="evento.costoComida" /> <g:field type="number" class="input-mini" name="costoComida" value="${evento.costoComida}" step="0.01"/>
                      <p>
                        <g:message code="evento.incluyeComidaMensaje" />
                      </p>
                    </div>
                    <br>
                    
            </div>
            <div id="divNoComida">
              <div class="input">
                <g:message code="evento.incluyeComidaMensajeNoComida" />
              </div>
            </div>
            </div>
            <br>
            
</div>            
<legend>2. <g:message code="evento.lugarTitulo" /></legend>
<div style="margin-left: 50px;">
            <label class="control-label" for="input01"><g:message code="evento.lugarDescripcion" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <input class="input-xlarge" name="lugarDescripcion" type="text" required="" value="${evento?.lugarDescripcion}">
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.calle" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <input class="input-xlarge" name="calle" type="text" required="" value="${evento?.calle}">
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.ciudad" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <input class="input-xlarge" name="ciudad" type="text" required="" value="${evento?.ciudad}">
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.pais" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <g:select name="pais" from="${evento.constraints.pais.inList}" value="${evento?.pais}" valueMessagePrefix="evento.pais"  />
            </div>
            <br>
</div>
<legend>3. <g:message code="evento.fechaTitulo" /></legend>
<div style="margin-left: 50px;">
            <label class="control-label" for="input01"><g:message code="evento.fechaInicio" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <g:datePicker class="small" name="fechaInicio" precision="minute"  value="${evento?.fechaInicio}"/>
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.fechaFin" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <g:datePicker class="small" name="fechaFin" precision="minute"  value="${evento?.fechaFin}"/>
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.cierreInscripciones" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <g:datePicker class="small" name="cierreInscripciones" precision="minute"  value="${evento?.cierreInscripciones}"/>
            </div>
            <br>
</div>
<legend>4. <g:message code="evento.tipoEventoTitulo" /></legend>
<div style="margin-left: 50px;">
            <label class="control-label" for="input01"><g:message code="evento.tipoEvento" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <g:select id="tipoSubEvento" class="span9" name="tipoSubEvento.id" from="${general.TipoSubEvento.list()}" optionKey="id" required="" value="${evento?.tipoSubEvento?.id}" class="many-to-one"/>
            </div>
            <br>
</div>
<legend>5. <g:message code="evento.contactos" /></legend>
<div style="margin-left: 50px;">
            <label class="control-label" for="input01"><g:message code="evento.contacto" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <input class="input-xlarge" name="contacto" type="text" required="" value="${evento?.contacto}">
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.telefono" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <g:textField class="input-xlarge" name="telefono" pattern="${evento.constraints.telefono.matches}" value="${evento?.telefono}"/>
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="evento.correo" /> *</label>
            <div class="controls" style="margin-left: 30px;">
              <input class="input-xlarge" type="email" name="correo" maxlength="128" required="" value="${evento?.correo}" />
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
<r:script>
    $(document).ready(function(){
      $("a#siComida").click(function(e){
        e.preventDefault();
        $("#divNoComida").slideUp();
        $("#divSiComida").slideDown();
      });
      $("a#noComida").click(function(e){
        e.preventDefault();
        $("#divSiComida").slideUp();
        $("#divNoComida").slideDown();
        
      });
    });
</r:script>
<r:script>
    $(document).ready(function(){
      $("a#siDescuento").click(function(e){
        e.preventDefault();
        $("#divNoDescuento").slideUp();
        $("#divSiDescuento").slideDown();
      });
      $("a#noDescuento").click(function(e){
        e.preventDefault();
        $("#divSiDescuento").slideUp();
        $("#divNoDescuento").slideDown();
        
      });
    });
</r:script>