package hotel.tikki.reserve.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReserveAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String daterange = request.getParameter("daterange");
		String peopleNum = request.getParameter("peopleNum");
		
		
		if( daterange != null ) {
			request.setAttribute("daterange", daterange);
			request.setAttribute("peopleNum", peopleNum);
			
		}
		
		return "reserve/reserveForm.jsp";
	}

}
