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
        <h1>Bienvenidos!</h1>
        <p>Vestibulum id ligula porta felis euismod semper. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>

        <p><a href="${createLink(controller:'evento', action:'nuevo')}" class="btn primary large">Crea tu Evento! &raquo;</a></p>
        </div>
      

      <!-- Columnas -->
      <div class="row">
	<!-- Columna 1 -->
        <div class="span-one-third">
          <h2>Eventos destacados</h2>
          <p>Etiam porta sem malesuada magna mollis euismod. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
          <p><a class="btn" href="#">View details &raquo;</a></p>
        </div>
	<!-- Columna 2 -->
        <div class="span-one-third">
          <h2>Facebook</h2>
           <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn" href="#">View details &raquo;</a></p>
       </div>
	<!-- Columna 3 -->
        <div class="span-one-third">
          <h2>Eventos por venir</h2>
          <p>
            <table class="bordered-table zebra-striped">
                  <tbody>
                  <g:each in="${eventos}" status="i" var="evento">
                          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                  <td><g:link controller="evento" action="ver" id="${evento.id}">${fieldValue(bean: evento, field: "nombre")}</g:link></td>
                                  <td><g:formatDate date="${evento?.fechaInicio}"/></td>

                          </tr>
                  </g:each>
                  </tbody>
          </table>
          </p>
          
        </div>
      </div>


    </div> <!-- /container -->

  </body>
</html>
