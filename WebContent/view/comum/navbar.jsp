<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<c:import url="../css/css_navbar.jsp" />
</head>

<nav class="navbar navbar-expand-lg navbar-dark " style="background-color: #277554;">
  <a class="navbar-brand" href="#">Uevents</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
   <li class="nav-item active">
        <a class="nav-link"href="paginaInicial">Entrar</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link"href="/uevents/visualizarEventos">Visualizar Eventos</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/uevents/cadasUsuario">Cadastre-se</a>
      </li>
    </ul>
  </div>
</nav>
