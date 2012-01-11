<%@ page import="general.Usuario" %>
<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="usuario.passNewTitulo" /></title>
</head>

<body>
  
<div id="login" class="well" style="margin-left: 400px; margin-right: 400px;">
                  
                  <div class="modal-header">
                      <h3><g:message code="usuario.passNewTitulo" /></h3>
                  </div>
                
                  <div class="modal-body">
                    
                     <form action="nuevoPassword" autocomplete='off' >
                     <g:hiddenField name='t' value='${token}'/>
                     
                      <small><g:message code="usuario.passNewIns" /></small>
                      
                      
                          <fieldset>
                            
                         <g:if test='${flash.message}'>
                            <div class="alert-message block-message error fade in" data-alert="alert">
                              <a class="close" href="#">&times;</a>
                              <center>
                              <p>${flash.message}</p>
                              </center>
                            </div>
                          </g:if>
                            <div class="clearfix">
                              <label for="xlInput"><g:message code="usuario.passNew" /></label>
                              <div class="input">
                                <input name="password" size="30" type="password" required="" autofocus />
                              </div>
                            </div><!-- /clearfix -->
                            <div class="clearfix">
                              <label for="xlInput"><g:message code="usuario.passNew2" /></label>
                              <div class="input">
                                <input name="password2" size="30" type="password" required="" />
                              </div>
                            </div><!-- /clearfix -->
                            
                          </fieldset>

                        <div class="modal-footer">
                          <button class="btn large primary" type="submit"><g:message code="usuario.passNewActualizar" /></button>
                        </div>
                       
                     </form>
                  </div>
                

              </div>
</body>
</html>
