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
          <div class="container">
            <section>
                       <div class="content">
                         
                             <div class="well">
                               
                               <g:if test="${flash.message}">
                                <div class="message" ></div>
                                <div class="alert-message success fade in" data-alert="alert" role="status">
                                  <a class="close" href="#">&times;</a>
                                  <p><strong>Muy bien! </strong><br/>${flash.message}</p>
                                </div>
                               </g:if>
                               
                               
                               <fieldset>
                                    <h4>Administración</h4>
                                    <br>
                                      <ul id="tab" class="nav nav-tabs">
                                        <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
                                        <li><a href="#asistire" data-toggle="tab">Asistire</a></li>
                                        <li><a href="#talvez" data-toggle="tab">Tal vez Asista</a></li>
                                        <li><a href="#asistidos" data-toggle="tab">Asistidos</a></li>
                                        
                                      </ul>
                                      <div id="myTabContent" class="tab-content">
                                        <div class="tab-pane fade in active" id="home">
                                          <p>Bienvenido</p>
                                          <p>Aquí podras administrar todo el sitio de AdvenTicket</p>
                                          <center><p>
                                            
                                          </p></center>
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
            </section>
             </div>
  </body>
</html>
