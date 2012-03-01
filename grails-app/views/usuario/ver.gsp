
<%@ page import="general.Usuario" %>
<!doctype html>
<html>
	<head>
    <meta name="layout" content="main">
    <title><g:fieldValue bean="${usuario}" field="nombreCompleto"/></title>
  </head>

  <body>
    
    <div class="container">
      <section>
        <ul class="breadcrumb">
          <li><a href="${createLink(uri: '/')}"><g:message code="inicio.home" /></a> <span class="divider">/</span></li>
          <li class="active"><g:message code="usuario.miPerfil" /></li>
        </ul>

      <div class="well">
      <div class="marketing">
        <div class="row">
          <div class="span3">
            <br>
            <br>
              <img style="width: 180px; height: 210px;" src="${createLink(action:'imagen', id:usuario?.id)}" />
              <g:hiddenField name="id" value="${usuario?.id}" />

              <div class="btn-group">
                <a class="btn btn-primary" href="#">
                      <i class="icon white user"></i>
                      <h5 style="color: #ffffff;"><g:fieldValue bean="${usuario}" field="username"/></h5>
                </a>
                <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="${createLink(action:'edita', id:usuario?.id)}"><i class="icon-pencil"></i> <g:message code="usuario.modificaPerfil" /></a></li>
                  <li><a href="${createLink(controller:'usuario', action:'updatePass')}"><i class="icon-lock"></i> Cambiar mi contraseña</a></li>
                  <li class="divider"></li>
                  <li><a href="${createLink(controller:'logout')}"><i class="icon-off"></i> <g:message code="menu.cerrarSesion" /></a></li>
                </ul>
              </div>
            
          </div>
          
          <div class="span9">
                      <g:if test="${flash.message}">
                        <div class="alert alert-info fade in">
                          <a class="close" data-dismiss="alert" href="#">&times;</a>
                          <p><strong></strong><br/>${flash.message}</p>
                        </div>
                      </g:if>


                      <fieldset>
                            
                            <br>

                            <sec:ifAllGranted roles="ROLE_ADMIN">
                            <g:if test="${usuario?.username}">
                              <g:message code="usuario.username" />: <g:fieldValue bean="${usuario}" field="username"/>
                            </g:if>
                            <br>
                            <br>
                            <g:if test="${usuario?.correo}">
                              <g:message code="usuario.correo" />: <g:fieldValue bean="${usuario}" field="correo"/>
                            </g:if>
                            <br>
                            <br>
                            <g:if test="${usuario?.accountExpired}">
                              <g:message code="usuario.accountExpired" />: <g:checkBox name="accountExpired" value="${usuario?.accountExpired}" disabled="true" />
                            </g:if>

                            <g:if test="${usuario?.accountLocked}">
                              <g:message code="usuario.accountLocked" />: <g:checkBox name="accountExpired" value="${usuario?.accountLocked}" disabled="true" />
                            </g:if>

                            <g:if test="${usuario?.enabled}">
                              <g:message code="usuario.enabled" />: <g:checkBox name="accountExpired" value="${usuario?.enabled}" disabled="true" />
                            </g:if>

                            <g:if test="${usuario?.passwordExpired}">
                              <g:message code="usuario.passwordExpired" />: <g:checkBox name="accountExpired" value="${usuario?.passwordExpired}" disabled="true" />
                            </g:if>

                            <g:if test="${usuario?.accountExpired}">
                              <g:message code="usuario.accountExpired" />: <g:checkBox name="accountExpired" value="${usuario?.accountExpired}" disabled="true" />
                            </g:if>
                            <br>

                            <g:if test="${roles}">
                              <g:message code="usuario.authorities" />: 
                              <g:each var="entry" in="${roles}">
                                <g:checkBox disabled="true" name="${entry.key.authority}" value="${entry.value}"/> ${entry.key.authority}<br/>
                              </g:each>
                            </g:if>
                            </sec:ifAllGranted>
                            <h3>Bienvenido</h3>
                            <br>

                            <ul id="tab" class="nav nav-tabs">
                              <li class="active"><a href="#home" data-toggle="tab">Mis Eventos</a></li>
                              <li><a href="#asistire" data-toggle="tab">Asistire</a></li>
                              <li><a href="#talvez" data-toggle="tab">Tal vez Asista</a></li>
                              <li><a href="#asistidos" data-toggle="tab">Asistidos</a></li>
                            </ul>
                            
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane fade in active" id="home">

                                  <g:if test="${eventos}">
                                    <p>Estos son lo eventos que has creado.</p>
                                    <center><p>
                                      <table class="table table-bordered">
                                        <thead>
                                         <tr>

                                            <g:sortableColumn property="nombre" title="${message(code: 'evento.nombre')}" />
                                            <g:sortableColumn property="fechaInicio" title="${message(code: 'evento.fechaInicio')}" />
                                            <g:sortableColumn property="status" title="${message(code: 'evento.status')}" />
                                            <g:if test="${statusSolicitud == 'ACEPTADO'}">
                                              <g:sortableColumn property="statusSolicitud" title="${message(code: 'evento.modifica')}" />
                                            </g:if>

                                        </tr>
                                        </thead>
                                        <tbody>
                                            <g:each in="${eventos}" status="i" var="evento">
                                              <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                              <td><g:link controller="evento" action="ver" id="${evento.id}">${fieldValue(bean: evento, field: "nombre")}</g:link></td>
                                              <td><g:formatDate date="${evento?.fechaInicio}"/></td>
                                              <td>${fieldValue(bean: evento, field: "statusSolicitud")}</td>
                                              <g:if test="${statusSolicitud == 'ACEPTADO'}">
                                                <td><g:link controller="evento" action="edita" id="${evento.id}">Editar</g:link></td>
                                              </g:if>
                                              </tr>
                                            </g:each>
                                        </tbody>
                                      </table>
                                      <div class="pagination">
                                        <g:paginate total="${eventosTotal}" />
                                      </div>
                                      </p></center>
                                  </g:if>

                                  <g:else>
                                    <p>Aun no tienes ningun evento creado.</p>
                                  </g:else>

                                </div>

                                <div class="tab-pane fade" id="asistire">
                                  <p>Eventos a los cuales asistiras</p>
                                </div>

                                <div class="tab-pane fade" id="talvez">
                                  <p>Eventos a los que tal vez asistas</p>
                                </div>

                                <div class="tab-pane fade" id="asistidos">
                                  <p>Eventos a los que has asistido</p>
                                </div>

                              </div>

                      </fieldset>
            
          </div>
        </div>
      </div>
      </div>
        </section>
     </div>
</body>
</html>
