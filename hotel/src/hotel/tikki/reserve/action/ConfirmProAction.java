package hotel.tikki.reserve.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.reserve.model.ReserveDAO;
import hotel.tikki.reserve.model.ReserveVO;

public class ConfirmProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		request.setCharacterEncoding("UTF-8"); 
		ReserveVO vo = new ReserveVO();
		
		vo.setRoom_num(Integer.parseInt(request.getParameter("roomNum")));
		vo.setCheck_in(request.getParameter("checkIn"));
		vo.setCheck_out(request.getParameter("checkOut"));
		vo.setRsrv_ppl(Integer.parseInt(request.getParameter("peopleNum")));
		vo.setRsrv_nick(request.getParameter("nickname"));
		
		ReserveDAO.getInstance().insert(vo);
		
		request.setAttribute("vo", vo);
		return "index.go";
	}

}
