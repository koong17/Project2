package hotel.tikki.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.tikki.member.action.DeleteAction;
import hotel.tikki.member.action.DeleteProAction;
import hotel.tikki.member.action.JoinFormProAction;
import hotel.tikki.member.action.LoginFormAction;
import hotel.tikki.member.action.LoginFormProAction;
import hotel.tikki.member.action.LogoutAction;
import hotel.tikki.member.action.MemberAction;
import hotel.tikki.member.action.UpdateFormAction;
import hotel.tikki.member.action.UpdateFormProAction;
import hotel.tikki.member.action.UpdatePassAction;
import hotel.tikki.member.action.UpdatePassProAction;

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

		MemberAction action = null;
		String nextPage = "";

		if (com.equals("/join.go")) {
			
			nextPage = "memberjsp/join.jsp";
		} else if (com.equals("/joinPro.go")) {
			action = new JoinFormProAction();
			try {
				nextPage = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		} else if (com.equals("/login.go")) {
			action = new LoginFormAction();
			try {
				nextPage = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		} else if (com.equals("/loginPro.go")) {
			action = new LoginFormProAction();
				try {
					nextPage = action.process(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		} else if (com.equals("/index.go")) {
			nextPage = "index.jsp";
			
		} else if (com.equals("/logout.go")) {
			action = new LogoutAction();
			try {
				nextPage = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (com.equals("/update.go")) {
			action = new UpdateFormAction();
			try {
				nextPage = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (com.equals("/updatePro.go")) {
			action = new UpdateFormProAction();
			try {
				nextPage = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (com.equals("/updatePassword.go")) {
			action = new UpdatePassAction();
			try {
				nextPage = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (com.equals("/updatePasswordPro.go")) {
			action = new UpdatePassProAction();
			try {
				nextPage = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (com.equals("/delete.go")) {
			action = new DeleteAction();
			try {
				nextPage = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (com.equals("/deletePro.go")) {
			action = new DeleteProAction();
			try {
				nextPage = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		RequestDispatcher dp = request.getRequestDispatcher(nextPage);
		dp.forward(request, response);
	}
}