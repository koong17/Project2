package hotel.tikki.reserve.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.reserve.action.CommandAction;

public class ReserveController extends HttpServlet {
	
	private Map commandMap = new HashMap();

	// �ʱ�ȭ - 1ȸ ȣ���
	// ���ɾ�� ���ɾ� ó�� Ŭ������ ���εǾ� �ִ� properties  ������ �о� ���̴� ����
	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("ReserveConfig");
		Properties pr = new Properties();
		FileInputStream  f = null;
		
		try {
			// commandBoard.properties ������ ������ �о��
			f = new FileInputStream(props);
			//commandBoard.properties ������ ������ Properties ��ü�� ����
			pr.load(f);	 // key=value
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( f != null ) try{ f.close(); }catch(Exception e) { e.printStackTrace(); }
		} //end try
		
		Iterator  key = pr.keySet().iterator();  // key �� ����
		
		while( key.hasNext() ) {
			String command = (String)key.next();
			String value = pr.getProperty(command);  // value  -  edu.kosta.boardAction.WriteFormAction
			
			try {
				Class className = Class.forName(value);  // forName() ���ڿ��� Ŭ������ ��ȯ.
				// Ŭ������ ��ȯ���ױ� ������ ��ü ������.
				Object instance = className.newInstance(); 
				 
				commandMap.put(command, instance);   // put(key, value)
				System.out.println("command : "+command+" instance : "+instance);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} // end while
		
	} // end init(~~~) 

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
			System.out.println("command : " + command );	// command : /hotel/reservation.to	
			System.out.println("request.getContextPath() : " + request.getContextPath());   //   /hotel
			
			if( command.indexOf(request.getContextPath()) == 0 ) {  // ��ΰ� ���ٸ�,...
				command = command.substring(request.getContextPath().length() + 1);  //  reservation.to	
				System.out.println("if command : " + command);
			} // if end
			
			action = (CommandAction)commandMap.get(command);
			System.out.println("action : " + action);  // action : edu.kosta.boardAction.WriteFormAction
			view = action.process(request, response); 
			System.out.println("view : " + view);   //   /board/writeForm.jsp
			
		} catch (Exception e) {
			e.printStackTrace();
		} // try end
		// request.setAttribute("CONTENT", view);
				
		RequestDispatcher  dp = request.getRequestDispatcher(view);
		
		dp.forward(request, response); // �������� if������ null ó���ϱ�
	}
	
}

