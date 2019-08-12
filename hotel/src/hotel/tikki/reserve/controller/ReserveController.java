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

	// 珥덇린�솕 - 1�쉶 �샇異쒕맖
	// 紐낅졊�뼱�� 紐낅졊�뼱 泥섎━ �겢�옒�뒪媛� 留ㅽ븨�릺�뼱 �엳�뒗 properties  �뙆�씪�쓣 �씫�뼱 �뱾�씠�뒗 �뿭�븷
	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("ReserveConfig");
		Properties pr = new Properties();
		FileInputStream  f = null;
		
		try {
			// commandBoard.properties �뙆�씪�쓽 �궡�슜�쓣 �씫�뼱�샂
			f = new FileInputStream(props);
			//commandBoard.properties �뙆�씪�쓽 �젙蹂대�� Properties 媛앹껜�뿉 ���옣
			pr.load(f);	 // key=value
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( f != null ) try{ f.close(); }catch(Exception e) { e.printStackTrace(); }
		} //end try
		
		Iterator  key = pr.keySet().iterator();  // key 媛� 異붿텧
		
		while( key.hasNext() ) {
			String command = (String)key.next();
			String value = pr.getProperty(command);  // value  -  edu.kosta.boardAction.WriteFormAction
			
			try {
				Class className = Class.forName(value);  // forName() 臾몄옄�뿴�쓣 �겢�옒�뒪濡� 蹂��솚.
				// �겢�옒�뒪濡� 蹂��솚�떆耳곌린 �븣臾몄뿉 媛앹껜 �깮�꽦�븿.
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
			System.out.println("command : " + command );	// command : /web06_boardMVC/writeForm.do		
			System.out.println("request.getContextPath() : " + request.getContextPath());   //   /web06_boardMVC
			
			if( command.indexOf(request.getContextPath()) == 0 ) {  // 寃쎈줈媛� �뾾�떎硫�,...
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
		
		// request.setAttribute("CONTENT", view);
				
		RequestDispatcher  dp = request.getRequestDispatcher(view);

		if(view != null) dp.forward(request, response);

	}
	
}
