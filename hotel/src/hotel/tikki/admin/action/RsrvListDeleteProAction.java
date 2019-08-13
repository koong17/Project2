package hotel.tikki.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.admin.model.AdminDAO;

public class RsrvListDeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");

		AdminDAO  dao = AdminDAO.getInstance();
		String rsrv_num = request.getParameter("rsrv_num");
		String pageNum = request.getParameter("pageNum");
		
		dao.rsrvListDelete(Integer.parseInt(rsrv_num)); 
		
		//저장
		//request.setAttribute("board_num", board_num);
		request.setAttribute("pageNum", pageNum);
		
		return "/admin/rsrvListDeletePro.jsp" ;
	}

}
