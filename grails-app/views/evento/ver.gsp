
<%@ page import="general.Evento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:fieldValue bean="${evento}" field="nombre"/></title>
            <style type="text/css">
      /* Override some defaults */
       body {
        padding-top: 40px; /* 40px to make the container go all the way to the bottom of the topbar */
      }

      .container {
        width: 960px; /* downsize our container to make the content feel a bit tighter and more cohesive. NOTE: this removes two full columns from the grid, meaning you only go to 14 columns and not 16. */
      }

      /* The white background content wrapper */
      .container > .content {
        background-color: #fff;
        padding: 0px 20px;
        margin: 0 0px; /* negative indent the amount of the padding to maintain the grid system */
        -webkit-border-radius: 0 0 6px 6px;
           -moz-border-radius: 0 0 6px 6px;
                border-radius: 0 0 6px 6px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
      }

      /* Page header tweaks */
      .page-header {
        background-color: #f5f5f5;
        padding: 20px 20px 10px;
        margin: -20px -20px 20px;
      }

      /* Styles you shouldn't keep as they are for displaying this base example only */
      .content .span10 {
        min-height: 600px;
        margin-left: 35px;
        width: 550px;
      }
      /* Give a quick and non-cross-browser friendly divider */
      .content .span4 {
        float: right;
        margin-left: 20px;
        padding-left: 19px;
        border-left: 1px solid #eee;
        min-height: 550px;
        width: 300px;
      }

    </style>
	</head>
        
	<body>
          
          <div class="container">
          <g:hiddenField name="id" value="${evento?.id}" />
          
              <div class="content">
                
                <div class="page-header">
                  <h1><g:fieldValue bean="${evento}" field="nombre"/> <small><g:fieldValue bean="${evento}" field="tipoSubEvento"/></small></h1>
                </div>
                
                <div class="row">
                  
                  <div class="span10">
                    
                            <center>
                            <img style="width: 500px; height: 260px;" src="${resource(dir: 'images', file: 'telon-rojoP.jpg')}" />
                            <p>
                              <br>
                              <g:if test="${flash.message}">
                                  <div class="alert alert-info fade in">
                                    <a class="close" data-dismiss="alert" href="#">&times;</a>
                                    <p>${flash.message}</p>
                                  </div>
                              </g:if>
                            
                                <sec:ifNotLoggedIn>
                                    <a href="${createLink(controller:'usuario', action:'nuevo')}" class="btn btn-primary"><g:message code="menu.registrate" /></a> o
                                    <a data-toggle="modal" href="#modalLogin" class="btn btn-primary"><g:message code="login.iniciaSesion" /></a> para asistir al evento
                                </sec:ifNotLoggedIn>

                                <sec:ifLoggedIn>
                                  <g:link class="btn btn-primary" action="asistir" id="${evento?.id}" onclick="return confirm('${message(code: 'evento.estaSeguro')}');">Asistir</g:link>
                                  <g:link class="btn">Tal vez</g:link>
                                </sec:ifLoggedIn>
                            
                             </p>
                             
                            </center>
                            <br>
                            
                            <ul id="tab" class="nav nav-tabs">
                              <li class="active"><a href="#infoGen" data-toggle="tab">Informacion General</a></li>
                              <li><a href="#fechas" data-toggle="tab">Fechas del Evento</a></li>
                              <li><a href="#comentarios" data-toggle="tab">Comentarios</a></li>
                              <li><a href="#fotos" data-toggle="tab">Fotos</a></li>
                              <li><a href="#lugar" data-toggle="tab">Lugar</a></li>
                              <g:if test="${evento?.costo}">
                              <li><a href="#costos" data-toggle="tab">Costos</a></li>
                              </g:if>
                            </ul>
                          
                            <div id="myTabContent" class="tab-content">
                              
                              <div class="tab-pane fade in active" id="infoGen">
                                <p>
                                    <g:if test="${evento?.descripcion}">
                                       <h3><g:message code="evento.descripcion" /></h3>
                                       <h4><g:fieldValue bean="${evento}" field="descripcion"/></h4>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.quienesPuedenAsistir}">
                                       <h3><g:message code="evento.quienesPuedenAsistir" /></h3>
                                       <h4><g:fieldValue bean="${evento}" field="quienesPuedenAsistir"/></h4>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.capacidad}">
                                       <h3><g:message code="evento.capacidad" /></h3>
                                       <h4><g:fieldValue bean="${evento}" field="capacidad"/></h4>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.nombreConferencias}">
                                       <h3><g:message code="evento.nombreConferencias" /></h3>
                                       <h4><g:fieldValue bean="${evento}" field="nombreConferencias"/></h4>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.nombrePonentes}">
                                       <h3><g:message code="evento.nombrePonentes" /></h3>
                                       <h4><g:fieldValue bean="${evento}" field="nombrePonentes"/></h4>
                                    </g:if>
                                </p>
                              </div>
                              
                              <div class="tab-pane fade" id="fechas">
                                <p>
                                    <g:if test="${evento?.fechaInicio}">
                                       <h3><i class="icon-calendar"></i> <g:message code="evento.fechaInicio" /></h3>
                                       <h4><g:formatDate date="${evento?.fechaInicio}"/></h4>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.fechaFin}">
                                       <h3><i class="icon-calendar"></i> <g:message code="evento.fechaFin" /></h3>
                                       <h4><g:formatDate date="${evento?.fechaFin}"/></h4>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.cierreInscripciones}">
                                       <h3><i class="icon-calendar"></i> <g:message code="evento.cierreInscripciones" /></h3>
                                       <h4><g:formatDate date="${evento?.cierreInscripciones}"/></h4>
                                    </g:if>
                                </p>
                                
                              </div>
                              
                              <div class="tab-pane fade" id="comentarios">
                                <p>
                                <div class="fb-comments" data-href="http://escuelasabaticauniversitaria.org/" data-num-posts="2" data-width="570"></div>
                                </p>
                              </div>
                              
                              <div class="tab-pane fade" id="fotos">
                                <p>Fotos</p>
                              </div>
                              
                              <div class="tab-pane fade" id="lugar">
                                <h3><g:message code="evento.lugar" /></h3>
                                <p>
                                    <g:if test="${evento?.lugarDescripcion}">
                                       <h4><g:fieldValue bean="${evento}" field="lugarDescripcion"/></h4>
                                    </g:if>
                               
                                    <g:if test="${evento?.calle}">
                                       <h4><g:fieldValue bean="${evento}" field="calle"/></h4>
                                    </g:if>
                                
                                    <g:if test="${evento?.ciudad}">
                                       <h4><g:fieldValue bean="${evento}" field="ciudad"/></h4>
                                    </g:if>
                                
                                    <g:if test="${evento?.pais}">
                                       <h4><g:fieldValue bean="${evento}" field="pais"/></h4>
                                    </g:if>
                                </p>
                              </div>
                              
                              <g:if test="${evento?.costo}">
                              <div class="tab-pane fade" id="costos">
                                <p>
                                    <g:if test="${evento?.costo}">
                                       <h3><g:message code="evento.costo" /></h3>
                                       <h4>$<g:fieldValue bean="${evento}" field="costo"/></h4>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.queIncluyeElPago}">
                                       <h3><g:message code="evento.queIncluyeElPago" /></h3>
                                       <h4><g:fieldValue bean="${evento}" field="queIncluyeElPago"/></h4>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.descuento}">
                                       <h3><g:message code="evento.costoPagoAnticipado" /></h3>
                                       <h4>$<g:fieldValue bean="${evento}" field="costoPagoAnticipado"/></h4>
                                       <h3><g:message code="evento.finPagoAnticipado" /></h3>
                                       <h4><h4><g:formatDate date="${evento?.finPagoAnticipado}"/></h4></h4>
                                    </g:if>
                                </p>
                              </div>
                              </g:if>
                            </div>

                  </div>
                  
                  <div class="span4">
                    
                    <h4>Comparte</h4>
                    <!-- AddThis Button BEGIN -->
                    <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
                    <a class="addthis_button_preferred_1"></a>
                    <a class="addthis_button_preferred_2"></a>
                    <a class="addthis_button_preferred_3"></a>
                    <a class="addthis_button_preferred_4"></a>
                    <a class="addthis_button_compact"></a>
                    <a class="addthis_counter addthis_bubble_style"></a>
                    </div>
                    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4f1ed4da63bcd7a4"></script>
                    <!-- AddThis Button END -->
                    
                  </div>
                  
                </div>
              </div>

          </div> <!-- /container -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1&appId=137308453034563";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
	</body>
</html>
