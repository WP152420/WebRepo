/**
 * 
 */
$(function() {
	$("#joinForm").submit(function(event) {
		// submit되는 것을 막기
		event.preventDefault();
		console.log('start');
		// id, pwd 값 가져오기
		var id = $("#id").val(); // document.getElementByid("id").value
		var pwd = $("#pwd").val();
		console.log(id, pwd);

		// 서버로 post 방식 전송 (ajax)
		$.post("http://httpbin.org/post", {
			"id" : id,
			"pwd" : pwd
		}, function(data) {
			// 서버로부터 응답을 받으면
			// alert(data.form.id + '님 로그인되었습니다.');
			var myModal = $('#myModal');
			myModal.modal();
			myModal.find('.modal-body').text(data.form.id + '님 회원가입되었습니다.');
		});
	});
});

function quit() {
	parent.close();
	window.close();
	self.close();
}
