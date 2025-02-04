<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Appointment"%>
<%@ page import="com.user.servlet.UserLogin"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@include file="../component/allcss.jsp"%>
<style>
.card {
	border: none;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
	color: #198754; /* Bootstrap success green for the entire content */
}

.card:hover {
	transform: scale(1.05);
}

.card i {
	font-size: 3rem;
	color: inherit; /* Inherit the card's color */
}

.card p {
	margin: 0;
	color: inherit; /* Inherit the card's color */
}

.number {
	font-size: 1.5rem;
	font-weight: bold;
	color: inherit; /* Inherit the card's color */
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap JS and Popper.js -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container py-5">
		<h2 class="text-center mb-4">Admin Dashboard</h2>
		<c:if test="${not empty sucMsg}">
			<div class="text-center text-success">${sucMsg}</div>
			<c:remove var="sucMsg" scope="session" />
		</c:if>
		<c:if test="${not empty errorMsg}">
			<div class="text-center text-danger">${errorMsg}</div>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<div class="row g-4">
			<!-- Doctor Card -->
			<div class="col-md-4">
				<div class="card text-center p-3">
					<i class="fas fa-user-md fa-3x"></i>
					<p class="mt-4" >Doctor </p>
					<p class="number"><%
					DoctorDao dao = new DoctorDao(DBConnection.getConn());
					int count=dao.countDoctor();
					
					%><%=count %></p>
				</div>
			</div>
			<!-- User Card -->
			<div class="col-md-4">
				<div class="card text-center p-3">
					<i class="fas fa-user fa-3x"></i>
					<p class="mt-4">User</p>
					<p class="number"><%=dao.countUser() %></p>
				</div>
			</div>
			<!-- Total Appointment Card -->
			<div class="col-md-4">
				<div class="card text-center p-3">
					<i class="fas fa-calendar-check fa-3x"></i>
					<p class="mt-4">Total Appointment</p>
					<p class="number"><%=dao.countAppointment() %></p>
				</div>
			</div>
			<!-- Specialist Card -->
			<div class="col-md-4">
				<div class="card text-center p-3" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<i class="fas fa-calendar-alt fa-3x"></i>
					<p class="mt-4">Specialist</p>
					<p class="number"><%=dao.countSpecialist() %></p>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpecialist"method="post">
						<div class="form group">
							<label>Enter Specialist Name</label> <input type="text"
								name="specName" class="form control">
						</div>
						<div class="text-center mt-3" >
							<button type="submit" class="btn btn-primary">Add</button>
						</div>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
				</div> 	
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</body>
</html>
