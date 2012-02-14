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
    

    <!-- Iconos Touch -->
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">
  </head>

  <body>
    <div class="container">
          <g:if test='${flash.message}'>
            <div class="alert-message error" data-alert="alert">
              <a class="close" href="#">&times;</a>
              <center>
              <p>${flash.message}</p>
              </center>
            </div>
          </g:if>
      <!-- Contenedor Principal -->
      
     <div class="hero-unit">
       
       <div class="marketing">
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
              <img class="bs-icon" src="${resource(dir: 'img/iconIndex/', file: 'glyphicons_155_show_thumbnails.png')}">
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
        </div>
       
      <header class="jumbotron masthead">
        <ul class="quick-links">
          <li class="tweet-btn"><a href="https://twitter.com/share" class="twitter-share-button" data-count="horizontal" data-text="Visita el sitio:" data-via="rbnseven" data-lang="es">Tweet</a></li>
          <li><a href="${createLink(controller:'evento', action:'nuevo')}" class="btn btn-primary">Crea tu Evento! &raquo;</a></li>
        </ul>
      </header>
       
       <hr class="soften">
       
       <div class="marketing" style="padding-left: 40px;">
         <div class="row">
            <div class="span4">
              <img class="bs-icon" src="${resource(dir: 'img/iconIndex/', file: 'glyphicons_042_group.png')}">
              <h3>Administra a tus Asistentes</h3>
              <p>Like you, we love building awesome products on the web. We love it so much, we decided to help people just like us do it easier, better, and faster. Bootstrap is built for you.</p>
            </div>
            <div class="span4">
              <img class="bs-icon" src="${resource(dir: 'img/iconIndex/', file: 'glyphicons_266_book_open.png')}">
              <h3>Facil de encontrar</h3>
              <p>Bootstrap is designed to help people of all skill level&mdash;designer or developer, huge nerd or early beginner. Use it as a complete kit or use to start something more complex.</p>
            </div>
            <div class="span4">
              <img class="bs-icon" src="${resource(dir: 'img/iconIndex/', file: 'glyphicons_155_show_thumbnails.png')}">
              <h3>Siguenos en...</h3>
              <p>Bootstrap is designed to help people of all skill level&mdash;designer or developer, huge nerd or early beginner. Use it as a complete kit or use to start something more complex.</p>
            </div>
          </div><!--/row-->
        </div>
       </div> <!-- /containerUnit -->
    </div> <!-- /container -->

  </body>
</html>
