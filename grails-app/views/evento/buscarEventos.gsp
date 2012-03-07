<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>AdvenTicket | Buscar Eventos</title>
    <meta name="Eventos de la Iglesia Adventista del Septimo Dia" content="">
    <meta name="" content="">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Estilos -->
    <meta name="layout" content="main"/>
    <r:require module="jquery-ui"/>
    <jqui:resources theme="ui-flick" />
  </head>

  <body>
    <div class="container">
      <section>
      <!-- Contenedor Principal -->
      
         <ul class="breadcrumb">
          <li><a href="${createLink(uri: '/')}">Inicio</a> <span class="divider">/</span></li>
          <li class="active">Buscar más Eventos</li>
         </ul>
      
     <div class="well">
       
          <g:if test='${flash.message}'>
            <div class="alert alert-info fade in">
              <a class="close" data-dismiss="alert" href="#">&times;</a>
              <center>
              <p>${flash.message}</p>
              </center>
            </div>
          </g:if>
         
         
         <hr class="soften">
       
         <div class="marketing">
           <div class="row">
              
              <div class="span3">
                <img class="bs-icon" src="${resource(dir: 'img/iconIndex/', file: 'glyphicons_042_group.png')}">
                <h3>Administra a tus Asistentes</h3>
                <p>Like you, we love building awesome products on the web. We love it so much, we decided to help people just like us do it easier, better, and faster. Bootstrap is built for you.</p>
              </div>
             
              <div class="span9">
                <div class="form-search">
                  <br/>
                  
                  <div class="form-horizontal">
                  <g:form method="post">
                    <div class="control-group">
                      <label class="control-label" for="input01">Nombre del Evento </label>
                      <div class="controls">
                        <input type="text" name="nombreEvento" value="${params.nombreEvento}" class="input-large search-query">
                        <g:actionSubmit action="buscarEventos" value="Buscar" class="btn btn-small btn-primary" />
                      </div>
                    </div>
                    <div class="controls">
                      <a id="toggleEffect" href="#" data-toggle="button" class="btn btn-small">Busqueda Avanzada</a>
                    </div>
                    <br/>
                    
                    <div id="divBusquedaAvanzada" style="display:<g:if test="${params.fechaInicio || params.fechaFin}">block</g:if><g:else>none</g:else>;">

                      <div class="control-group">
                        <label class="control-label" for="input01"><g:message code="evento.tipoEvento" /></label>
                        <div class="controls">
                          <g:select 
                            id="tipoSubEvento" 
                            class="span9" 
                            name="tipoSubEvento" 
                            noSelection="${['todos':'Todos']}"
                            from="${general.TipoSubEvento.list()}" 
                            optionKey="nombre" 
                            required="" 
                            value="${evento?.tipoSubEvento?.nombre}" 
                            class="many-to-one"/>
                        </div>
                        <br>
                        <label class="control-label" for="input01">Desde el </label>
                        <div class="controls">
                          <g:textField name="fechaInicio" id="fechaInicio" class="input-small search-query" required="" value="${params.fechaInicio}" />
                        </div>
                        <br>
                        <label class="control-label" for="input01">Hasta el </label>
                        <div class="controls">
                          <g:textField name="fechaFin" id="fechaFin" class="input-small search-query" required="" value="${params.fechaFin}" />
                        </div>
                        <br>
                      </div>
                    </div>
                  </g:form>
                  
                  </div>
                </div>
              </div>
            </div><!--/row-->
            
              <div id="resultados">
                <g:if test="${eventosBusqueda}">
                <hr class="soften">
                <div class="alert alert-info fade in">
                  <a class="close" data-dismiss="alert" href="#">&times;</a>
                  <i class="icon-info-sign"></i> Resultados de la busqueda...
                </div>
                      <table class="table table-bordered">
                              <thead>
                                      <tr>
                                              <g:sortableColumn property="nombre" title="${message(code: 'evento.nombre')}" />
                                              <g:sortableColumn property="nombre" title="${message(code: 'evento.lugar')}" />
                                              <g:sortableColumn property="nombre" title="${message(code: 'evento.fechaInicio')}" />
                                      </tr>
                              </thead>
                              <tbody>
                              <g:each in="${eventosBusqueda}" status="i" var="evento">
                                      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                              <td><g:link action="ver" id="${evento.id}"><h5>${fieldValue(bean: evento, field: "nombre")}</h5></g:link></td>
                                              <td>${fieldValue(bean: evento, field: "lugarCompleto")}</td>
                                              <td><g:formatDate date="${evento?.fechaInicio}"/></td>
                                      </tr>
                              </g:each>
                              </tbody>
                      </table>
                </g:if>
              </div>
         <hr class="soften">
         
       </div> <!-- well -->
       </section>
    </div> <!-- /container -->

  </body>
  <r:script>
          $(function() {
            $("input#fechaInicio" ).datepicker({dateFormat: 'dd/mm/yy'});
            $("input#fechaInicio").datepicker($.datepicker.regional['es']);
            $("input#fechaInicio").datepicker("option","firstDay",0);
            $("input#fechaFin" ).datepicker({dateFormat: 'dd/mm/yy'});
            $("input#fechaFin").datepicker($.datepicker.regional['es']);
            $("input#fechaFin").datepicker("option","firstDay",0);
            function runEffect() {
	            $('#divBusquedaAvanzada').toggle('blind',{},500);
	            }
                    $("#toggleEffect").click(function() {
                            runEffect();
                            return true;
             })
          });                   
  </r:script>
</html>
