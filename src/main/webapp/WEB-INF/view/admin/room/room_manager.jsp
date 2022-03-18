<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hotel Del Luna Admin</title>
<style>
.mylogo {
	margin-left: 70px;
	padding-top: 35px;
	padding-bottom: 20px;
}

.button4 {
	background-color: white;
	color: rgb(221, 188, 38);
	border: 1px solid #dda937;
	width: 120px;
	height: 50px;
	margin-left: 20px;
	float: right;
}

.button4:hover {
	background-color: #e9c72e;
	color: white;
}
</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="admin/assets/css/bootstrap.css">
<link rel="stylesheet" href="admin/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="admin/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="admin/assets/css/app.css">
<link rel="shortcut icon" href="admin/assets/images/favicon.svg" type="image/x-icon">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon" href="admin/assets/img/favicon.ico">
<link href="https://fonts.googleapis.com/css2?family=El+Messiri&display=swap" rel="stylesheet">

<!-- Place favicon.ico in the root directory -->
<!-- CSS here -->
<link rel="stylesheet" href="admin/assets/hcss/bootstrap.min.css">
<link rel="stylesheet" href="admin/assets/hcss/owl.carousel.min.css">
<link rel="stylesheet" href="admin/assets/hcss/gijgo.css">
<link rel="stylesheet" href="admin/assets/hcss/slicknav.css">
<link rel="stylesheet" href="admin/assets/hcss/animate.min.css">
<link rel="stylesheet" href="admin/assets/hcss/magnific-popup.css">
<link rel="stylesheet" href="admin/assets/hcss/fontawesome-all.min.css">
<link rel="stylesheet" href="admin/assets/hcss/themify-icons.css">
<link rel="stylesheet" href="admin/assets/hcss/themify-icons.css">
<link rel="stylesheet" href="admin/assets/hcss/slick.css">
<link rel="stylesheet" href="admin/assets/hcss/nice-select.css">
<link rel="stylesheet" href="admin/assets/hcss/reserv.css">
<link rel="stylesheet" href="admin/assets/hcss/responsive.css">
<link rel="stylesheet" href="admin/assets/css/room_write.css">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="admin/assets/css/bootstrap.css">
<link rel="stylesheet" href="admin/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="admin/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="admin/assets/css/app.css">
<link rel="shortcut icon" href="admin/assets/images/favicon.svg" type="image/x-icon">

<script type="text/javascript">
	window.onload = function() {
		let list = document.getElementById("select1")
		
		for(let i=0; i<list.options.length; i++) {
			if(list.options[i].value == '${param.value}'){
				document.getElementById("select1").selectedIndex = i
			}
		}
	}
	
	function roomlist() {
		let room = document.getElementById('select1').value;
		location.href='roommanage?value='+room;
	}
</script>

</head>
<body>
	<div id="app">
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<!--꼭 필요-->

				<div class="d-flex justify-content-between">
					<div class="mylogo">
						<a href="adminIndex"><img
							src="admin/assets/images/logo/logo.png" width="180" height="70"></a>
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
				<div class="page-title">
					<div class="row">
						<div class="col-12 col-md-6 order-md-1 order-last">
							<h3>Room Management</h3>
						</div>
					</div>
				</div>
				<form action="roommanage" method="post">
					<section class="section">
						<div class="card">
							<div class="card-body">
								<section class="room-area r-padding1">
									<div class="container">
										<div class="row justify-content-center">
											<div class="col-xl-8">
												<!-- font-back-title -->
											</div>
										</div>


										<div class="row50">
											<div class="select-this">
												<div class="select-itms">
													<select name="branch" id="select1"
														style="margin-bottom: 20px" onchange="roomlist()">
														<option value="%">All</option>
														<option value="Seoul">Seoul</option>
														<option value="Incheon">Incheon</option>
														<option value="Busan">Busan</option>
														<option value="Jeju">Jeju</option>
													</select>
												</div>
											</div>
										</div>

										<div class="row">
											<c:forEach var="r" items="${room}">
												<div class="col-xl-4 col-lg-6 col-md-6">
													<!-- Superior Single Room -->
													<div class="single-room mb-50">
														<div class="room-img">
															<a href="roomupdate?roomNo=${r.r_no}"><img
																src="assets/img/rooms/${r.r_img}" alt=""></a>
														</div>
														<div class="room-caption">
															<h3>
																<a href="roomupdate?roomNo=${r.r_no}">${r.r_roomtype}</a>
															</h3>
															<div class="room-info">
																<div class="room-info-menu">
																	<ion-icon name="bed"></ion-icon>
																	<span class="room-info-title">Bed type</span> <strong
																		class="room-info-text">${r.r_bedtype} </strong>
																</div>
																<div class="room-info-menu">
																	<ion-icon name="people-sharp"></ion-icon>
																	<strong class="room-info-title">Occupancy</strong> <span
																		class="room-info-text">${r.r_occupancy} Person</span>
																</div>
															</div>
															<hr />
															<div class="room-price">
																<span class="room-price-start">From</span> <strong
																	class="room-price-number">${r.r_price} </strong> <span
																	class="room-price-currency">KRW</span>
															</div>
															<br>
															<div class="room-price">
																<span class="room-price-currency">delete : </span> <input
																	type="checkbox" name="del-id" value="${r.r_no}">
															</div>


														</div>
													</div>
												</div>
											</c:forEach>
										</div>
										<input type="button" class="button button4" value="Add"
											onclick="location.href='roomwrite'" /> <input type="submit"
											class="button button4" name="cmd" value="Delete" />
									</div>
								</section>
								<!-- Room End -->
							</div>
						</div>
					</section>
				</form>
			</div>
		</div>
	</div>
	<script src="admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="admin/assets/js/bootstrap.bundle.min.js"></script>
	<script src="admin/assets/vendors/simple-datatables/simple-datatables.js"></script>
	<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
	</script>
	<script src="admin/assets/js/mazer.js"></script>
</body>
</html>