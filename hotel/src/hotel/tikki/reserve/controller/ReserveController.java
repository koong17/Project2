package hotel.tikki.reserve.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.board.action.CommandAction;

public class ReserveController extends HttpServlet {

	private Map commandMap = new HashMap();
	
	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
			doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
			doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {			
		String view = null;
		CommandAction  action = null;
		
		try {
			String command = request.getRequestURI();
			System.out.println("command : " + command );	// command : /web06_boardMVC/writeForm.do		
			System.out.println("request.getContextPath() : " + request.getContextPath());   //   /web06_boardMVC
			
			if( command.indexOf(request.getContextPath()) == 0 ) {  // 경로가 없다면,...
				command = command.substring(request.getContextPath().length() + 1);  //  /web06_boardMVC
				System.out.println("if command : " + command);
			} // if end
			
			action = (CommandAction)commandMap.get(command);
			System.out.println("action : " + action);  // action : edu.kosta.boardAction.WriteFormAction
			view = action.process(request, response); 
			System.out.println("view : " + view);   //   /board/writeForm.jsp
			
		} catch (Exception e) {
			e.printStackTrace();
		} // try end
		
		RequestDispatcher  dp = request.getRequestDispatcher(view);
		if(view != null) dp.forward(request, response);
	}
}
