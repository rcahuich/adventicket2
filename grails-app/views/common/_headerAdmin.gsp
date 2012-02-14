<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

 
          <!-- Sub Navegador de Administracion-->
          <div class="container">
            <div class="subnav">
              <ul class="nav nav-pills">
                <li><a href="${createLink(controller:'admin', action:'admin')}"><i class="icon-cog"></i> <g:message code="admin.inicio" /></a></li>
                <li class="dropdown">
                  <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i> <g:message code="usuario.lista" /> <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="${createLink(controller:'usuario', action:'lista')}"><i class="icon-th-list"></i> <g:message code="usuario.lista" /></a></li>
                    <li><a href="${createLink(controller:'usuario', action:'nuevo')}"><i class="icon-plus-sign"></i> <g:message code="usuario.nuevo" /></a></li>
                  </ul>
                </li>
                <li class="dropdown">
                  <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-calendar"></i> <g:message code="evento.lista" /> <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="${createLink(controller:'evento', action:'lista')}"><i class="icon-th-list"></i> <g:message code="evento.lista" /></a></li>
                    <li><a href="${createLink(controller:'evento', action:'nuevo')}"><i class="icon-plus-sign"></i> <g:message code="evento.nuevo" /></a></li>
                  </ul>
                </li>
                <li class="dropdown">
                  <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-list-alt"></i> <g:message code="tipoEvento.lista" /> <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="${createLink(controller:'tipoEvento', action:'lista')}"><i class="icon-th-list"></i> <g:message code="tipoEvento.lista" /></a></li>
                    <li><a href="${createLink(controller:'tipoEvento', action:'nuevo')}"><i class="icon-plus-sign"></i> <g:message code="tipoEvento.nuevo" /></a></li>
                  </ul>
                </li>
                <li class="dropdown">
                  <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-list-alt"></i> <g:message code="tipoSubEvento.lista" /> <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="${createLink(controller:'tipoSubEvento', action:'lista')}"><i class="icon-th-list"></i> <g:message code="tipoSubEvento.lista" /></a></li>
                    <li><a href="${createLink(controller:'tipoSubEvento', action:'nuevo')}"><i class="icon-plus-sign"></i> <g:message code="tipoSubEvento.nuevo" /></a></li>
                  </ul>
                </li>
                <li><a href="${createLink(controller:'index', action:'index2')}"><i class="icon-info-sign"></i> Acerca de</a></li>
              </ul>
            </div>
          </div>
          <br>