package hotel.tikki.member.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFormAction implements MemberAction{

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String referer = request.getHeader("Referer");
		if (referer.contains("Pro.go")|| referer.contains(".admin") || referer.contains("find")) { 
			session.setAttribute("referer", "index.go");
		} else {
			session.setAttribute("referer", referer);
		}
		return "memberjsp/login.jsp";
	} 
	
}
