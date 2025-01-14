<%@page import="com.db.DBConnection"%>
<%@ page import="com.entity.Doctor" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.DoctorDao"%>
<!DOCTYPE html>
<html>
	
<head>
    <meta charset="ISO-8859-1">
    <title>User Appointment</title>
    <%@ include file="component/allcss.jsp" %>

    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
        }

        .backImg {
            background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)), url("Images/backHos.jpg");
            height: 20vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>

<body>

    <%@ include file="component/navbar.jsp" %>

    <div class="container-fluid backImg p-5">
        <p class="text-center fs-2 text-white"></p>
    </div>

    <div class="container p-3">
        <div class="row">
            <!-- Left Section for Image -->
            <div class="col-md-6 p-5">
                <img alt="Doctor" src="Images/doc1.jpg" class="img-fluid">
            </div>

            <!-- Right Section for Form -->
            <div class="col-md-6">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="text-center fs-3">User Appointment</p>

                        <!-- Error Message -->
                        <c:if test="${not empty errorMsg}">
                            <p class="fs-4 text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                        <!-- Success Message -->
                        <c:if test="${not empty succMsg}">
                            <p class="fs-4 text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <form class="row g-3" action="addAppointment" method="post">
                          
                            <input type="hidden" name="userid" value="${userObj.id}">

                            <div class="col-md-6">
                                <label for="fullname" class="form-label">Full Name</label>
                                <input required type="text" class="form-control" id="fullname" name="fullname">
                            </div>

                            <div class="col-md-6">
                                <label for="gender" class="form-label">Gender</label>
                                <select class="form-control" id="gender" name="gender" required>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label for="age" class="form-label">Age</label>
                                <input required type="number" class="form-control" id="age" name="age">
                            </div>

                            <div class="col-md-6">
                                <label for="appoint_date" class="form-label">Appointment Date</label>
                                <input type="date" class="form-control" id="appoint_date" name="appoint_date" required>
                            </div>

                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <input required type="email" class="form-control" id="email" name="email">
                            </div>

                            <div class="col-md-6">
                                <label for="phno" class="form-label">Phone No</label>
                                <input maxlength="10" required type="number" class="form-control" id="phno" name="phno">
                            </div>

                            <div class="col-md-6">
                                <label for="diseases" class="form-label">Diseases</label>
                                <input required type="text" class="form-control" id="diseases" name="diseases">
                            </div>

                            <div class="col-md-6">
                                <label for="doctor" class="form-label">Doctor</label>
                                <select required class="form-control" id="doctor" name="doct">
                                    <option value="">--Select--</option>
                                    <%
                                    DoctorDao dao= new DoctorDao(DBConnection.getConn());
                                		List<Doctor>list=dao.getAllDoctor();
                                    for(Doctor d : list){
                                    %>	
                                    	<option value="<%=d.getId() %>"><%=d.getFullName() %>(<%=d.getSpecialist()%>)
                                    <%
                                    }
                                    
            
                                    %>
                                    <%-- Add dynamic doctor options here --%>
                                    <%-- <c:forEach var="doc" items="${doctorList}">
                                        <option value="${doc.id}">${doc.name}</option>
                                    </c:forEach> --%>
                                </select>
                            </div>

                            <div class="col-md-12">
                                <label for="address" class="form-label">Full Address</label>
                                <textarea required id="address" name="address" class="form-control" rows="3"></textarea>
                            </div>

                            <c:if test="${empty userObj}">
                                <a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
                            </c:if>

                            <c:if test="${not empty userObj}">
                                <button type="submit" class="col-md-6 offset-md-3 btn btn-success">Submit</button>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@include file="component/footer.jsp"%>
</body>
</html>
