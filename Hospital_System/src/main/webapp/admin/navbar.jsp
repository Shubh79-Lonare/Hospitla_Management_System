
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-sharp-duotone fa-solid fa-hospital"></i></i>MEDI HOME</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i
						class="fa-sharp-duotone fa-solid fa-right-to-bracket"></i>HOME</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="doctor.jsp"> ADD DOCTOR</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="view_doctor.jsp">VIEW DOCTOR</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="patient.jsp">PATIENT</a></li>
			</ul>

			<!-- <li class="nav-item"><a class="nav-link active"
					aria-current="page" href="user_login.jsp">USER</a></li> -->
			<!--  <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> -->

			<!-- <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->

			<div class="dropdown">
				<button class="btn btn-success dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">Admin</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="../adminLogout">Logout</a></li>

				</ul>
			</div>
		</div>
	</div>
</nav>