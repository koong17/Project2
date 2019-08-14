package hotel.tikki.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.tikki.member.action.KakaoLogin;

@WebServlet("/logout.kakao")
public class MemberKakaoLogoutController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String page = logout(session, request);
		
		RequestDispatcher dp = request.getRequestDispatcher(page);
		dp.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	public String logout(HttpSession session, HttpServletRequest request) {
		KakaoLogin kakaoapi = new KakaoLogin();
	    kakaoapi.kakaoLogout((String)session.getAttribute("access_Token"));
	    
	    session.removeAttribute("access_Token");
	    session.removeAttribute("id");
	    session.removeAttribute("kakaonick");
	    session.removeAttribute("nick"); 
		
	    session.invalidate();
 
	    return "/memberjsp/logoutkakao.jsp";
	}
}
