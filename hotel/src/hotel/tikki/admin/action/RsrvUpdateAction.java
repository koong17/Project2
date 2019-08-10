package hotel.tikki.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.admin.model.AdminDAO;
import hotel.tikki.admin.model.RsrvVO;

public class RsrvUpdateAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int rsrv_num = Integer.parseInt(request.getParameter("rsrv_num"));
		String rsrv_status_input = request.getParameter("rsrv_status");
		
		AdminDAO.getInstance().update(rsrv_num, rsrv_status_input);
		
		request.setAttribute("pageNum", request.getParameter("pageNum"));
		
		return "/admin/rsrvUpdate.jsp";
	}

}
