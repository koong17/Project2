package hotel.tikki.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.tikki.member.model.MemberDAO;
import hotel.tikki.member.model.MemberVO;

public class UpdateFormProAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();
		String sessionNick = request.getParameter("sessionNick");
		
		vo.setId(request.getParameter("email"));
		vo.setNickname(request.getParameter("nickname")); // 바꿀 닉네임 
		vo.setPhone(request.getParameter("phone"));
	
		MemberDAO dao = MemberDAO.getInstance();
		dao.memberUpdate(vo, sessionNick);
		
		String nick = vo.getNickname();
		session.setAttribute("nick", nick);
		return "/memberjsp/updatePro.jsp";
	}
}
