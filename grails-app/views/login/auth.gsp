<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="login.iniciaSesion" /></title>
</head>

<body>
  
<div id="login" class="hero-unit">
                  
                  <div class="modal-header">
                      <h2><g:message code="usuario.nuevaTituloCuenta" /> <small><g:message code="login.iniciaSesion" /></small></h2>
                  </div>
                
                  <form class="form-horizontal" action="/adventicket/j_spring_security_check" method='POST' autocomplete='off' >
                  <div class="control-group">
                          <br>
                          <g:if test='${flash.message}'>
                            <div class="alert alert-block alert-error fade in">
                              <a class="close" data-dismiss="alert" href="#">&times;</a>
                              <center>
                              <p>${flash.message}</p>
                              </center>
                            </div>
                          </g:if>
                            <br></br>
                              <label class="control-label" for="input01"><g:message code="login.username" /></label>
                              <div class="controls">
                                <div class="input-prepend">
                                  <span class="add-on"><i class="icon-user"></i></span>
                                <input id="username" type="text" class="input-large" name="j_username" required="" placeholder="usuario" autoFocus>
                                </div>
                              </div>
                           <br> 
                              <label class="control-label" for="input01"><g:message code="login.password" /></label>
                              <div class="controls">
                                <input id='password' type="password" class="input-largeLoginPass" name="j_password" required="" placeholder="contraseña" >
                              </div>
                              <br></br>
                            <div class="modal-footer">
                              <div style="float: left; margin-top: 3px;">
                                <div style="margin-bottom: 6px;">
                                <g:message code="login.registrate" /><a href="${createLink(controller:'usuario', action:'nuevo')}">  <g:message code="menu.registrate" /></a>
                                </div>
                                <a href="${createLink(controller:'usuario', action:'olvidePassword')}">  <g:message code="login.recuperarPass" /></a>
                              </div>
                              <button class="btn btn-primary" type="submit"><g:message code="login.entrar" /></button>
                            </div>
                       
                  </div>
                     </form>
                

              </div>
</body>
</html>
