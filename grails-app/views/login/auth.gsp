<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>

<body>
  
<div id="login" class="well" style="margin-left: 400px; margin-right: 400px;">
                  
                  <div class="modal-header">
                      <h2><g:message code="usuario.nuevaTituloCuenta" /> <small><g:message code="usuario.iniciaSesion" /></small></h2>
                  </div>
                
                  <div class="modal-body">
                     <form action="/adventicket/j_spring_security_check" method='POST' autocomplete='off' >
                          <g:if test='${flash.message}'>
                            <div class="alert-message block-message error fade in" data-alert="alert">
                              <a class="close" href="#">&times;</a>
                              <p>${flash.message}</p>
                            </div>
                          </g:if>
                          <fieldset>
                            <div class="clearfix">
                              <label for="xlInput">usuario</label>
                              <div class="input">
                                <input class="input-large" type="text" placeholder="usuario" name='j_username' id='username' autofocus >
                              </div>
                            </div><!-- /clearfix -->
                            <div class="clearfix">
                              <label for="xlInput">contrasena</label>
                              <div class="input">
                                <input class="input-large" type="password" placeholder="contrasena" name='j_password' id='password'>
                              </div>
                            </div><!-- /clearfix -->
                          </fieldset>

                        <div class="modal-footer">
                          <button class="btn large primary" type="submit">Entrar</button>
                          
                        </div>
                     </form>
                  </div>
                

              </div>
</body>
</html>
