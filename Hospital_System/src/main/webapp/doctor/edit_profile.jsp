<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Specalist"%>
<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit_Profile_Doctor</title>
<%@include file="../component/allcss.jsp"%>
<style>
.card {
	border: none;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
	color: #198754; /* Bootstrap success green for the entire content */
	height: 100%; /* Ensure consistent height for both cards */
}
</style>

</head>
<body>
	<c:if test="${empty doctorObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>
	<div class="container p-4 ">
		<div class="row">
			<div class="col-md-4 ">
				<div class="card paint-card">
					<p class=" text-center fs-3">CHANGE PASSWORD</p>
					<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-3">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label><input type="password"
									name="newPassword" class="form-control" required>

							</div>
							<div class="mb-3">
								<label>Enter Old Password</label><input type="password"
									name="oldPassword" class="form-control" required>

							</div>
							<input type="hidden" value="${doctorObj.id }" name="uid">
							<button class="btn btn-success  col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-6 offset_md-2	">
				<div class="card paint card">
					<p class="text-center fs-3">EDIT PROFILE</p>
					
					<c:if test="${not empty succMsgd }">
						<p class="text-center text-success fs-3">${succMsgd}</p>
						<c:remove var="succMsgd" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsgd }">
						<p class="text-center text-danger fs-5">${errorMsgd}</p>
						<c:remove var="errorMsgd" scope="session" />
					</c:if>
					
					<div class="card-body">
						<form action="../doctorUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="${doctorObj.fullName }">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control"
									value="${doctorObj.dob}">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" required name="qualification" class="form-control"
									value="${doctorObj.qualification}">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control" value="${doctorObj.specialist }">
									<option>---SELECT---</option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnection.getConn());
									List<Specalist> list = dao.getAllSpecialist();
									for (Specalist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>

									<%
									}
									%>

								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									readonly required name="email" class="form-control"
									value="${doctorObj.email }">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control"
									value="${doctorObj.mobNo }">
							</div>

							<input type="hidden" name="id" value="${doctorObj.id }">
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>