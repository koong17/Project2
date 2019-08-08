package hotel.tikki.reserve.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.tikki.reserve.model.ReserveDAO;

public class RSBarAction implements ReserveAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		String peopleNum = request.getParameter("peopleNum");
		
		ReserveDAO dao = ReserveDAO.getInstance();
		
		int result = dao.memberLoginCheck(id, password);
		String nick = dao.memberNick(id);
		
		session.setAttribute("id", id);
		session.setAttribute("nick", nick);	
		return "/memberjsp/loginPro.jsp";
		request.setAttribute("result", result);
		
		return "/reservation/login.jsp";
	}

}
