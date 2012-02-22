<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>AdvenTicket</title>
    <meta name="Eventos de la Iglesia Adventista del Septimo Dia" content="">
    <meta name="" content="">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Estilos -->
    <meta name="layout" content="main"/>

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
                  <div class="btn-group" data-toggle="buttons-radio">
                    <a id="buscar" href="#buscar" class="btn btn-small" >Buscar</a>
                    <a id="buscaquedaAvanzada" href="#buscaquedaAvanzada" class="btn btn-small">Busqueda Avanzada</a>
                  </div>
                  <br>
                  
                  <div id="divBuscar">
                    <form class="form-horizontal">
                      <div class="control-group">
                      <br>
                        <label class="control-label" for="input01">Nombre del Evento </label>
                        <div class="controls">
                          <input type="text" class="input-large search-query">
                        </div>
                        <br>
                        <div class="controls">
                          <button type="submit" id="fat-btn" data-loading-text="buscando..." class="btn btn-small btn-primary">Buscar</button>
                        </div>
                      </div>
                    </form>
                  </div>
                  <div id="divBusquedaAvanzada" style="display:none">
                    <form class="form-horizontal">
                      <div class="control-group">
                        <br>
                        <label class="control-label" for="input01">Nombre del Evento </label>
                        <div class="controls">
                          <input type="text" class="input-large search-query">
                        </div>
                        <br>
                        <label class="control-label" for="input01"><g:message code="evento.tipoEvento" /></label>
                        <div class="controls">
                          <g:select id="tipoSubEvento" class="span9" name="tipoSubEvento.id" from="${general.TipoSubEvento.list()}" optionKey="id" required="" value="${evento?.tipoSubEvento?.id}" class="many-to-one"/>
                        </div>
                        <br>
                        <label class="control-label" for="input01">Desde el </label>
                        <div class="controls">
                          <g:datePicker class="small" name="fechaInicio" precision="day"  value=""/>
                        </div>
                        <br>
                        <label class="control-label" for="input01">Hasta el </label>
                        <div class="controls">
                          <g:datePicker class="small" name="fechaFin" precision="day"  value=""/>
                        </div>
                        <br>
                        <div class="controls">
                          <button type="submit" id="fat-btn" data-loading-text="buscando..." class="btn btn-small btn-primary">Buscar</button>
                        </div>
                        
                      </div>
                    </form>
                  </div>
                </div>
                
              </div>
            </div><!--/row-->
          </div>
       
         <hr class="soften">
         
       </div> <!-- well -->
       </section>
    </div> <!-- /container -->

  </body>
  <r:script>
    $(document).ready(function(){
      $("a#buscar").click(function(e){
        e.preventDefault();
        $("#divBusquedaAvanzada").slideUp();
        $("#divBuscar").slideDown();
        $("input#costo").focus();
      });
      $("a#buscaquedaAvanzada").click(function(e){
        e.preventDefault();
        $("#divBuscar").slideUp();
        $("#divBusquedaAvanzada").slideDown();
        
      });
    });
</r:script>
</html>
