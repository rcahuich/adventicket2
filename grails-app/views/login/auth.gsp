<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="login.iniciaSesion" /></title>
</head>

<body>
  <div class="container">
    
    <div class="marketing well">
      
      <form action="/adventicket/j_spring_security_check" method='POST' autocomplete='off' >
        <center>
          <h1>AdvenTicket</h1>
          <p><g:message code="login.iniciaSesion" /></p>
      <hr class="soften">
        
        <g:if test='${flash.message}'>
          <div class="alert alert-block alert-error fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a>
            <center>
            <p>${flash.message}</p>
            </center>
          </div>
        </g:if>
            <br />
          <div >
              <label class="control-label" for="input01"><g:message code="login.username" /></label>
              <div class="controls">
               <input id="username" type="text" class="input-large" name="j_username" required="" placeholder="usuario" autoFocus>
              </div>
              <br /> 
              <label class="control-label" for="input01"><g:message code="login.password" /></label>
              <div class="controls">
                <input id='password' type="password" class="input-large" name="j_password" required="" placeholder="contraseña" >
              </div>
            <br />
          </div>

          <button class="btn btn-primary" type="submit"><g:message code="login.entrar" /></button>
          <hr class="soften">
          <p class="marketing-byline"> <a href="">  </a></p>
          <p class="download-info">
            <a href="${createLink(controller:'usuario', action:'nuevo')}" class="btn btn-success"><g:message code="menu.registrate" /></a>
            <a href="${createLink(controller:'usuario', action:'olvidePassword')}" class="btn"><g:message code="login.recuperarPass" /></a>
          </p>
        </center>
      </form>
    </div>

  </body>
</html>
