<%@ page import="general.Usuario" %>

<div class="clearfix ${hasErrors(bean: usuario, field: 'username', 'error')} required">
                  <label for="xlInput">
                    <g:message code="usuario.username" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="username" size="30" type="text" required="" placeholder="escribe tu usuario" value="${usuario?.username}" autoFocus/>
                  </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: usuario, field: 'password', 'error')} required">
                  <label for="xlInput">
                    <g:message code="usuario.password" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="password" size="30" type="password" required="" placeholder="escribe tu contrasena" value="${usuario?.password}"/>
                  </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: usuario, field: 'nombre', 'error')} required">
                  <label for="xlInput">
                    <g:message code="usuario.nombre" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="nombre" size="30" type="text" required="" placeholder="nombre(s)" value="${usuario?.nombre}"/>
                  </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: usuario, field: 'apellidoPaterno', 'error')} required">
                  <label for="xlInput">
                    <g:message code="usuario.apellidoPaterno" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="apellidoPaterno" size="30" type="text" required="" placeholder="escribe tu apellido paterno" value="${usuario?.apellidoPaterno}"/>
                  </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: usuario, field: 'apellidoMaterno', 'error')}">
                  <label for="xlInput">
                    <g:message code="usuario.apellidoMaterno" />
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="apellidoMaterno" size="30" type="text" placeholder="escribe tu apellido materno" value="${usuario?.apellidoMaterno}"/>
                  </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: usuario, field: 'sexo', 'errors')}">
                  <label for="xlInput">
                    <g:message code="usuario.sexo" />
                  </label>
                  <div class="input">
                    <g:select name="sexo" from="${usuario.constraints.sexo.inList}" value="${usuario?.sexo}" valueMessagePrefix="usuario.sexo"  />
                  </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: usuario, field: 'telefono', 'error')} required">
                  <label for="xlInput">
                    <g:message code="usuario.telefono" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" maxlength="10" name="telefono" size="30" type="text" required="" placeholder="telefono o celular" value="${usuario?.telefono}"/>
                  </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: usuario, field: 'correo', 'error')} required">
                  <label for="xlInput">
                    <g:message code="usuario.correo" />
                    <span class="required-indicator">*</span>
                  </label>
                  <div class="input">
                    <input class="xlarge" id="xlInput" name="correo" size="30" type="email" required="" placeholder="escribe tu correo" value="${usuario?.correo}"/>
                  </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: usuarioInstance, field: 'fechaDeNacimiento', 'error')} required">
            <label for="mediumSelect">
              <g:message code="usuario.fechaDeNacimiento" />
              <span class="required-indicator">*</span>
            </label>
            <div class="input">
              <g:datePicker class="medium" id="medium" name="fechaDeNacimiento" precision="day"  value="${usuario?.fechaDeNacimiento}"  years="${2007..1940}"/>
            </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: usuario, field: 'imagenes', 'error')}">
            <label for="fileInput">
              <g:message code="usuario.imagen"/>
            </label>
            <div class="input">
              <input class="input-file" id="fileInput" type="file" name="imagen" />
            </div>
</div><!-- /clearfix -->

<sec:ifAllGranted roles="ROLE_ADMIN">
<div class="clearfix ${hasErrors(bean: usuario, field: 'accountExpired', 'error')}">
            <label for="appendedInput">
              <g:message code="usuario.accountExpired" />
            </label>
            <div class="input">
              <div class="input-append">
                <label class="add-on"><input type="checkbox" name="accountExpired" value="${usuario?.accountExpired}" /></label>
              </div>
            </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: usuario, field: 'accountLocked', 'error')}">
            <label for="appendedInput">
              <g:message code="usuario.accountLocked" />
            </label>
            <div class="input">
              <div class="input-append">
                <label class="add-on"><input type="checkbox" name="accountLocked" value="${usuario?.accountLocked}" /></label>
              </div>
            </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: usuario, field: 'enabled', 'error')}">
            <label for="appendedInput">
              <g:message code="usuario.enabled" />
            </label>
            <div class="input">
              <div class="input-append">
                <label class="add-on"><input type="checkbox" name="enabled" value="${usuario?.enabled}" checked="checked"/></label>
              </div>
            </div>
</div><!-- /clearfix -->

<div class="clearfix ${hasErrors(bean: usuario, field: 'passwordExpired', 'error')}">
            <label for="appendedInput">
              <g:message code="usuario.passwordExpired" />
            </label>
            <div class="input">
              <div class="input-append">
                <label class="add-on">
                  <input type="checkbox" name="passwordExpired" value="${usuario?.passwordExpired}" />
                </label>
              </div>
            </div>
</div><!-- /clearfix -->

         
<g:if test="${roles}">
    <div class="clearfix ${hasErrors(bean: usuario, field: 'authorities', 'error')} ">
        <g:set var="contador" value="${1}" />
        <g:each var="entry" in="${roles}">
            <label for="${entry.key.authority}">
                <g:if test="${contador++ == 1}">
                    <g:message code="usuario.authorities" />
                </g:if>
            </label>
          <div class="input">
            <g:checkBox name="${entry.key.authority}" value="${entry.value}"/> ${entry.key.authority}<br/>
          </div>
        </g:each>
    </div>
</g:if>
</sec:ifAllGranted>