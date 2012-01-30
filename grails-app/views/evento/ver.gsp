
<%@ page import="general.Evento" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:fieldValue bean="${evento}" field="nombre"/></title>
                <style type="text/css">
      /* Override some defaults */
      html, body {
        background-color: #eee;
      }
      body {
        padding-top: 40px; /* 40px to make the container go all the way to the bottom of the topbar */
      }
      
      /* The white background content wrapper */
      .container > .content {
        background-color: #fff;
        padding: 20px;
        padding-top: 2px;
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
      .content .span10,
      .content .span4 {
        min-height: 500px;
      }
      /* Give a quick and non-cross-browser friendly divider */
      .content .span4 {
        margin-left: 0;
        width: 300px;
        padding-left: 19px;
        border-left: 1px solid #eee;
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
                    
                    <fieldset>
                            <center>
                            <img style="width: 500px; height: 260px;" src="${resource(dir: 'images', file: 'telon-rojoP.jpg')}" />
                            <p>
                              <br>
                              <g:if test="${flash.message}">
                                  <div class="message" ></div>
                                  <div class="alert-message success fade in" data-alert="alert" role="status">
                                    <a class="close" href="#">&times;</a>
                                    <p>${flash.message}</p>
                                  </div>
                              </g:if>
                            
                                <sec:ifNotLoggedIn>
                                    <a href="${createLink(controller:'usuario', action:'nuevo')}" class="btn info"><g:message code="menu.registrate" /></a> o
                                    <a data-controls-modal="login" data-backdrop="true" data-keyboard="true" class="btn info"><g:message code="login.iniciaSesion" /></a> para asistir al evento
                                </sec:ifNotLoggedIn>

                                <sec:ifLoggedIn>
                                  <g:link class="link azul" action="asistir" id="${evento?.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Asistir</g:link>
                                  <g:link class="link">Tal vez</g:link>
                                </sec:ifLoggedIn>
                            
                             </p>
                             
                            </center>
                            <br>
                            <ul class="tabs" data-tabs="tabs">
                              <li class="active"><a href="#infoGen">Informacion General</a></li>
                              <li><a href="#comentarios">Comentarios</a></li>
                              <li><a href="#fotos">Fotos</a></li>
                              <li><a href="#lugar">Lugar</a></li>
                              
                            </ul>
                          
                            <div id="my-tab-content" class="tab-content">
                              <div class="active tab-pane" id="infoGen">
                                
                                <h4><g:message code="evento.fechaInicio" /></h4>
                                <p>
                                    <g:if test="${evento?.fechaInicio}">
                                       <h5><g:formatDate date="${evento?.fechaInicio}"/></h5>
                                    </g:if>
                                </p>

                                <h4><g:message code="evento.fechaFin" /></h4>
                                <p>
                                    <g:if test="${evento?.fechaFin}">
                                       <h5><g:formatDate date="${evento?.fechaFin}"/></h5>
                                    </g:if>
                                </p>

                                <p>
                                    <g:if test="${evento?.costo}">
                                <h4><g:message code="evento.costo" /></h4>
                                       <h5>$<g:fieldValue bean="${evento}" field="costo"/></h5>
                                    </g:if>
                                </p>
                              </div>
                              <div class="tab-pane" id="comentarios">
                                <p>
                                <div class="fb-comments" data-href="http://escuelasabaticauniversitaria.org/" data-num-posts="2" data-width="570"></div>
                                </p>
                              </div>
                              <div class="tab-pane" id="fotos">
                                <p>Fotos</p>
                              </div>
                              <div class="tab-pane" id="lugar">
                                <h4><g:message code="evento.lugar" /></h4>
                                <p>
                                    <g:if test="${evento?.lugarDescripcion}">
                                       <h5><g:fieldValue bean="${evento}" field="lugarDescripcion"/></h5>
                                    </g:if>
                               
                                    <g:if test="${evento?.calle}">
                                       <h5><g:fieldValue bean="${evento}" field="calle"/></h5>
                                    </g:if>
                                
                                    <g:if test="${evento?.ciudad}">
                                       <h5><g:fieldValue bean="${evento}" field="ciudad"/></h5>
                                    </g:if>
                                
                                    <g:if test="${evento?.pais}">
                                       <h5><g:fieldValue bean="${evento}" field="pais"/></h5>
                                    </g:if>
                                </p>

                              </div>
                              
                            </div>

                     </fieldset>
                    
                    
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
