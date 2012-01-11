<%@ page import="general.Usuario" %>
<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="usuario.olvidoPassword" /></title>
</head>

<body>
  
<div id="login" class="well" style="margin-left: 400px; margin-right: 400px;">
                  
                  <div class="modal-header">
                      <h3><g:message code="usuario.olvidoPassword" /></h3>
                  </div>
                
                  <div class="modal-body">
                    
                     <form action="olvidePassword" autocomplete='off' >
                       
                          
                       
                       <g:if test='${emailSent}'>
                        <br/>
                        <h4>
                          <center>
                        <g:message code='usuario.correoEnviado'/>
                          </center>
                        </h4>
                       </g:if>
                       
                       <g:else>
                         
                      <small><g:message code="usuario.olvidoPassInst" /></small>
                      
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
                              <label for="xlInput"><g:message code="usuario.olvidePassCorreo" /></label>
                              <div class="input">
                                <input class="input-large" type="email" required="" name='correo' id='correo' autofocus >
                              </div>
                            </div><!-- /clearfix -->
                            
                          </fieldset>

                        <div class="modal-footer">
                          <button class="btn large primary" type="submit"><g:message code="usuario.olvidePassEnviar" /></button>
                        </div>
                       </g:else>
                     </form>
                  </div>
                

              </div>
</body>
</html>
