package hotel.tikki.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RsrvListDeleteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String rsrv_num = request.getParameter("rsrv_num");
		String pageNum = request.getParameter("pageNum");

		request.setAttribute("pageNum", Integer.parseInt(pageNum) );
		request.setAttribute("rsrv_num", rsrv_num);
		
		return "/admin/rsrvListDeleteForm.jsp" ;
	}

}
