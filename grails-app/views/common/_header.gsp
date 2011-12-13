<!-- Menu -->
 
    <div class="topbar" data-dropdown="dropdown" >
      <div class="topbar-inner">
        <div class="container">
          
          <h3><a href="${createLink(uri: '/ ')}">ADVENTicket</a></h3>
          
          <ul class="nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#">Nosotros</a></li>
            <li><a href="#">Contactanos</a></li>
            
          </ul>
          
          <form class="pull-left" action="">
            <input type="text" placeholder="Encuentra los eventos" />
          </form>
          
          <ul class="nav secondary-nav">
            
            <sec:ifNotLoggedIn>
            <form action="/adventicket/j_spring_security_check" method='POST' autocomplete='off'>
                  <input class="input-small" type="text" placeholder="usuario" name='j_username' id='username' >
                  <input class="input-small" type="password" placeholder="contrasena" name='j_password' id='password'>
                  <button class="btn" type="submit">Entrar</button>
            </form>
            </sec:ifNotLoggedIn>
            
            <sec:ifLoggedIn>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle"><sec:username /></a>
              <ul class="dropdown-menu">
                <li><a href="#">Mi Cuenta</a></li>
                <li><a href="#">Eventos</a></li>
                <li class="divider"></li>
                <li><a href="${createLink(controller:'logout')}">Cerrar sesion</a></li>
              </ul>
            </li>
            </sec:ifLoggedIn>
          </ul>
          
        </div>
      </div><!-- /topbar-inner -->
    </div><!-- /topbar -->
