<%@ page import="general.Usuario" %>
<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="usuario.passNewTitulo" /></title>
</head>

<body>
  
<div id="login" class="well" style="margin-left: 400px; margin-right: 400px;">
                  
                  <div class="modal-header">
                      <h3><g:message code="usuario.passUpdateTitulo" /></h3>
                  </div>
                
                    
                  <form class="form-horizontal" action="updatePassword" autocomplete='off' >
                    <br>
                      <small><g:message code="usuario.passUpdateInstr" /></small>
                      
                      
                          <fieldset>
                            
                         <g:if test='${flash.message}'>
                            <div class="alert alert-error fade in">
                              <a class="close" data-dismiss="alert" href="#">&times;</a>
                              <center>
                              <p>${flash.message}</p>
                              </center>
                            </div>
                          </g:if>
                    <br>        
                  <div class="control-group">
                          <label class="control-label" for="input01"><g:message code="usuario.passActual" /> *</label>
                          <div class="controls">
                            <div class="input-prepend">
                              <span class="add-on"><i class="icon-envelope"></i></span>
                              <input name="passwordActual" size="30" type="password" required="" autofocus />
                            </div>
                          </div>
                          <br>
                          <label class="control-label" for="input01"><g:message code="usuario.passNew" /> *</label>
                          <div class="controls">
                            <div class="input-prepend">
                              <span class="add-on"><i class="icon-lock"></i></span>
                              <input name="password" size="30" type="password" required="" />
                            </div>
                          </div>
                          <br>
                          <label class="control-label" for="input01"><g:message code="usuario.passNew2" /> *</label>
                          <div class="controls">
                            <div class="input-prepend">
                              <span class="add-on"><i class="icon-lock"></i></span>
                              <input name="password2" size="30" type="password" required="" />
                            </div>
                          </div>
                          <br>
                            
                          </fieldset>

                        <div class="modal-footer">
                          <button class="btn btn-primary" type="submit"><g:message code="usuario.passNewActualizar" /></button>
                          <a class="btn" href="${createLink(controller:'usuario', action:'ver')}">  <g:message code="usuario.canelar" /></a>
                        </div>
                       
                  </div>
                     </form>
                

              </div>
</body>
</html>
