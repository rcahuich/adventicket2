<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
    <title><g:fieldValue bean="${evento}" field="nombre"/></title>
  </head>
  <body>
    <div class="container">
      <section>
          <div class="well">
            <div class="marketing">
                    <h1><g:message code="evento.solicitudTitulo" /></h1>
                    <p class="marketing-byline"><g:message code="evento.solicitudSubTitulo" /></p>
            </div>
            
            <hr class="soften"/>
            
            <h4>Información General del Evento</h4>
            <br />
            <div class="row">
              <div class="span4">
                <h4><g:message code="evento.nombre" /></h4>
                <g:fieldValue bean="${evento}" field="nombre"/>
              </div>
              <div class="span4">
                <h4><g:message code="evento.tipoEvento" /></h4>
                <g:fieldValue bean="${evento}" field="tipoSubEvento"/>
              </div>
              <div class="span5">
                <h4><g:message code="evento.lugar" /></h4>
                <g:fieldValue bean="${evento}" field="lugarCompleto"/>
              </div>
            </div>
            <br />
            
            <div class="row">
              <div class="span4">
                <h4><i class="icon-calendar"></i> <g:message code="evento.fechaInicio" /></h4>
                <g:formatDate date="${evento?.fechaInicio}"/>
              </div>
              <div class="span4">
                <h4><i class="icon-calendar"></i> <g:message code="evento.fechaFin" /></h4>
                <g:formatDate date="${evento?.fechaFin}"/>
              </div>
              <div class="span4">
                <h4><i class="icon-calendar"></i> <g:message code="evento.finInscripciones" /></h4>
                <g:formatDate date="${evento?.cierreInscripciones}"/>
              </div>
            </div>
            <br />
            
            <div class="row">
              <div class="span4">
                <h4><g:message code="evento.capacidadSolicitud" /></h4>
                <g:fieldValue type="number" bean="${evento}" field="capacidad"/>
              </div>
              <div class="span7">
                <h4><g:message code="evento.alimentosSolicitud" /></h4>
                <g:if test="${evento?.comidas}">
                Contara con servicio de alimentos con valor de <g:fieldValue bean="${evento}" field="numeroComidas"/> comida(s) por el costo de
                <g:formatNumber number="${evento.costoComida}" type="currency" />
                </g:if>
                <g:else>
                  No se vendera comida en el Evento
                </g:else>
              </div>
            </div>
            <br />
            
            <div class="row">
              <div class="span6">
                <h4><g:message code="evento.nombreConferenciasVista" /></h4>
                <g:fieldValue bean="${evento}" field="nombreConferencias"/>
              </div>
              <div class="span6">
                <h4><g:message code="evento.nombrePonentesVista" /></h4>
                <g:fieldValue bean="${evento}" field="nombrePonentes"/>
              </div>
            </div>
            <br />
            <br />
            
            <h4>Costos del Evento</h4>
            <br />
            <div class="row">
              <div class="span4">
                <h4><g:message code="evento.costoEvento" /></h4>
                <g:formatNumber number="${evento.costo}" type="currency" />
              </div>
              <div class="span7">
                <h4><g:message code="evento.incluyePago" /></h4>
                <g:fieldValue bean="${evento}" field="queIncluyeElPago"/>
              </div>
            </div>
            <br />
        
            <div class="row">
              <div class="span4">
                <h4><g:message code="evento.descuentoPagoAnticipado" /></h4>
                <g:checkBox name="descuento" value="${evento?.descuento}" disabled="true"/>
              </div>
              <div class="span4">
                <h4><g:message code="evento.costoEventoAnticipado" /></h4>
                <g:if test="${evento?.descuento}">
                <g:formatNumber number="${evento.costoPagoAnticipado}" type="currency" />
                </g:if>
                <g:else>
                  -
                </g:else>
              </div>
              <div class="span4">
                <h4><g:message code="evento.finPagoAnticipado" /></h4>
                <g:if test="${evento?.descuento}">
                <g:formatDate date="${evento?.finPagoAnticipado}"/>
                </g:if>
                <g:else>
                  -
                </g:else>
              </div>
              
            </div>
            <br />
            <br />
            
            <h4>Contacto</h4>
            <br />
            <div class="row">
              <div class="span4">
                <h4><g:message code="evento.contacto" /></h4>
                <g:fieldValue bean="${evento}" field="contacto"/>
              </div>
              <div class="span4">
                <h4><g:message code="evento.telefono" /></h4>
                <g:fieldValue bean="${evento}" field="telefono"/>
              </div>
              <div class="span4">
                <h4><g:message code="evento.correo" /></h4>
                <g:fieldValue bean="${evento}" field="correo"/>
              </div>
            </div>
            <br />
            <br />
            
            <h4>Estatus del Evento</h4>
            <br />
            <div class="row">
              <div class="span4">
                <h4><g:message code="evento.statusSolicitud" /></h4>
                <g:fieldValue bean="${evento}" field="statusSolicitud"/>
              </div>
              <div class="span4">
                <h4><g:message code="evento.statusEvento" /></h4>
                <g:fieldValue bean="${evento}" field="statusEvento"/>
              </div>
             </div>
            <br />
            <div class="hero-unit">
              <center>
                <g:form method="post">
                    <g:hiddenField name="id" value="${evento?.id}" />
                    Elija una opción:
                    <br />
                    <br />
                    <g:actionSubmit class="btn btn-large btn-primary large" action="eventoAceptado" value="${message(code: 'evento.acepta')}" onclick="return confirm('${message(code: 'evento.aceptaMensaje')}');" />
                    <g:if test="${evento?.statusSolicitud != 'RECHAZADO' && evento?.statusSolicitud != 'CANCELADO'}">
                    <g:actionSubmit class="btn btn-large btn-danger" action="eventoRechazado" value="${message(code: 'evento.rechaza')}" onclick="return confirm('${message(code: 'evento.rechazaMensaje')}');" />
                    </g:if>
                    <g:if test="${evento?.statusSolicitud != 'CANCELADO'}">
                    <g:actionSubmit class="btn btn-large btn-warning large" action="eventoCancelado" value="${message(code: 'evento.cancela')}" onclick="return confirm('${message(code: 'evento.cancelaMensaje')}');" />
                    </g:if>
                </g:form>
              </center>
            </div>
          </div>
      </section>
    </div>
  </body>
</html>
