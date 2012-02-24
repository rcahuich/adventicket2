<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AdvenTicket</title>
    <meta name="Eventos de la Iglesia Adventista del Septimo Dia" content="">
    <meta name="" content="">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Estilos -->
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'iasd2.png')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'docs.css')}" type="text/css">
    <!-- JS javascript  -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'prettify.css')}" type="text/css">
    
    <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
    <script src="/adventicket/js/smoothscroll.js"></script>
    <script src="/adventicket/js/jquery.js"></script>
    <script src="/adventicket/js/google-code-prettify/prettify.js"></script>
    <script src="/adventicket/js/bootstrap-transition.js"></script>
    <script src="/adventicket/js/bootstrap-alert.js"></script>
    <script src="/adventicket/js/bootstrap-modal.js"></script>
    <script src="/adventicket/js/bootstrap-dropdown.js"></script>
    <script src="/adventicket/js/bootstrap-tab.js"></script>
    <script src="/adventicket/js/bootstrap-tooltip.js"></script>
    <script src="/adventicket/js/bootstrap-popover.js"></script>
    <script src="/adventicket/js/bootstrap-scrollspy.js"></script>
    <script src="/adventicket/js/bootstrap-button.js"></script>
    <script src="/adventicket/js/bootstrap-collapse.js"></script>
    <script src="/adventicket/js/bootstrap-carousel.js"></script>
    <script src="/adventicket/js/bootstrap-typeahead.js"></script>
    <script src="/adventicket/js/application.js"></script>
    <script src="/adventicket/js/prototype/prototype.js"></script>
    
    
  </head>

  <body data-spy="scroll" data-target="#navbarExample" data-offset="0">
      
    <div id="navbarExample" class="navbar navbar-fixed-top">
        <div class="navbar-inner">
          <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </a>
            <a class="brandImg" href="#home" ><img src="${resource(dir: 'images', file: 'logoPNG.png')}" alt="" title="" width="140" height="37" border="0" style="float: left"/> </a>
            
            <div class="nav-collapse">
              <ul class="nav">
                <li class="active"><a href="#home"> <i class="icon-home icon-white"></i></a></li>
                <li><a href="#nosotros"><g:message code="menu.nosotros" /></a></li>
                <li><a href="#contactanos"><g:message code="menu.contactanos" /></a></li>
                <li><a href="${createLink(uri: '/')}"><i class="icon-refresh icon-white"></i></a></li>
              </ul>
              
              <form class="navbar-search pull-left" action="">
                <input type="text" class="search-query span3" placeholder="Busca tu evento">
              </form>
              
              <ul class="nav pull-right">
                <sec:ifNotLoggedIn>

                 <li class="divider-vertical"></li>
                 <li><a href="${createLink(controller:'usuario', action:'nuevo')}"><g:message code="menu.registrate" /></a></li>
  <!--               <li><a href="${createLink(controller:'login', action:'auth')}"><g:message code="login.iniciaSesion" /></a></li>-->
                 <a data-toggle="modal" href="/#modalLogin" class="btn"><g:message code="login.iniciaSesion" /></a>

                </sec:ifNotLoggedIn>

                <sec:ifLoggedIn>

                      <li class="divider-vertical"></li>
                      <li id="fat-menu" class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><g:message code="menu.bienvenido" /> <sec:username /> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                          <li><a href="${createLink(controller:'usuario', action:'ver')}"><i class="icon-user"></i> <g:message code="menu.miCuenta" /></a></li>
                          <sec:ifAllGranted roles="ROLE_ADMIN">
                              <li><a href="${createLink(controller:'admin', action:'admin')}"><i class="icon-cog"></i> <g:message code="admin.inicio" /></a></li>
                          </sec:ifAllGranted>
                          <li class="divider"></li>
                          <li><a href="${createLink(controller:'logout')}"><i class="icon-off"></i> <g:message code="menu.cerrarSesion" /></a></li>
                        </ul>
                      </li>

                </sec:ifLoggedIn>
              </ul>
            </div>
          </div>
        </div>
    </div>
         
    <div class="container">
          
     <g:if test='${flash.message}'>
        <div class="alert alert-error fade in">
          <a class="close" data-dismiss="alert" href="#">&times;</a>
          <center>
          <p>${flash.message}</p>
          </center>
        </div>
     </g:if>
      
     <g:render template="/common/loggin" />
     <section id="home"> 
     <div class="well">
          <div class="row">
             <div class="span9">
                <div id="myCarousel" class="carousel slide">
                  <div class="carousel-inner">
                    <div class="item active">
                      <img src="${resource(dir: 'img', file: 'slider1.jpg')}" alt="">
                      <div class="carousel-caption">
                        <h4>Bienvenido</h4>
                        <p>Un lugar donde administrar los eventos de hoy en dia, con muchos servicios para ti</p>
                      </div>
                    </div>
                    <div class="item">
                      <img src="${resource(dir: 'img', file: 'slider2.jpg')}" alt="">
                      <div class="carousel-caption">
                        <h4>Crea tu evento facilmente</h4>
                        <p>Con solo dos click ya podras crear tus eventos y poder compartirlos con todos tus amigos</p>
                      </div>
                    </div>
                    <div class="item">
                      <img src="${resource(dir: 'img', file: 'slider3.jpg')}" alt="">
                      <div class="carousel-caption">
                        <h4>Ultimas noticias</h4>
                        <p>Encontraras las ultimas noticias acerca de lo mas necesario que pasa en los eventos</p>
                      </div>
                    </div>
                  </div>
                  <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                  <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
                </div>
             </div>
             <div class="span3" style="margin-left: 25px;">
                  <h3>Eventos por Venir</h3>
                  <br>
                  <p>
                  <g:if test="${eventos}">
                    <table class="table table-striped table-bordered table-condensed">
                          <tbody>
                          <g:each in="${eventos}" status="i" var="evento">
                                  <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td><g:link controller="evento" action="ver" id="${evento.id}"><h5>${fieldValue(bean: evento, field: "nombre")}</h5></g:link></td>
                                    <td><h5><g:formatDate date="${evento?.fechaInicio}"/></h5></td>
                                  </tr>
                          </g:each>
                          </tbody>
                    </table>
                  <a style="float: right" class="btn" href="${createLink(controller:'evento', action:'eventos')}">Ver más Eventos... &raquo;</a>
                  </g:if>
                  <g:else>
                      <p>Aun no hay ningun evento.</p>
                  </g:else>
                  </p>
              </div>
          </div>
       
          <header class="jumbotron masthead">
            <ul class="quick-links">
              <li class="tweet-btn"><a href="https://twitter.com/share" class="twitter-share-button" data-count="horizontal" data-text="Visita el sitio:" data-via="rbnseven" data-lang="es">Tweet</a></li>
              <li><a href="${createLink(controller:'evento', action:'nuevo')}" class="btn btn-primary">Crea tu Evento! &raquo;</a></li>
            </ul>
          </header>
       
          <hr class="soften">
       
          <div class="row" style="padding-left:25px;">
            <div class="span4">
              <h3>Administra a tus Asistentes</h3>
              <p>Like you, we love building awesome products on the web. We love it so much, we decided to help people just like us do it easier, better, and faster. Bootstrap is built for you.</p>
            </div>
            <div class="span4">
              <h3>Facil de encontrar</h3>
              <p>Bootstrap is designed to help people of all skill level&mdash;designer or developer, huge nerd or early beginner. Use it as a complete kit or use to start something more complex.</p>
            </div>
            <div class="span4">
              <h3>Siguenos en...</h3>
              <p>Bootstrap is designed to help people of all skill level&mdash;designer or developer, huge nerd or early beginner. Use it as a complete kit or use to start something more complex.</p>
            </div>
          </div><!--/row-->
      </div> <!-- /well -->
      </section>
      
      <section id="nosotros">
        <div class="well">
          <div class="page-header">
              <h1>Nosotros <small>Empresa altamente efectiva</small></h1>
          </div>
          <div class="row">
            <div class="span3 columns">
              <p>Phasellus sollicitudin feugiat metus nec gravida. Sed in nulla arcu, at egestas nunc. Aliquam blandit rutrum arcu sed iaculis. Curabitur vel sem ipsum. Cras egestas adipiscing tortor vitae congue. Donec at nibh magna. Ut tortor elit, auctor id varius vel, lacinia vel odio.</p>
            </div>
            <div class="span9 columns">
              <p>Phasellus sollicitudin feugiat metus nec gravida. Sed in nulla arcu, at egestas nunc. Aliquam blandit rutrum arcu sed iaculis. Curabitur vel sem ipsum. Cras egestas adipiscing tortor vitae congue. Donec at nibh magna. Ut tortor elit, auctor id varius vel, lacinia vel odio.</p>
              <br />
              <img class="small-bs-icon" src="${resource(dir: 'images', file: 'nosotros.jpg')}">
              <br />
              <br />
              <p>Phasellus sollicitudin feugiat metus nec gravida. Sed in nulla arcu, at egestas nunc. Aliquam blandit rutrum arcu sed iaculis. Curabitur vel sem ipsum. Cras egestas adipiscing tortor vitae congue. Donec at nibh magna. Ut tortor elit, auctor id varius vel, lacinia vel odio.</p>
            </div>
          </div>
      </section>
      
      <section id="contactanos">
        <div class="well">
          <div class="page-header">
              <h1>Contactanos <small>Empresa altamente efectiva</small></h1>
          </div>
          <div class="row">
            <div class="span3 columns">
              <img class="small-bs-icon" src="${resource(dir: 'images', file: 'contactanos.jpg')}">
            </div>
            <div class="span9 columns">
              <p>Phasellus sollicitudin feugiat metus nec gravida. Sed in nulla arcu, at egestas nunc. Aliquam blandit rutrum arcu sed iaculis. Curabitur vel sem ipsum. Cras egestas adipiscing tortor vitae congue. Donec at nibh magna. Ut tortor elit, auctor id varius vel, lacinia vel odio.</p>
              
              	<g:form onClick="validarEmail(document.getElementById('email').value);"
                name="solicitudInformacion" 
                action="solicitud"
                class="form-horizontal" 
                >
                  <fieldset>
                    <legend>Solicitar Información</legend>
                    <br />
                      <div id="mensajeEnviado" style="font-size: 13px; text-align: center; text-decoration: underline;">
                      </div>
                    <br />
                    <div class="control-group">
                      <label class="control-label" for="input01">Nombre *</label>
                      <div class="controls">
                        <input type="text" required="" name="nombre" class="input-xlarge">
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="input01">E-mail *</label>
                      <div class="controls">
                        <input type="email" required="" name="email" class="input-xlarge" >
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" for="textarea">Comentario *</label>
                      <div class="controls">
                        <textarea class="input-xlarge" required="" name="comentario" rows="3"></textarea>
                      </div>
                    </div>
                    
                    <div class="form-actions">
                      <button type="reset" class="btn">Limpiar</button>
                      <g:submitToRemote
                        type="submit"
                        class="btn btn-primary"
                        update="mensajeEnviado" 
                        value="Enviar"
                        url="[controller:'index', action:'solicitud']"
                        onLoading="showSpinner(true)"  
                        onComplete="showSpinner(false)">
                        <img id="spinner" style="display: none" src="${resource(dir: 'images', file: 'spinner.gif')}"/>
                      </g:submitToRemote>
                    </div>
                  </fieldset>
                
              </g:form>
              
            </div>
          </div>
      </section>
       
    </div> <!-- /container -->
    
    <g:render template="/common/footer" />
  </body>
<g:javascript>
           function showSpinner(visible) {
              $('spinner').style.display = visible ? "inline" : "none";
           }
           Ajax.Responders.register({
           onLoading: function() {
                 showSpinner(true);
           },
           onComplete: function() {
             if(!Ajax.activeRequestCount) showSpinner(false);
           }
           });
</g:javascript>

</html>
