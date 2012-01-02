<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="login.iniciaSesion" /></title>
</head>

<body>
  
<div id="login" class="well" style="margin-left: 400px; margin-right: 400px;">
                  
                  <div class="modal-header">
                      <h2><g:message code="usuario.nuevaTituloCuenta" /> <small><g:message code="login.iniciaSesion" /></small></h2>
                  </div>
                
                  <div class="modal-body">
                     <form action="/adventicket/j_spring_security_check" method='POST' autocomplete='off' >
                          <g:if test='${flash.message}'>
                            <div class="alert-message block-message error fade in" data-alert="alert">
                              <a class="close" href="#">&times;</a>
                              <center>
                              <p>${flash.message}</p>
                              </center>
                            </div>
                          </g:if>
                          <fieldset>
                            <div class="clearfix">
                              <label for="xlInput"><g:message code="login.username" /></label>
                              <div class="input">
                                <input class="input-large" type="text" placeholder="usuario" name='j_username' id='username' autofocus >
                              </div>
                            </div><!-- /clearfix -->
                            <div class="clearfix">
                              <label for="xlInput"><g:message code="login.password" /></label>
                              <div class="input">
                                <input class="input-large" type="password" placeholder="contrasena" name='j_password' id='password'>
                              </div>
                            </div><!-- /clearfix -->
                          </fieldset>

                        <div class="modal-footer">
                          <button class="btn large primary" type="submit"><g:message code="login.entrar" /></button>
                          
                        </div>
                     </form>
                  </div>
                

              </div>
</body>
</html>
