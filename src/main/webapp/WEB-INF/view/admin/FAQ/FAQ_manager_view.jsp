
<%@ page import="com.hoteldelluna.web.service.FAQDAO"%>
<%@ page import="com.hoteldelluna.web.entity.FAQTO"%>
<%@ page import="javax.naming.NamingException"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%
	request.setCharacterEncoding("utf-8");
	
	FAQTO to = new FAQTO();
	to.setQ_no(request.getParameter("q_no"));
	
	FAQDAO dao = new FAQDAO();
	to = dao.FAQ_manager_View(to);
	
	String q_no = to.getQ_no();
	String q_subject = to.getQ_subject();
	String q_name = to.getQ_name();
	String q_date = to.getQ_date();
	String q_hit = to.getQ_hit();
	String q_content = to.getQ_content();
%>

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
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="admin/assets/css/bootstrap.css">

<link rel="stylesheet"
	href="admin/assets/vendors/simple-datatables/style.css">

<link rel="stylesheet"
	href="admin/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="admin/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="admin/assets/css/app.css">
<link rel="shortcut icon" href="admin/assets/images/favicon.svg"
	type="image/x-icon">
<link rel="stylesheet" href="admin/assets/css/cs_manager_view.css">
</head>

<body>
	<div id="app">
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">

				<div class="mylogo">
					<a href="adminIndex"><img
						src="admin/assets/images/logo/logo.png" width="180" height="70"></a>
				</div>
				<div class="toggler">
					<a href="#" class="sidebar-hide d-xl-none d-block"><i
						class="bi bi-x bi-middle"></i></a>
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
							<h3>FAQ Management</h3>
						</div>
					</div>
				</div>
				<section class="section">
					<div class="card">
						<div class="card-body">
							<div class="con_txt">
								<div class="contents_sub">
									<!--게시판-->
									<div class="board_view">
										<table>
											<tr>
												<th width="10%">Subject</th>
												<td width="60%"><%=q_subject%></td>
												<th width="10%">Date</th>
												<td width="20%"><%=q_date%></td>
											</tr>
											<tr>
												<th>Name</th>
												<td><%=q_name%></td>
												<th>Hit</th>
												<td><%=q_hit%></td>
											</tr>
											<tr>
												<td colspan="4" height="200" valign="top" 
													style="padding: 20px; line-height: 160%"><%=q_content%></td>
											</tr>
										</table>
									</div>

									<div class="btn_area">
										<div class="align_left">
											<input type="button" value="List" class="btn_list btn_txt02"
												style="cursor: pointer;" onclick="location.href='faqmanage'" />
										</div>
										<div class="align_right">

											<input type="button" value="Edit" class="btn_write btn_txt01"
												style="cursor: pointer;"
												onclick="location.href='faqmodify?q_no=<%=q_no%>'" /> <input
												type="button" value="Delete" class="btn_write btn_txt01"
												style="cursor: pointer;"
												onclick="location.href='faqdelete?q_no=<%=q_no%>'" /> <input
												type="button" value="Write" class="btn_write btn_txt01"
												style="cursor: pointer;"
												onclick="location.href='faqwrite'" /> <input
												type="button" value="Reply" class="btn_write btn_txt01"
												style="cursor: pointer;"
												onclick="location.href='faqreply?q_no=<%=q_no%>'" />
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