package hotel.tikki.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.tikki.member.model.MemberDAO;
import hotel.tikki.member.model.MemberVO;

public class CodeProAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code = request.getParameter("code");
		
		int result = MemberDAO.getInstance().memberCodeCheck(code);
		
		request.setAttribute("result", result);
		request.setAttribute("code", code);
		
		return "/memberjsp/codePro.jsp";
	}

}
