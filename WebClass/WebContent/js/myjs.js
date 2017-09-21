/**
 * 
 */
$(document)
		.ready(
				function() {
					$("#loginForm")
							.submit(
									function(event) {
										// submit되는 것을 막기
										event.preventDefault();
										console.log('start');
										// id, pwd 값 가져오기
										var id = $("#id").val(); // document.getElementByid("id").value
										var pwd = $("#pwd").val();
										console.log(id, pwd);

										// 서버로 post 방식 전송 (ajax)
										$
												.post(
														"http://httpbin.org/post",
														{
															"id" : id,
															"pwd" : pwd
														},
														function(data) {
															// 서버로부터 응답을 받으면
															// alert(data.form.id
															// + '님 로그인되었습니다.');
															var myModal = $('#myModal');
															myModal.modal();
															myModal
																	.find(
																			'.modal-body')
																	.text(
																			data.form.id
																					+ '님 로그인되었습니다.');
															document
																	.getElementById('ppap').innerHTML = '<div style="color:white">'
																	+ id
																	+ '님</div>';
															console.log('asdf');
														})
									});
				});
function menu_over(e) {
	e.setAttribute("class", "nav-item active");
}
function menu_out(e) {
	e.setAttribute("class", "nav-item");
}
function pop(a, w, h) {
	var popUrl = a;
	var popOption = "width=" + w + ", height=" + h
			+ ", resizable=no, scrollbars=no, status=no;";
	window.open(popUrl, "", popOption);
}