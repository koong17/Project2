package hotel.tikki.member.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFormAction implements MemberAction{

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String referer = request.getHeader("Referer");
		System.out.println(referer + " ============================");
		if (!referer.contains("joinPro.go")) { 
			session.setAttribute("referer", referer);
	
		} else if (!referer.contains(".admin")) { 
			session.setAttribute("referer", referer);
		} else if (!referer.contains(".findpwd.go")) { 
			session.setAttribute("referer", referer);
		} else {
			session.setAttribute("referer", "index.go");
		}
		
		return "memberjsp/login.jsp";
	} 
	
}
