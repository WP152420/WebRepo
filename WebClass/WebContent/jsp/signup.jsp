<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SignUp</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link rel="stylesheet" href="/WebClass/css/signin.css">
</head>
<body>
	<div class="container">

		<form id="signupForm" class="form-signin" action="" method="post">
			<h2 class="form-signin-heading">Please sign up</h2>

			<label for="inputEmail" class="sr-only">Email address</label> <input
				type="email" name="id" id="inputEmail" class="form-control"
				placeholder="Email address" required autofocus>
			<label for="inputPassword" class="sr-only">Password</label> <input
				type="password" name="pwd" id="inputPassword" class="form-control"
				placeholder="Password" required> <label
				for="inputName" class="sr-only">Name</label> <input type="text"
				name="name" id="inputName" class="form-control" placeholder="Name" required> <label
				for="inputNickName" class="sr-only">Nick Name</label> <input
				type="text" name="nickname" id="inputNickName" class="form-control"
				placeholder="Nickname" required>
			<br>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
				up</button>
		</form>
	</div>

	<%-- include file="modal.jsp"--%>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>



	<div class="modal" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Sign Up Error</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>회원 가입 시 오류가 발생하였습니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<script> 
		$(document).ready(function() {
			$("#signupForm").submit(function(event) {
				event.preventDefault();
				console.log('start');
				var id = $("#inputEmail").val();
				var pwd = $("#inputPassword").val();

				var name = $("#inputName").val();
				var nickname = $("#inputNickName").val();
				console.log(id, pwd);
				$.post("/WebClass/signup", 
					{
						"id" : id,
						"pwd" : pwd,
						"name" : name,
						"nickname" : nickname
					}, function(data) {
						if(data.msg == 'success') {
							location.href = "login.jsp";
						} else {	
							var myModal = $('#myModal');
							myModal.modal();
							myModal.find('.modal-body').text('Signup에 실패하였습니다.' );
						}
					}
				);
			});
		});
	</script>


</body>
</html>