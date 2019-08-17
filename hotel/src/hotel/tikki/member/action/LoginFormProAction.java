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
		String nick = dao.memberNick(id);
		
		if(result == 1) {  // result가 1이면 성공
			session.setAttribute("id", id);
			session.setAttribute("nick", nick);	
		} 
		
		request.setAttribute("result", result);
		return "/memberjsp/loginPro.jsp";
	}

}
