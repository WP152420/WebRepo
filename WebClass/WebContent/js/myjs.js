/**
 * 
 */
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