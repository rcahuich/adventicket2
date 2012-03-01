<!-- Menu -->

    <div id="navBarr" class="navbar navbar-fixed-top" >
      <div  class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brandImg" href="${createLink(uri: '/#home')}" ><img src="${resource(dir: 'images', file: 'logoPNG.png')}" alt="" title="" width="140" height="37" border="0" style="float: left"/> </a>
          
          <div class="nav-collapse">
            
            <ul class="nav">
              <li ><a href="${createLink(uri: '/#home')}"> <i class="icon-home icon-white"></i></a></li>
              <li ><a href="${createLink(uri: '/#nosotros')}" ><g:message code="menu.nosotros" /></a></li> 
              <li><a href="${createLink(uri: '/#contactanos')}"><g:message code="menu.contactanos" /></a></li>
              <li><a href="${createLink(uri: '/')}"><i class="icon-refresh icon-white"></i></a></li>
            </ul>

            <g:form class="navbar-search pull-left" name="busqueda" url="[controller:'evento', action:'eventos']">
              <input type="text" name="nombreEvento" value="${params.nombreEvento}" class="search-query span3" placeholder="Busca tu evento">
            </g:form>
            
          
            <ul class="nav pull-right">
              <sec:ifNotLoggedIn>

               <li class="divider-vertical"></li>
               <li><a href="${createLink(controller:'usuario', action:'nuevo')}"><g:message code="menu.registrate" /></a></li>
<!--               <li><a href="${createLink(controller:'login', action:'auth')}"><g:message code="login.iniciaSesion" /></a></li>-->
               <a data-toggle="modal" href="/#modalLogin" class="btn"><g:message code="login.iniciaSesion" /></a>

              </sec:ifNotLoggedIn>

              <sec:ifLoggedIn>

                    <li class="divider-vertical"></li>
                    <li id="fat-menu" class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><g:message code="menu.bienvenido" /> <sec:username /> <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li><a href="${createLink(controller:'usuario', action:'ver')}"><i class="icon-user"></i> <g:message code="menu.miCuenta" /></a></li>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <li><a href="${createLink(controller:'admin', action:'admin')}"><i class="icon-cog"></i> <g:message code="admin.inicio" /></a></li>
                        </sec:ifAllGranted>
                        <li class="divider"></li>
                        <li><a href="${createLink(controller:'logout')}"><i class="icon-off"></i> <g:message code="menu.cerrarSesion" /></a></li>
                      </ul>
                    </li>

              </sec:ifLoggedIn>
            </ul>
          </div>
        </div>
      </div><!-- /topbar-inner -->
    </div><!-- /topbar -->
  
