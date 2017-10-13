<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.dimigo.vo.UserVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>2420 이유진</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link href="../css/album.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.min.js"></script>
<script src="../js/myjs.js"></script>
<link rel="stylesheet" type="text/css" href="../css/mystyle.css">

</head>
<body>
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">홈</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item" onmouseover="menu_over(this)"
					onmouseout="menu_out(this)"><a class="nav-link"
					href="cowdog1.html">취미 <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item" onmouseover="menu_over(this)"
					onmouseout="menu_out(this)"><a class="nav-link"
					href="cowdog2.html">좋아하는 것</a></li>
				<li class="nav-item" onmouseover="menu_over(this)"
					onmouseout="menu_out(this)"><a class="nav-link"
					href="cowdog3.html">나</a></li>
			</ul>

			<div id="ppap">
				<%
					UserVO user = (UserVO) session.getAttribute("user");
					if (user == null) {
				%>
				<form class="form-inline my-2 my-lg-0" id="loginForm">
					<input class="form-control mr-sm-2" type="text" placeholder="ID"
						aria-label="ID" id="id" size="15" required> <input
						class="form-control mr-sm-2" type="password"
						placeholder="PASSWORD" aria-label="PASSWORD" id="pwd" size="15"
						required>
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">login</button>
					<button class="btn btn-outline-success my-2 my-sm-0"
						onclick="pop('join.html',370,200);">join</button>
				</form>
				<%
					} else {
				%>
				<div style="color: white; display: inline-block"><%=user.getName()%>님
				</div>
				<form action="/WebClass/bloglogout" method="post"
					style="display: inline-block" id="logoutForm">
					<button type="submit" class="btn btn-outline-success my-2 my-sm-0">로그아웃</button>
				</form>
				<%
					}
				%>
			</div>

		</div>

	</nav>
	<section class="jumbotron text-center">
		<div class="container">
			<h1 class="jumbotron-heading">2420 이유진</h1>
			<p class="lead text-muted">로그인하고 회원가입은 첫화면에서만 되고 유지가 안돼요 ㅠㅠ 미안!</p>
		</div>
	</section>

	<div class="album text-muted">
		<div class="container">

			<div class="row">
				<div class="card">
					<a href="cowdog1.html"><img class="img-responsive"
						src="../image/justhis.jpg" alt="그러하다" width="300" height="300"></a>
					<p class="card-text">취미</p>
				</div>
				<div class="card">
					<a href="cowdog2.html"><img src="../image/ss.jpg"
						class="img-respnsive" alt="그러한가" width="300" height="300"></a>
					<p class="card-text">좋아하는 것</p>
				</div>
				<div class="card">
					<a href="cowdog3.html"><img src="../image/aa.jpg" alt="그러하였다"
						width="300" height="300"></a>
					<p class="card-text">꿈</p>
				</div>
			</div>

		</div>
	</div>

	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
				<a href="#" class="comfort">위로는 영어로 comfort</a>
			</p>
			<p>집에 가고 싶다</p>
			<p>그러하다</p>
		</div>
	</footer>
	<!-- 모달 창 -->
	<div class="modal" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">로그인 결과</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("#loginForm").submit(function(event) {
				event.preventDefault();
				console.log('start');
				var id = $("#id").val();
				var pwd = $("#pwd").val();
				console.log(id, pwd);
				$.post("/WebClass/bloglogin", {
					"id" : id,
					"pwd" : pwd
				}, function(data) {
					if (data.msg == 'success') {
						location.href = "myblog.jsp";

					} else {
						var myModal = $('#myModal');
						myModal.modal();
						myModal.find('.modal-body').text('로그인에 실패하였습니다.');
						$('#pwd').val('');
					}
				});
			});
			$("#logoutForm").submit(function(event) {
				event.preventDefault();
				$.post("/WebClass/bloglogout", {}, function(data) {
					location.href = "myblog.jsp";
				});
			});
		});
	</script>
</body>
</html>