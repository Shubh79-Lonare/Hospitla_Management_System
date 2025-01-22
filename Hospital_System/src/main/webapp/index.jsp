<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
/* new trying css */
<
style>.card {
	border: none;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
}

.card:hover {
	transform: scale(1.05);
}

.card i {
	font-size: 3rem;
	color: #198754; /* Bootstrap success green */
}

.card p {
	margin: 0;
}

.number {
	font-size: 1.5rem;
	font-weight: bold;
	color: #198754;
}
</style>
<!-- </style> -->
</head>
<body>

	<%--//For checking Db connection is establish or not
 <%Connection con= DBConnection.getConn(); 
	/* out.print(con); */
	/* /* /* if(con!=null){
		out.print(" Established");
	}
	else{
		out.println("Not Established");
	} */ */ */
%> --%>
	<%@include file="component/navbar.jsp"%>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="Images/hosp.jpeg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="Images/doc1.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="Images/doctnew.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- key feateures -->
	<div class="container my-5">
		<h2 class="text-center mb-4">KEY FEATURES OF OUR HOSPITAL</h2>
		<div class="row align-items-center">
			<!-- Cards Section -->
			<div class="col-md-8">
				<div class="row">
					<!-- Top Row -->
					<div class="col-md-6 mb-4">
						<div class="card shadow-sm">
							<div class="card paint-card">
								<div class="card-body">
									<h5 class="card-title"><u><b>100% SAFETY</b></u>:-</h5>
									<p class="card-text">Your health and safety are our top
										priorities. Our hospital adheres to the highest standards of
										hygiene, sterilization, and patient care. With
										state-of-the-art equipment and dedicated medical staff, we
										ensure a secure and risk-free environment for all. Trust us
										for your healthcare needs!</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 mb-4">
						<div class="card shadow-sm">
							<div class="card paint-card">
								<div class="card-body">
									<h5 class="card-title"><u><b>CLEAN ENVIRONMENT</b></u>:-</h5>
									<p class="card-text">We maintain a spotless and sanitized
										environment to ensure the safety and comfort of our patients
										and visitors. Regular cleaning, disinfection protocols, and
										waste management practices are strictly followed to uphold the
										highest standards of hygiene. Experience care in a clean and
										healthy space!</p>
								</div>
							</div>
						</div>
					</div>
					<!-- Bottom Row -->
					<div class="col-md-6 mb-4">
						<div class="card shadow-sm">
							<div class="card paint-card">
								<div class="card-body">
									<h5 class="card-title"><u> <b>FRIENDLY DOCTORS </b></u>:- </h5>
									<p class="card-text">Our team of doctors is not only highly
										qualified but also compassionate and approachable. They take
										the time to listen, understand, and provide personalized care,
										ensuring you feel comfortable and supported throughout your
										journey to recovery.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 mb-4">
						<div class="card shadow-sm">
							<div class="card paint-card">
								<div class="card-body">
									<h5 class="card-title"><u> <b>MEDICAL RESEARCH </b></u>:- </h5>
									<p class="card-text">Dedicated to Medical Research Our
										hospital focuses on finding new ways to improve healthcare
										through research. We work hard to discover better treatments
										and technologies to help our patients and advance medical
										knowledge.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="col-md-4 text-center">
				<img src="Images/doc_pat.jpg" alt="Doctor" class="img-fluid rounded"
					style="max-height: 300px;">
			</div>
		</div>
	</div>

	<!-- Out Team -->

	<!-- Doctor's Image Section -->
	<hr>
	<div class="container my-5">
		<h2 class="text-center mb-4">OUR TEAM</h2>
		<div class="row text-center">
			<!-- Team Member 1 -->
			<div class="col-md-3 mb-4">
				<div class="card shadow-sm">
					<img src="Images/doc1.jpg" class="card-img-top" alt="Samuani Simi"
						style="height: 300px; object-fit: cover;">
					<div class="card-body">
						<h5 class="card-title">Dr. Samuani Simi</h5>
						<p class="card-text">(CEO & Chairman)</p>
					</div>
				</div>
			</div>
			<!-- Team Member 2 -->
			<div class="col-md-3 mb-4">
				<div class="card shadow-sm">
					<img src="Images/doctnew.jpg" class="card-img-top"
						alt="Dr. Siva Kumar" style="height: 300px; object-fit: cover;">
					<div class="card-body">
						<h5 class="card-title">Dr. Joy Smit</h5>
						<p class="card-text">(Chief Doctor)</p>
					</div>
				</div>
			</div>
			<!-- Team Member 3 -->
			<div class="col-md-3 mb-4">
				<div class="card shadow-sm">
					<img src="Images/monikad.jpg" class="card-img-top"
						alt="Dr. Niuise Paule" style="height: 300px; object-fit: cover;">
					<div class="card-body">
						<h5 class="card-title">Dr. Monika D</h5>
						<p class="card-text">(Chief Doctor)</p>
					</div>
				</div>
			</div>
			<!-- Team Member 4 -->
			<div class="col-md-3 mb-4">
				<div class="card shadow-sm">
					<img src="Images/doc4.jpg" class="card-img-top"
						alt="Dr. Mathue Samuel" style="height: 300px; object-fit: cover;">
					<div class="card-body">
						<h5 class="card-title">Dr. Madhav Mane</h5>
						<p class="card-text">(Chief Doctor)</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>

</body>
</html>