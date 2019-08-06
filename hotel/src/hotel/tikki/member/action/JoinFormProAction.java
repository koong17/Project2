package hotel.tikki.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.member.model.MemberDAO;
import hotel.tikki.member.model.MemberVO;

public class JoinFormProAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberVO vo = new MemberVO();
		
		vo.setId(request.getParameter("email"));
		vo.setPassword(request.getParameter("password"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setPhone(request.getParameter("phone"));
		System.out.println("joinformAction");
		MemberDAO dao = MemberDAO.getInstance();
		dao.memberinsert(vo);
		
		return "/joinPro.jsp";
	}

}
