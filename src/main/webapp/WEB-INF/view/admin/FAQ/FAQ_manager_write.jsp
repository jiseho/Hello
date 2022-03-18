<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
<link rel="stylesheet" href="admin/assets/css/cs_manager_write.css">
<script type="text/javascript">
window.onload=function(){
	document.getElementById('wbtn').onclick=function(){
		//alert('click');
		//필수요소 검사
		if(document.wfrm.info.checked == false){
			alert('Check the agreement');
			return false;
		}
		if(document.wfrm.q_name.value.trim()== ''){
			alert('Write your name.');
			return false;
		}
		if(document.wfrm.q_subject.value.trim()== ''){
			alert('Write your subject');
			return false;
		}
		if(document.wfrm.q_pwd.value.trim()== ''){
			alert('Write your password');
			return false;
		}
		document.wfrm.submit();
	};
};
</script>
</head>
<body>
	<div id="app">
		<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<div class="mylogo">
					<a href="adminIndex"><img src="admin/assets/images/logo/logo.png"
						width="180" height="70"></a>
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
							<h3>FAQ Management</h3>
						</div>
					</div>
				</div>
				<section class="section">
					<div class="card">
						<div class="card-body">
							<div class="con_txt">
								<form action="faqwrite" method="post" name="wfrm">
									<div class="contents_sub">
										<!--게시판-->
										<div class="board_write">
											<table>
												<tr>
													<th class="top">Name</th>
													<td class="top" colspan="3"><input type="text"
														name="q_name" value="" class="board_view_input_mail"
														maxlength="5" /></td>
												</tr>
												<tr>
													<th>Subject</th>
													<td colspan="3"><input type="text" name="q_subject"
														value="" class="board_view_input" /></td>
												</tr>
												<tr>
													<th>Password</th>
													<td colspan="3"><input type="password" name="q_pwd"
														value="" class="board_view_input_mail" /></td>
												</tr>
												<tr>
													<th>Content</th>
													<td colspan="3"><textarea name="q_content"
															class="board_editor_area"></textarea></td>
												</tr>
												<tr>
													<th>Email</th>
													<td colspan="3"><input type="text" name="mail1"
														value="" class="board_view_input_mail" /> @ <input
														type="text" name="mail2" value=""
														class="board_view_input_mail" /></td>
												</tr>
											</table>

										</div>
										<input type="hidden">
										<div class="btn_area">
											<div class="align_left">
												<input type="button" value="List" class="btn_list btn_txt02"
													style="cursor: pointer;"
													onclick="location.href='faqmanage'" />
											</div>
											<div class="align_right">
												<input type="submit" id="wbtn" value="Write" class="btn_write btn_txt01"
													style="cursor: pointer;" />
											</div>
										</div>
										<!--//게시판-->
									</div>
								</form>
							</div>
							<!-- 하단 디자인 -->
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