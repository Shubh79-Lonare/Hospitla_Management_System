<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Appointment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.db.DBConnection"%>
<%@ page import="com.user.servlet.UserLogin"%>
<%@ page import="java.util.List"%>
<%@page isELIgnored="false"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.dao.DoctorDao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>

<!-- Shadowing -->
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("Images/backHos.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

</head>
<body>

	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	
	<%@include file="component/navbar.jsp"%>


	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">

			<!-- left Section for Form -->
			<!-- Doctor Details Card -->
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Appointment List</p>

						<!-- Error and Success Messages -->
						<c:if test="${not empty errorMsg}">
							<div class="text-center text-danger">${errorMsg}</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty sucMsg}">
							<div class="text-center text-success">${sucMsg}</div>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								AppointmentDAO dao = new AppointmentDAO(DBConnection.getConn());
								DoctorDao dao2 = new DoctorDao(DBConnection.getConn());
								List<Appointment> list = dao.getAllAppointmentByUserLoginId(user.getId());

								for (Appointment ap : list) {
									Doctor d = dao2.getDoctorById(ap.getDoctorId());
								%>
								<tr>
									<td><%=ap.getFullName()%></td>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullName()%></td>

									<%-- <td><%=d.getPassword() %></td> --%>
									<td>
										<%
										if ("Pendint".equals(ap.getStatus())) {
										%> <a href="#" class="btn btn-sm btn-warning"> Pending </a> <%
 } else {
 %>
										<%=ap.getStatus()%> <%
 }
 %>
									</td>
								</tr>


								<%
								}
								%>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- right Section for Image -->
			<div class="col-md-3 p-3">
				<img alt="Doctor" src="Images/doc1.jpg" class="img-fluid">
			</div>
</body>
</html>