<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hotel Del Luna Admin</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="admin/assets/css/bootstrap.css">
<link rel="stylesheet" href="admin/assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="admin/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="admin/assets/css/app.css">
<link rel="shortcut icon" href="admin/assets/images/favicon.svg" type="image/x-icon">
</head>
<body>
	<div id="app">
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<!--꼭 필요-->

				<div class="d-flex justify-content-between">
					<div class="mylogo">
						<a href="adminIndex"><img src="admin/assets/images/logo/logo.png" width="180" height="70"></a>
					</div>
				</div>
				<div class="sidebar-menu">
					<ul class="menu">
						<li class="sidebar-item active "><a href="index"
							class='sidebar-link'> <i class="bi bi-grid-fill"></i> <span>Main</span>
						</a></li>
						<li class="sidebar-item  has-sub"><a href="#"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>Manage
									Users</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a href="usermanage">Manage
										Users</a></li>
							</ul></li>
						<li class="sidebar-item  has-sub"><a href="#"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>Manage
									Reservations</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a href="resrvmanage">Manage
										Reservations</a></li>
							</ul></li>
						<li class="sidebar-item  has-sub"><a href="#"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>Manage
									Rooms</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a href="roommanage">Manage
										Rooms</a></li>
							</ul></li>
						<li class="sidebar-item  has-sub"><a href="#"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>Manage
									Boards</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a href="noticemanage">Notice</a></li>
								<li class="submenu-item "><a href="faqmanage">FAQ</a></li>
								<li class="submenu-item "><a href="csmanage">1&#58;1 Inquiry</a></li>
							</ul></li>
					</ul>
				</div>
				<button class="sidebar-toggler btn x">
					<i data-feather="x"></i>
				</button>
			</div>
		</div>
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>
			<div class="page-heading">
				<h3>Statistics</h3>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="col-12 col-lg-9">
						<div class="row">
							<div class="col-6 col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body px-3 py-4-5">
										<div class="row">
											<div class="col-md-4">
												<div class="stats-icon purple">
													<i class="iconly-boldProfile"></i>
												</div>
											</div>
											<div class="col-md-8">
												<h6 class="text-muted font-semibold">Users</h6>
												<h6 class="font-extrabold mb-0">${totalLogin}</h6>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-6 col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body px-3 py-4-5">
										<div class="row">
											<div class="col-md-4">
												<div class="stats-icon blue">
													<i class="iconly-boldCalendar"></i>
												</div>
											</div>
											<div class="col-md-8">
												<h6 class="text-muted font-semibold">Reservations</h6>
												<h6 class="font-extrabold mb-0">${totalBooking}</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6 col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body px-3 py-4-5">
										<div class="row">
											<div class="col-md-4">
												<div class="stats-icon green">
													<i class="iconly-boldHome"></i>
												</div>
											</div>
											<div class="col-md-8">
												<h6 class="text-muted font-semibold">Rooms</h6>
												<h6 class="font-extrabold mb-0">${totalRoom}</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6 col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body px-3 py-4-5">
										<div class="row">
											<div class="col-md-4">
												<div class="stats-icon red">
													<i class="iconly-boldEdit-Square"></i>
												</div>
											</div>
											<div class="col-md-8">
												<h6 class="text-muted font-semibold">Saved Posts</h6>
												<h6 class="font-extrabold mb-0">${totalPost}</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h4>Visitors per Month</h4>
									</div>
									<div class="card-body">
										<div id="chart-profile-visit"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-xl-4">
								<div class="card">
									<div class="card-header">
										<h4>Visitors from</h4>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-6">
												<div class="d-flex align-items-center">
													<svg class="bi text-primary" width="32" height="32"
														fill="blue" style="width: 10px">
                                         			   <use
															xlink:href="admin/assets/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill" />
                                        			</svg>
													<h5 class="mb-0 ms-3">Korea</h5>
												</div>
											</div>
											<div class="col-6">
												<h5 class="mb-0">5</h5>
											</div>
											<div class="col-12">
												<div id="chart-europe"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12 col-xl-8">
								<div class="card">
									<div class="card-header">
										<h4>Latest Comments</h4>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-hover table-lg">
												<thead>
													<tr>
														<th>Name</th>
														<th>Comment</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="col-3">
															<div class="d-flex align-items-center">
																<div class="avatar avatar-md">
																	<img src="admin/assets/images/faces/5.jpg">
																</div>
																<p class="font-bold ms-3 mb-0">Son Heungmin</p>
															</div>
														</td>
														<td class="col-auto">
															<p class=" mb-0">Congratulations to open your Hotel!</p>
														</td>
													</tr>
													<tr>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-3">
						<div class="card">
							<div class="card-header">
								<h3>teamAwesome</h3>
							</div>
							<div class="card-content pb-4">
								<div class="recent-message d-flex px-4 py-3">
									<div class="avatar avatar-lg">
										<img src="admin/assets/images/faces/3.jpg">
									</div>
									<div class="name ms-4">
										<h5 class="mb-1">SON Kyeongeun</h5>
										<h6 class="text-muted mb-0">@keson</h6>
									</div>
								</div>
								<div class="recent-message d-flex px-4 py-3">
									<div class="avatar avatar-lg">
										<img src="admin/assets/images/faces/5.jpg">
									</div>
									<div class="name ms-4">
										<h5 class="mb-1">KIM Sojeong</h5>
										<h6 class="text-muted mb-0">@ksoj</h6>
									</div>
								</div>
								<div class="recent-message d-flex px-4 py-3">
									<div class="avatar avatar-lg">
										<img src="admin/assets/images/faces/ms.PNG">
									</div>
									<div class="name ms-4">
										<h5 class="mb-1">KANG Minsoo</h5>
										<h6 class="text-muted mb-0">@alstn</h6>
									</div>
								</div>
								<div class="recent-message d-flex px-4 py-3">
									<div class="avatar avatar-lg">
										<img src="admin/assets/images/faces/2.jpg">
									</div>
									<div class="name ms-4">
										<h5 class="mb-1">JI Seho</h5>
										<h6 class="text-muted mb-0">@jiseho</h6>
									</div>
								</div>
								<div class="recent-message d-flex px-4 py-3">
									<div class="avatar avatar-lg">
										<img src="admin/assets/images/faces/4.jpg">
									</div>
									<div class="name ms-4">
										<h5 class="mb-1">LEE Kicheol</h5>
										<h6 class="text-muted mb-0">@leekicheol</h6>
									</div>
								</div>
							</div>
						</div>
<!-- 						<div class="card"> -->
<!-- 							<div class="card-header"> -->
<!-- 								<h4>Visitors Profile</h4> -->
<!-- 							</div> -->
<!-- 							<div class="card-body"> -->
<!-- 								<div id="chart-visitors-profile"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</section>
			</div>
			<footer>
				<div class="footer clearfix mb-0 text-muted">
					<div class="float-start">
						<p>2022 &copy; teamAwesome from KIC Academy</p>
					</div>
					<div class="float-end">
						<p>
							teamAwesome <span class="text-danger"><i class="bi bi-heart"></i></span>
							<a href="http://www.hoteldelluna.com">Hotel Del LUNA</a>
						</p>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="admin/assets/js/bootstrap.bundle.min.js"></script>
	<script src="admin/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="admin/assets/js/pages/dashboard.js"></script>
	<script src="admin/assets/js/mazer.js"></script>
</body>
</html>