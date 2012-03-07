
<%@ page import="general.Evento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:fieldValue bean="${evento}" field="nombre"/></title>
            <style type="text/css">
            /* Page header tweaks */
            .page-header {
              background-color: #f5f5f5;
              padding: 25px 0px 15px 25px;
              margin: -30px -30px 30px -10px;
                border-bottom: 1px solid #dddddd;
                border-radius: 5px 5px 0 0;
            }
            
            .page-header h1{
              font-size: 25px;
              text-align: center;
            }
            
            
           
            </style>
	</head>
        
	<body>
          
          <div class="container">
            <section>
            <g:hiddenField name="id" value="${evento?.id}" />
          
              <div>
                
                
                <div class="well">
                  
                  <div class="row">
                    
                    <div class="page-header">
                            <h1><g:fieldValue bean="${evento}" field="nombre"/> <br /><small><g:fieldValue bean="${evento}" field="tipoSubEvento"/></small></h1>
                            <!-- AddThis Button BEGIN -->
                            <br />
                            <div style="text-align: center;">
                              <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
                              <a class="addthis_button_tweet"></a>
                              <a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
                            </div>
                            <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4f47c47b3dfe2b78"></script>
                            <!-- AddThis Button END -->
                    </div>
                    
                    <div class="span9 columns">
                      
                            <center>
                            <img style="width: 500px; height: 260px;" src="${resource(dir: 'images', file: 'telon-rojoP.jpg')}" />
                            <br />
                            <br />
                              <g:if test="${flash.message}">
                                  <div class="alert alert-info fade in">
                                    <a class="close" data-dismiss="alert" href="#">&times;</a>
                                    <p>${flash.message}</p>
                                  </div>
                              </g:if>
                            <br />
                            <br />
                             
                            </center>
                      
                            <ul id="tab" class="nav nav-tabs">
                              <li class="active"><a href="#infoGen" data-toggle="tab"><g:message code="evento.informacionGeneral" /></a></li>
                              <li><a href="#fechas" data-toggle="tab"><g:message code="evento.fechas" /></a></li>
                              <li><a href="#comentarios" data-toggle="tab"><g:message code="evento.comentarios" /></a></li>
<!--                              <li><a href="#fotos" data-toggle="tab"><g:message code="evento.fotos" /></a></li>-->
                              <li><a href="#lugar" data-toggle="tab"><g:message code="evento.lugar" /></a></li>
                              <g:if test="${evento?.costo}">
                              <li><a href="#costos" data-toggle="tab"><g:message code="evento.precios" /></a></li>
                              </g:if>
                            </ul>
                          
                            <div id="myTabContent" class="tab-content">
                              
                              <div class="tab-pane fade in active" id="infoGen">
                                <p>
                                    <g:if test="${evento?.descripcion}">
                                       <h5><g:message code="evento.descripcionVista" /></h5>
                                       <g:fieldValue bean="${evento}" field="descripcion"/>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.quienesPuedenAsistir}">
                                       <h5><g:message code="evento.quienesPuedenAsistirVista" /></h5>
                                       <g:fieldValue bean="${evento}" field="quienesPuedenAsistir"/>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.capacidad}">
                                       <h5><g:message code="evento.capacidadVista" /></h5>
                                       <g:fieldValue bean="${evento}" field="capacidad"/>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.nombreConferencias}">
                                       <h5><g:message code="evento.nombreConferenciasVista" /></h5>
                                       <g:fieldValue bean="${evento}" field="nombreConferencias"/>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.nombrePonentes}">
                                       <h5><g:message code="evento.nombrePonentesVista" /></h5>
                                       <g:fieldValue bean="${evento}" field="nombrePonentes"/>
                                    </g:if>
                                </p>
                              </div>
                              
                              <div class="tab-pane fade" id="fechas">
                                <p>
                                    <g:if test="${evento?.fechaInicio}">
                                       <h5><i class="icon-calendar"></i> <g:message code="evento.fechaInicio" /></h5>
                                       <g:formatDate date="${evento?.fechaInicio}"/>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.fechaFin}">
                                       <h5><i class="icon-calendar"></i> <g:message code="evento.fechaFin" /></h5>
                                       <g:formatDate date="${evento?.fechaFin}"/>
                                    </g:if>
                                </p>
                                <p>
                                    <g:if test="${evento?.cierreInscripciones}">
                                       <h5><i class="icon-calendar"></i> <g:message code="evento.cierreInscripciones" /></h5>
                                       <g:formatDate date="${evento?.cierreInscripciones}"/>
                                    </g:if>
                                </p>
                                
                              </div>
                              
                              <div class="tab-pane fade" id="comentarios">
                                <p>
                                <div class="fb-comments" data-href="http://escuelasabaticauniversitaria.org/" data-num-posts="2" data-width="680"></div>
                                </p>
                              </div>
                              
<!--                              <div class="tab-pane fade" id="fotos">
                                <p>Fotos</p>
                              </div>-->
                              
                              <div class="tab-pane fade" id="lugar">
                                <h5><g:message code="evento.lugar" /></h5>
                                <p>
                                    <g:if test="${evento?.lugarDescripcion}">
                                       <g:fieldValue bean="${evento}" field="lugarDescripcion"/>
                                    </g:if>
                                    <br />
                                    <g:if test="${evento?.calle}">
                                       <g:fieldValue bean="${evento}" field="calle"/>
                                    </g:if>
                                    <br />
                                
                                    <g:if test="${evento?.ciudad}">
                                       <g:fieldValue bean="${evento}" field="ciudad"/>
                                    </g:if>
                                    <br />
                                
                                    <g:if test="${evento?.pais}">
                                       <g:fieldValue bean="${evento}" field="pais"/>
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
                    
                    <div class="span4 columns" style="border-left: 1.5px solid #eee; height: 350px;">
                      <div class="row">
                        <div class="span4">
                            <sec:ifNotLoggedIn>
                              <center>
                                <a href="${createLink(controller:'usuario', action:'nuevo')}" class="btn btn-primary" style="width: 120px;"><g:message code="menu.registrate" /></a> 
                                <br />
                                o
                                <br />
                                <a data-toggle="modal" href="#modalLogin" class="btn btn-primary" style="width: 120px;"><g:message code="login.iniciaSesion" /></a> 
                                <br />
                                para asistir al evento
                              </center>
                            </sec:ifNotLoggedIn>
                                <br />
                            <sec:ifLoggedIn>
                              <center>
                              <g:link class="btn btn-primary" action="asistir" style="width: 120px;" id="${evento?.id}" onclick="return confirm('${message(code: 'evento.estaSeguro')}');">Asistir</g:link>
                                <br />
                                <br />
                              <g:link class="btn" style="width: 120px;">Tal vez</g:link>
                              </center>
                            </sec:ifLoggedIn>
                            <br />
                         </div>
                        <div class="span4" style="padding-left: 30px;">
                            <br />
                            <h4>Siguenos a travez de</h4>
                         </div>
                        <div class="span4" style="padding-left: 30px;">
                            <br />
                            <h4>Proximos Eventos</h4>
                         </div>
                      </div>
                            
                    </div>

                  </div>
                </div>
              </div>
          </section>
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
