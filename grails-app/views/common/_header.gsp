<!-- Menu -->

    <div class="topbar" data-dropdown="dropdown" >
      <div class="topbar-inner">
        
        <div class="container">
          
          <a href="${createLink(uri: '/')}"><img src="${resource(dir: 'images', file: 'logoPNG.png')}" alt="" title="" width="140" height="37" border="0" style="float: left"/></a>
          
          <ul class="nav">
            <li class="active"><a style="font-weight: bold"><g:message code="inicio.home" /></a></li>
            <li><a href="#" style="font-weight: bold"><g:message code="menu.nosotros" /></a></li>
            <li><a href="#"style="font-weight: bold"><g:message code="menu.contactanos" /></a></li>
          </ul>
          
          <form class="pull-left" action="">
            <input type="text" placeholder="Buscar eventos" />
          </form>
          
          <ul class="nav secondary-nav">
            <sec:ifNotLoggedIn>
              
              <div id="login" class="modal hide fade">
                  <div class="modal-header">
                    <a href="#" class="close">&times;</a>
                      <h2><g:message code="usuario.nuevaTituloCuenta" /> <small><g:message code="login.iniciaSesion" /></small></h2>
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
                          <div style="float: left; margin-top: 3px;">
                            <div style="margin-bottom: 6px;">
                            <g:message code="login.registrate" /><a href="${createLink(controller:'usuario', action:'nuevo')}">  <g:message code="menu.registrate" /></a>
                            </div>
                            <a href="${createLink(controller:'usuario', action:'olvidePassword')}">  <g:message code="login.recuperarPass" /></a>
                          </div>
                          
                          <button class="btn large primary" type="submit"><g:message code="login.entrar" /></button>
                        </div>
                     </form>
                  </div>
                

              </div>
              
             <li><a href="${createLink(controller:'usuario', action:'nuevo')}"><g:message code="menu.registrate" /></a></li>
              
             <li>
              <a data-controls-modal="login" data-backdrop="true" data-keyboard="true" class="btn primary large"><g:message code="login.iniciaSesion" /></a>
            </li>

            </sec:ifNotLoggedIn>
            
            <sec:ifLoggedIn>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle"><g:message code="menu.bienvenido" /> <sec:username /></a>
              <ul class="dropdown-menu">
                <li><a href="${createLink(controller:'usuario', action:'ver')}"><g:message code="menu.miCuenta" /></a></li>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <li><a href="${createLink(controller:'admin', action:'admin')}"><g:message code="admin.inicio" /></a></li>
                </sec:ifAllGranted>
                <li class="divider"></li>
                <li><a href="${createLink(controller:'logout')}"><g:message code="menu.cerrarSesion" /></a></li>
              </ul>
            </li>
            </sec:ifLoggedIn>
          </ul>
          
        </div>
      </div><!-- /topbar-inner -->
    </div><!-- /topbar -->
  
