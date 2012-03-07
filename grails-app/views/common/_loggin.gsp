<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>

  </head>
  <body>
    <div id="modalLogin" class="modal hide fade">
                    <form action="/adventicket/j_spring_security_check" method='POST' autocomplete='off' >
                    <div class="modal-header">
                      <a class="close" data-dismiss="modal">&times;</a>
                    </div>
                      <center>
                        <h1>AdvenTicket</h1>
                            <p><g:message code="login.iniciaSesion" /></p>
                        <hr class="soften">
                       <g:if test='${flash.message}'>
                            <div class="alert-message block-message error fade in" data-alert="alert">
                              <a class="close" href="#">&times;</a>
                              <p>${flash.message}</p>
                            </div>
                       </g:if>
      
                      
                        <div class="controls">
                         <input id="username" type="text" class="input-large" name="j_username" required="" placeholder="usuario" autoFocus>
                        </div>
                        <br /> 
                        
                        <div class="controls">
                          <input id='password' type="password" class="input-large" name="j_password" required="" placeholder="contraseña" >
                        </div>
                      <br />


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
