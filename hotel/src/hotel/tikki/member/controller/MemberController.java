package hotel.tikki.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.member.action.JoinFormProAction;
import hotel.tikki.member.action.LoginFormProAction;
import hotel.tikki.member.action.MemberAction;


@WebServlet("*.go")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String com = requestURI.substring(contextPath.length());
		System.out.println(requestURI);
		System.out.println(contextPath);
		System.out.println(com);
		
		MemberAction action = null;
		String nextPage = "";
		
		if(com.equals("/join.go")) { 
			nextPage="memberhtml/join.html";
		} else if (com.equals("/joinPro.go")) {
			action = new JoinFormProAction();
			try {
				action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			nextPage="memberjsp/joinPro.jsp";
		} else if (com.equals("/login.go")) {
			nextPage="memberhtml/login.html";
		} else if (com.equals("/loginPro.go")) {
			action = new LoginFormProAction();
			try {
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		RequestDispatcher dp = request.getRequestDispatcher(nextPage);
		dp.forward(request, response);
	}
}