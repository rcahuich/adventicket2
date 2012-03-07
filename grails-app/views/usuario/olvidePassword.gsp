<%@ page import="general.Usuario" %>
<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="usuario.olvidoPassword" /></title>
</head>

<body>
  
<div id="login" class="well" style="margin-left: 400px; margin-right: 400px;">
  <section>                
                  <div class="modal-header">
                      <h3><g:message code="usuario.olvidoPassword" /></h3>
                  </div>
                
                  <div class="modal-body">
                    
                     <form class="form-horizontal" action="recuperaPassword" autocomplete='off' >
         
                      <small><g:message code="usuario.olvidoPassInst" /></small>
                      
                      <br>
                      <br>
                      
                           <g:if test='${flash.message}'>
                            <div class="alert alert-error fade in">
                              <a class="close" data-dismiss="alert" href="#">&times;</a>
                              <center>
                              <p>${flash.message}</p>
                              </center>
                            </div>
                          </g:if>
                      
                              
                            
                            <div class="control-group">
                              <label class="control-label" for="input01"><g:message code="usuario.olvidePassCorreo" /></label>
                              <div class="controls">
                                <input class="input-large" type="email" required="" name='correo' id='correo' autofocus >
                              </div>
                            </div><!-- /clearfix -->
                            

                        <div class="modal-footer">
                          <button class="btn btn-primary" type="submit"><g:message code="usuario.olvidePassEnviar" /></button>
                        </div>
                     </form>
                  </div>
                
</section>
              </div>
</body>
</html>
