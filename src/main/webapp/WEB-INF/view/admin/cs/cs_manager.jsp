<%@ page import="com.hoteldelluna.web.entity.CSBoardTO"%>
<%@ page import="com.hoteldelluna.web.service.CSBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>

<%
	CSBoardDAO dao = new CSBoardDAO();
	ArrayList<CSBoardTO> csboardLists = dao.csboardList();

	int totalRecord = csboardLists.size();
	
	StringBuffer sbHtml = new StringBuffer();
		
		for(CSBoardTO to : csboardLists) {
			String c_no = to.getC_no();
			
			int c_grpl = to.getC_grpl();
			String c_sgrpl = "";
			
			for(int j = 1; j <= c_grpl; j++) {
				c_sgrpl += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			}
				
			String c_subject = to.getC_subject();
			String c_name = to.getC_name();
			String c_wdate = to.getC_wdate();
			String c_hit = to.getC_hit();
			
			sbHtml.append("<tr>");
			sbHtml.append("	<td>" + c_no + "</td>");
			sbHtml.append("	<td>");
			
			if(c_grpl != 0) {
				sbHtml.append(c_sgrpl + "<img src='admin/assets/images/samples/icon_re2.gif' />" + "&nbsp;&nbsp;");
			}
			sbHtml.append("<a href='csview?c_no=" + c_no + "'>" + c_subject + "</a></td>");
			sbHtml.append("	<td>" + c_name + "</td>");
			sbHtml.append("	<td>" + c_wdate + "</td>");
			sbHtml.append("	<td>" + c_hit + "</td>");
			sbHtml.append("</tr>");
		}
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
				<div class="mylogo">
					<a href="adminIndex"><img src="admin/assets/images/logo/logo.png" width="180" height="70"></a>
				</div>
				<div class="toggler">
					<a href="#" class="sidebar-hide d-xl-none d-block"><i
						class="bi bi-x bi-middle"></i></a>
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
							<h3>CS Management</h3>
						</div>
					</div>
				</div>
				<section class="section">
					<div class="card">
						<div class="card-body">
							<table class="table table-striped" id="table1">
								<thead>
									<tr>
										<th>No</th>
										<th>Subject</th>
										<th>Name</th>
										<th>Date</th>
										<th>Hit</th>
									</tr>
								</thead>
								<tbody>
								<%=sbHtml.toString() %>
								</tbody>
							</table>
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