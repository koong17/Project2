package hotel.tikki.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.tikki.member.model.MemberDAO;
import hotel.tikki.member.model.MemberVO;

public class FindPwdAction implements MemberAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO vo = new MemberVO();
		
		String keyCode = MemberDAO.createKey();
		String subject = "[TIKKI] 비밀번호 찾기 인증코드 안내";
		String msg = "임시 비밀번호는 " + keyCode + " 입니다.";
		String email = request.getParameter("email");
		
		vo.setId(email);
		vo.setPassword(keyCode);
		
		
		MemberDAO dao = MemberDAO.getInstance();
		dao.memberUpdatePass(vo);

		session.setAttribute("keyCode", keyCode);
		MemberDAO.sendMail(email, subject, msg);
		
		return "memberjsp/login.jsp";
	}

}
