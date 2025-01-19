<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
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
<title>Doctor Dashboard</title>
<%@include file="../component/allcss.jsp" %>
<style>
.card {
	border: none;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
	color: #198754; /* Bootstrap success green for the entire content */
	height: 100%; /* Ensure consistent height for both cards */
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
</head>
<body>
<c:if test="${empty doctorObj}">
    <c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp" %>
<h1 class="text-center my-4">Doctor Dashboard</h1>

<div class="container">
    <div class="row justify-content-center">
    <%
    Doctor d=(Doctor)session.getAttribute("doctorObj");
                DoctorDao dao=new DoctorDao(DBConnection.getConn());
                
                %>
        <!-- Doctor Card -->
        <div class="col-md-5">
            <div class="card text-center p-4">
                <i class="fas fa-user-md"></i>
                <p class="fs-4">Doctor </p>
                <p class="number"><br>
                <%=dao.countDoctor() %>
                
                <!-- <p class="number">5</p> -->
            </div>
        </div>
        
        <!-- User Card -->
        <div class="col-md-5">
            <div class="card text-center p-4">
                <i class="fas fa-user"></i>
                <p class="fs-4">Total Appointments <br><%=dao.countAppointmentByDoctorId(d.getId()) %></p>
            </div>
        </div>
    </div>
</div>

</body>
</html>
