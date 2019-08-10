package hotel.tikki.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.tikki.member.model.MemberDAO;
import hotel.tikki.member.model.MemberVO;

public class DeleteProAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberVO vo = new MemberVO();
		String id = request.getParameter("email");
		String password = request.getParameter("password"); // 현재 비밀번호
		
		MemberDAO dao = MemberDAO.getInstance();
		
		int result = dao.memberLoginCheck(id, password); // 현재 비밀번호 일치 시 값 1 리턴
		request.setAttribute("result", result);
		if(result == 1) {
			dao.memberDelete(id);
			return "/memberjsp/deletePro.jsp";
		} 
		
		return "memberjsp/delete.jsp";
	}

}
