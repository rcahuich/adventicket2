<%@ page import="general.Usuario" %>

<sec:ifAllGranted roles="ROLE_ADMIN">
<legend>1. <g:message code="usuario.usernameTitulo" /></legend>

            <label class="control-label" for="input01"><g:message code="usuario.username" /></label>
            <div class="controls">
              <div class="input-prepend">
                <span class="add-on"><i class="icon-user"></i></span>
              <input id="iconInput" type="text" class="input-xlarge" name="username" required="" placeholder="escribe tu usuario" value="${usuario?.username}" autoFocus>
              </div>
            </div>

<br>
<legend>2. <g:message code="usuario.passwordTitulo" /></legend>

            <label class="control-label" for="input01"><g:message code="usuario.password" /></label>
            <div class="controls">
              <input type="password" class="input-xlarge" name="password" required="" placeholder="escribe tu contraseña" value="${usuario?.password}" >
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="usuario.password" /></label>
            <div class="controls">
              <input type="password" class="input-xlarge" name="passwordDos" required="" placeholder="escriba de nuevo su contraseña" >
            </div>
</sec:ifAllGranted>
<br>
<legend>1. <g:message code="usuario.informacionPersonal" /></legend>
            <label class="control-label" for="input01"><g:message code="usuario.nombre" /></label>
            <div class="controls">
              <input type="text" class="input-xlarge" name="nombre" required="" placeholder="nombre(s)" value="${usuario?.nombre}" >
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="usuario.apellidoPaterno" /></label>
            <div class="controls">
              <input type="text" class="input-xlarge" name="apellidoPaterno" required="" placeholder="escribe tu apellido paterno" value="${usuario?.apellidoPaterno}" >
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="usuario.apellidoMaterno" /></label>
            <div class="controls">
              <input type="text" class="input-xlarge" name="apellidoMaterno" placeholder="escribe tu apellido materno" value="${usuario?.apellidoMaterno}" >
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="usuario.sexo" /></label>
            <div class="controls">
              <g:select name="sexo" from="${usuario.constraints.sexo.inList}" value="${usuario?.sexo}" valueMessagePrefix="usuario.sexo"  />
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="usuario.fechaDeNacimiento" /></label>
            <div class="controls">
              <g:datePicker class="medium" id="medium" name="fechaDeNacimiento" precision="day"  value="${usuario?.fechaDeNacimiento}"  years="${2007..1940}"/>
            </div>
            <br>
            <label class="control-label" for="input01"><g:message code="usuario.correo" /></label>
            <div class="controls">
              <div class="input-prepend">
                <span class="add-on"><i class="icon-envelope"></i></span>
                <input id="iconInput" type="email" class="input-xlarge" name="correo" required="" placeholder="micorreo@ejemplo.com" value="${usuario?.correo}" />
                <p > </p>
                <span class="help-block">
                     <strong><g:message code="usuario.correoImportante" /></strong> <g:message code="usuario.correoNota" />
                </span>
              </div>
            </div>

<legend>2. <g:message code="usuario.imagenTitulo" /></legend>
            <label class="control-label" for="input01"><g:message code="usuario.imagen"/></label>
            <div class="controls">
              <input class="input-file" type="file" name="imagen" />
              <p > </p>
              <span class="help-block">
                   <strong><g:message code="usuario.fotoImportante" /></strong> <g:message code="usuario.fotoInstrucciones" />
              </span>
            </div>
            
<sec:ifAllGranted roles="ROLE_ADMIN">

<legend>5. <g:message code="usuario.informacionSeguridad" /></legend>
<br>
            <label class="control-label" for="input01"><g:message code="usuario.accountExpired" /></label>
            <div class="controls">
              <g:checkBox name="accountLocked" value="${usuario?.accountExpired}" />
            </div>
<br>
            <label class="control-label" for="input01"><g:message code="usuario.accountLocked" /></label>
            <div class="controls">
              <g:checkBox name="accountLocked" value="${usuario?.accountLocked}" />
            </div>
<br>
            <label class="control-label" for="input01"><g:message code="usuario.enabled" /></label>
            <div class="controls">
              <g:checkBox name="enabled" value="${usuario?.enabled}" />
            </div>
<br>
            <label class="control-label" for="input01"><g:message code="usuario.passwordExpired" /></label>
            <div class="controls">
              <g:checkBox name="passwordExpired" value="${usuario?.passwordExpired}" />
            </div>
        
<br>
  
<g:if test="${roles}">
        <g:set var="contador" value="${1}" />
        <g:each var="entry" in="${roles}">
            <label class="control-label" for="${entry.key.authority}">
                <g:if test="${contador++ == 1}">
                  <g:message code="usuario.authorities" />
                </g:if>
            </label>
          <div class="controls">
            <g:checkBox name="${entry.key.authority}" value="${entry.value}"/> ${entry.key.authority}<br/>
          </div>
        </g:each>
</g:if>

</sec:ifAllGranted>

