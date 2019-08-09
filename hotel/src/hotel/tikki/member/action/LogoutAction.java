package hotel.tikki.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String referer = request.getHeader("Referer");
		request.setAttribute("referer", referer);	
		session.invalidate();
		return "memberjsp/logoutPro.jsp";
	}

}
