package hotel.tikki.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListDeleteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		String nickname = request.getParameter("nickname");
		String pageNum = request.getParameter("pageNum");

		request.setAttribute("pageNum", Integer.parseInt(pageNum) );
		request.setAttribute("nickname", nickname);
		
		return "/admin/memberListDeleteForm.jsp" ;
	}

}
