<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main">
    <title><g:message code="admin.inicio" /></title>
  </head>
  <body>
    

          
          <div class="container-fluid">
		
                       <div class="span16">
                            <ul class="breadcrumb">
                              <li><a href="${createLink(uri: '/')}"><g:message code="inicio.home" /></a> <span class="divider">/</span></li>
                              <li class="active"><g:message code="admin.inicio" /></li>
                            </ul>
                       </div>
		
                       <div class="sidebar">
                         <div class="well">
                            <h4>Panel de Control</h4>
                            <ul>
                              <li><a href="${createLink(controller:'usuario')}"><g:message code="usuario.lista" /></a></li>
                              <li><a href="${createLink(controller:'evento')}"><g:message code="evento.lista" /></a></li>
                              <li><a href="${createLink(controller:'tipoEvento')}"><g:message code="tipoEvento.lista" /></a></li>
                              <li><a href="${createLink(controller:'tipoSubEvento')}"><g:message code="tipoSubEvento.lista" /></a></li>
                            </ul>
                         </div>
                       </div>
                          
                       <div class="content">
                         
                             <div class="hero-unitPortal">
                               
                               <g:if test="${flash.message}">
                                <div class="message" ></div>
                                <div class="alert-message success fade in" data-alert="alert" role="status">
                                  <a class="close" href="#">&times;</a>
                                  <p><strong>Muy bien! </strong><br/>${flash.message}</p>
                                </div>
                               </g:if>
                               
                               
                               <fieldset>
                                    <h4>Administración</h4>
                                      <ul class="tabs" data-tabs="tabs">
                                        <li class="active"><a href="#home">Home</a></li>
                                        <li><a href="#asistire">Asistire</a></li>
                                        <li><a href="#talvez">Tal vez Asista</a></li>
                                        <li><a href="#asistidos">Asistidos</a></li>
                                        
                                      </ul>
                                      <div id="my-tab-content" class="tab-content">
                                        <div class="active tab-pane" id="home">
                                          <p>Bienvenido</p>
                                          <p>Aquí podras administrar todo el sitio de AdvenTicket</p>
                                          <center><p>
                                            
                                          </p></center>
                                        </div>
                                        <div class="tab-pane" id="asistire">
                                          <p>Eventos a los cuales asistiras</p>
                                        </div>
                                        <div class="tab-pane" id="talvez">
                                          <p>Eventos a los que tal vez asistas</p>
                                        </div>
                                        <div class="tab-pane" id="asistidos">
                                          <p>Eventos a los que has asistido</p>
                                        </div>
                                      </div>
                                    
                               </fieldset>
                             
                          </div>
                  </div>
            
             </div>
  </body>
</html>
