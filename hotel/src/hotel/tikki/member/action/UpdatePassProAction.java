package hotel.tikki.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.tikki.member.model.MemberDAO;
import hotel.tikki.member.model.MemberVO;

public class UpdatePassProAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberVO vo = new MemberVO();
		String id = request.getParameter("email");
		String password = request.getParameter("password"); 
		
		MemberDAO dao = MemberDAO.getInstance();
		
		int result = dao.memberLoginCheck(id, password); 
		
		request.setAttribute("result", result);
		if(result == 1) {
			vo.setId(id);
			vo.setPassword(request.getParameter("password2"));
			dao.memberUpdatePass(vo);
			return "/memberjsp/updatePasswordPro.jsp";
		} 
		
		return "memberjsp/updatePassword.jsp";
	}

}
