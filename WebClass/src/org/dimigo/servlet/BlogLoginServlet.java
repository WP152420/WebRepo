package org.dimigo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dimigo.vo.UserVO;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class BlogLoginServlet
 */
@WebServlet("/bloglogin")
public class BlogLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BlogLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.printf("id : %s pwd : %s\n", id, pwd);
		boolean result ="test@naver.com".equals(id);
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();

		// Gson Library
		JsonObject json = new JsonObject();

		if (result) {
			HttpSession session = request.getSession();
			UserVO user = new UserVO();
			user.setId(id);
			session.setAttribute("user", user);
			json.addProperty("msg", "success");
		} else {
			json.addProperty("msg", "error");
		}

		System.out.println(json);
		out.write(json.toString());
		out.close();
	}

}
