<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign-Up page</title>
<%@include file="component/allcss.jsp"%>

<!-- Shadowing -->
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row justify-content-center">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<h4 class="fs-4 text-center mb-4">User Registration Form</h4>
						
						<c:if test="${not empty sucMsg }">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session"/>
							</c:if>
						
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"/>
							</c:if>
						
							
						<form action="user_register" method="post">
							<div class="mb-3">
								<label for="Full Name " class="form-label">Full Name</label> <input
									required name="full name" type="full name" class="form-control"
									id="email" placeholder="Enter Your Full Name">
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email address</label> <input
									required name="email" type="email" class="form-control"
									id="email" placeholder="Enter your email">
							</div>

							<div class="mb-3">
								<label for="password" class="form-label">Password</label> <input
									required name="password" type="password" class="form-control"
									id="password" placeholder="Enter your password">
							</div>
							<button type="submit" class="btn bg-success text-white col-12">Login</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>