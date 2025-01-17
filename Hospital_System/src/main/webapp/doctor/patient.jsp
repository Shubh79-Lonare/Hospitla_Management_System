<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	    <%@page import="com.db.DBConnection"%>
<%@ page import="com.user.servlet.UserLogin" %>
<%@ page import="java.util.List" %>
<%@page isELIgnored="false"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Appointment"%>
<!DOCTYPE html>
<html>
<head>
<!-- Shadowing -->
<style type="text/css">
.paint-card{
box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>

</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>


						<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Action </th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor doctor=(Doctor)session.getAttribute("doctorObj");
								AppointmentDAO dao= new AppointmentDAO(DBConnection.getConn());
								DoctorDao dao2= new DoctorDao(DBConnection.getConn());
								List<Appointment> list=dao.getAllAppointmentByDoctorLogin(doctor.getId());
								 
								for (Appointment ap : list) {
									
								%>
								<tr>
									<td><%=ap.getFullName()%></td>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhNo()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=ap.getStatus()%></td>
									
									<%-- <td><%=d.getPassword() %></td> --%>
									<td>
									<%
									if("Pending".equals(ap.getStatus()))
									{%>
										<a href="comment.jsp?id=<%=ap.getId()%>"
										class="btn btn-sm btn-warning"> Comment </a>
									 <%}else{%>
										 <a href="#"
													class="btn btn-sm disabled"> Comment </a>
										
									<% }
									
									%>
									
									
									</td>
								</tr>
									
										<%}
									%>
										 

								

							</tbody>
						</table>
					</div>
				</div>
			</div>
</body>
</html>