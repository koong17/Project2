package hotel.tikki.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.member.model.MemberDAO;

public class CodePasswordProAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code = request.getParameter("code");
		String password = request.getParameter("password2");
		String passwordcheck = request.getParameter("password");
		int result = -1;
		
		if(password.equals(passwordcheck)) {
			MemberDAO.getInstance().memberCodePass(password, code);
			result = 1;
		} 
		request.setAttribute("code", code);
		request.setAttribute("result", result);
		return "/memberjsp/codepassPro.jsp";
	}

}
