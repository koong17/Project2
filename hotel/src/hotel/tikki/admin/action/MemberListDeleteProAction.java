package hotel.tikki.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.admin.model.AdminDAO;

public class MemberListDeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		AdminDAO  dao = AdminDAO.getInstance();
		String nickname = request.getParameter("nickname");
		String pageNum = request.getParameter("pageNum");
		
		dao.memberListDelete(nickname); 
		
		//저장
		//request.setAttribute("board_num", board_num);
		request.setAttribute("pageNum", pageNum);
		
		return "/admin/memberListDeletePro.jsp" ;
	}

}
