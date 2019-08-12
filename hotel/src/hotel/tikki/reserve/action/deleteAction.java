package hotel.tikki.reserve.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.reserve.model.ReserveDAO;


public class deleteAction implements CommandAction{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int rsrv_num = Integer.parseInt(request.getParameter("rsrv_num"));
		
		ReserveDAO.getInstance().delete(rsrv_num);
		
		return "/reserve/reserveDelete.jsp";
	}
}
