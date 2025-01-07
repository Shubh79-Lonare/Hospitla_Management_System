<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Specalist"%>
<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnection"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor JSP Page</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<!-- Add Doctor Card -->
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>

						<!-- Error and Success Messages -->
						<c:if test="${not empty errorMsg}">
							<div class="text-center text-danger">${errorMsg}</div>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty sucMsg}">
							<div class="text-center text-success">${sucMsg}</div>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<!-- Add Doctor Form -->
						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" required name="qualification" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option> ---SELECT---</option>
									<%
									SpecialistDao dao= new SpecialistDao(DBConnection.getConn());
									List<Specalist> list=dao.getAllSpecialist();
									for(Specalist s: list)
									{%>
										<option><%=s.getSpecialistName() %></option>
										
									<%}
									
									%>

								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									required name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" required name="pasword" class="form-control">
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Doctor Details Card -->
			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao dao2= new DoctorDao(DBConnection.getConn());
							List<Doctor>list2 =dao2.getAllDoctor();
							for(Doctor d: list2)
							{%> 	
							<tr>
							 	<td><%=d.getFullName() %></td>
							 	<td><%=d.getDob() %></td>
							 	<td><%=d.getQualification() %></td>
							 	<td><%=d.getSpecialist() %></td>
							 	<td><%=d.getMobNo() %></td>
							 	<td><%=d.getEmail() %></td>
							 	<td><%=d.getPassword() %></td>
							 	<td>	
							 	<a href ="#" class="btn btn-sm btn-primary"> Edit </a>
							 	<a href ="#" class="btn btn-sm btn-danger"> Delete </a>
							 	</tr>
								
								
							<%}
							 	
								%>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
