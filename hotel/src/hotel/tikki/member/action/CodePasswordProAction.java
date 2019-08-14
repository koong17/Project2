package hotel.tikki.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.member.model.MemberDAO;

public class CodePasswordProAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code = request.getParameter("code");
		String password = request.getParameter("password2");
		
		MemberDAO.getInstance().memberCodePass(password, code);
		return "/memberjsp/codepassPro.jsp";
	}

}
