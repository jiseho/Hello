<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="admin/assets/css/bootstrap.css">
<link rel="stylesheet" href="admin/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="admin/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="admin/assets/css/app.css">
<link rel="shortcut icon" href="admin/assets/images/favicon.svg" type="image/x-icon">
<link rel="stylesheet" href="admin/assets/css/cs_manager_view.css">
</head>
<body>
	<div id="app">
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<!--꼭 필요-->

				<div class="d-flex justify-content-between">
					<div class="mylogo">
						<a href="adminIndex"><img src="admin/assets/images/logo/logo.png"
							width="180" height="70"></a>
					</div>
				</div>
				<div class="sidebar-menu">
					<ul class="menu">
						<li class="sidebar-item active ">
							<a href="index" class='sidebar-link'> <i class="bi bi-grid-fill"></i> 
								<span>Main</span>
							</a>
						</li>
						<li class="sidebar-item  has-sub">
							<a href="#"class='sidebar-link'> 
								<i class="bi bi-file-earmark-spreadsheet-fill"></i> 
								<span>Manage Users</span>
							</a>
							<ul class="submenu ">
								<li class="submenu-item ">
									<a href="usermanage">Manage Users</a>
								</li>
							</ul>
						</li>
						<li class="sidebar-item  has-sub"><a href="#"
							class='sidebar-link'> <i
								class="bi bi-file-earmark-spreadsheet-fill"></i> <span>Manage Reservations</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a
									href="resrvmanage">Manage Reservations</a></li>
							</ul></li>
						<li class="sidebar-item  has-sub">
							<a href="#" class='sidebar-link'> 
								<i class="bi bi-file-earmark-spreadsheet-fill"></i> 
								<span>Manage Rooms</span>
							</a>
						<ul class="submenu ">
							<li class="submenu-item ">
								<a href="roommanage">Manage Rooms</a>
							</li>
						</ul>
						</li>
						<li class="sidebar-item  has-sub">
							<a href="#" class='sidebar-link'> 
							<i class="bi bi-file-earmark-spreadsheet-fill"></i> 
							<span>Manage Boards</span>
						</a>
							<ul class="submenu ">
								<li class="submenu-item "><a href="noticemanage">Notice</a></li>
								<li class="submenu-item "><a href="faqmanage">FAQ</a></li>
								<li class="submenu-item "><a href="csmanage">1&#58;1 Inquiry</a></li>
							</ul>
						</li>
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
							<h3>Notice Management</h3>
						</div>
					</div>
				</div>
				<section class="section">
					<div class="card">
						<div class="card-body">
							<div class="con_txt">
								<div class="contents_sub">
									<!--게시판-->
									<c:set var="n" value="${notice}"/>
									<div class="board_view">
										<table>
											<tr>
												<th width="10%">Subject</th>
												<td width="60%">${n.n_subject }</td>
												<th width="10%">Date</th>
												<td width="20%">${n.ndate }</td>
											</tr>
											<tr>
												<th>Name</th>
												<td>${n.n_name }</td>
												<th>Hit</th>
												<td>${n.nhit }</td>
											</tr>
											<tr>
												<td colspan="4" height="200" valign="top"
													style="padding: 20px; line-height: 160%">${n.n_content }</td>
											</tr>
										</table>
									</div>
									<div class="btn_area">
										<div class="align_left">
											<input type="button" value="List" class="btn_list btn_txt02"
												style="cursor: pointer;"
												onclick="location.href='noticemanage'" />
										</div>
										<div class="align_right">

											<input type="button" value="Edit" class="btn_write btn_txt01"
												style="cursor: pointer;"
												onclick="location.href='noticemodify?noticeNo=${param.noticeNo}'" /> 
											<input
												type="button" value="Delete" class="btn_write btn_txt01"
												style="cursor: pointer;"
												onclick="location.href='noticedelete?noticeNo=${param.noticeNo}'" />
										</div>
									</div>
									<!--//게시판-->
								</div>
							</div>
						</div>
					</div>

				</section>
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