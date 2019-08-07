package hotel.tikki.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.tikki.member.model.MemberDAO;

public class LoginFormProAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		String id = request.getParameter("email");
		String password = request.getParameter("password");
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.memberLoginCheck(id, password);
		
		if(result == 1) {
			session.setAttribute("id", id);	
			return "/memberjsp/loginPro.jsp";
		} 
		
		return "/memberjsp/login.jsp";
	}

}
