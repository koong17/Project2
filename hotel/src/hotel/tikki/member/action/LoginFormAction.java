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
		if (!referer.contains("joinPro.go")) { // 회원가입 완료 후에는 이전 세션이 아니라 무조건 loginform으로
			session.setAttribute("referer", referer);
		} else {
			session.setAttribute("referer", "index.go");
		}
		
		return "memberjsp/login.jsp";
	} 
	
}
