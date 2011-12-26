<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<p>
Hola ${usuario.nombre}
</p>
<p>
Te damos la Bienvenida a AdvenTicket
</p>
<p>
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's 
standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it 
to make a type specimen book.
</p>
<br>
Podras iniciar sesion con:
<br>
usuario: ${usuario.username}
<br>
contrasena: ${usuario.password}
<br>
<p>
En la sigueinte direccion: adventicket.com
</p>
<p>
Lorem Ipsum is simply dummy text of the printing and typesetting industry.
</p>
<img src="${resource(dir: 'images', file: 'logo1.png')}" alt="" title="" border="0" style="float: right"/>

