package hotel.tikki.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.tikki.member.action.KakaoLogin;

@WebServlet("/oauth")
public class MemberKakaoController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String code = request.getParameter("code");
		HttpSession session = request.getSession();
		String page = login(request, response, code, session);
		
		RequestDispatcher dp = request.getRequestDispatcher(page);
		dp.forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	public String login(HttpServletRequest request, HttpServletResponse response, String code, HttpSession session) {
		KakaoLogin kakaoapi = new KakaoLogin();
		String access_Token = kakaoapi.getAccessToken(code);
		System.out.println(access_Token);
		HashMap<String, Object> userInfo = kakaoapi.getUserInfo(access_Token);
		
		System.out.println("login Controller : " + userInfo);
		    
		    if (userInfo.get("nickname") != null) {
		    	session.setAttribute("kakaonick", userInfo.get("nickname"));
		        session.setAttribute("nick", userInfo.get("nickname"));
		        session.setAttribute("id", userInfo.get("nickname"));
		        session.setAttribute("access_Token", access_Token);
		    }
		return "/memberjsp/loginkakao.jsp";
	}
	
}
