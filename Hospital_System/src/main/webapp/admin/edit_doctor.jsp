<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.DoctorDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor Details Page</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

/* Centering the card */
.center-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 102vh; /* Full height of the viewport */
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="center-container">
		<div class="container-fluid p-3">
			<div class="row">
				<!-- Add Doctor Card -->
				<div class="col-md-4 offset-md-4">
					<div class="card paint-card">
						<div class="card-body">
							<p class="fs-3 text-center">Edit Doctor Details</p>

							<!-- Error and Success Messages -->
							<c:if test="${not empty errorMsg}">
								<div class="text-center text-danger">${errorMsg}</div>
								<c:remove var="errorMsg" scope="session" />
							</c:if>
							<c:if test="${not empty sucMsg}">
								<div class="text-center text-success">${sucMsg}</div>
								<c:remove var="sucMsg" scope="session" />
							</c:if>

							<%
							int id = Integer.parseInt(request.getParameter("id"));
							DoctorDao dao2 = new DoctorDao(DBConnection.getConn());
							Doctor d = dao2.getDoctorById(id);
							%>

							<!-- Add Doctor Form -->
							<form action="../uptodateDoctor" method="post">
								<div class="mb-3">
									<label class="form-label">Full Name</label> <input type="text"
										required name="fullname" class="form-control" value="<%=d.getFullName()%>">
								</div>
								<div class="mb-3">
									<label class="form-label">DOB</label> <input type="date"value="<%=d.getDob()%>"
										required name="dob" class="form-control">
								</div>
								<div class="mb-3">
									<label class="form-label">Qualification</label> <input
										type="text" required value="<%=d.getQualification()%>"name="qualification" class="form-control">
								</div>
								<div class="mb-3">
									<label class="form-label">Specialist</label> <select
										name="spec" required class="form-control">
										<option><%=d.getSpecialist()%></option>
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
										required value="<%=d.getEmail()%>"name="email" class="form-control">
								</div>
								<div class="mb-3">
									<label class="form-label">Mob No</label> <input type="text"
										required value="<%=d.getMobNo()%>"name="mobno" class="form-control">
								</div>
								<div class="mb-3">
									<label class="form-label">Password</label> <input
										type="text" required value="<%=d.getPassword()%>"name="password" class="form-control">
								</div>
								<input type="hidden" name="id" value="<%=d.getId()%>">
								<button type="submit" class="btn btn-primary col-md-12">Update</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
