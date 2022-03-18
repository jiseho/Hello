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
						<li class="sidebar-item active "><a href="adminIndex"
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
							<h3>Users Management</h3>
						</div>
					</div>
				</div>
				<section class="section">
					<form action="usermanage" method="post">
						<div class="card">
							<div class="card-body">
								<table class="table table-striped" id="table1">
									<thead>
										<tr>
											<th>U_No</th>
											<th>ID</th>
											<th>Password</th>
											<th>Name</th>
											<th>Birth</th>
											<th>Phone</th>
											<th>Email</th>
											<th>CreateDate</th>
											<th>Gender</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="u" items="${userlist}">
											<tr>
												<td>${u.no}</td>
												<td>${u.id}</td>
												<td>${u.pwd}</td>
												<td>${u.name}</td>
												<td>${u.birth}</td>
												<td>${u.phone}</td>
												<td>${u.email}</td>
												<td>${u.date}</td>
												<td>${u.gender}</td>
												<th><input type="checkbox" name="del-id"
													value="${u.no}"></th>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!--  <button class="button button4">수정</button>-->

								<input type="submit" class="button button4" name="cmd" value="Delete" />
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
	<script
		src="admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="admin/assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="admin/assets/vendors/simple-datatables/simple-datatables.js"></script>
	<script>
		// Simple Datatable
		let table1 = document.querySelector('#table1');
		let dataTable = new simpleDatatables.DataTable(table1);
	</script>
	<script src="admin/assets/js/mazer.js"></script>
</body>
</html>