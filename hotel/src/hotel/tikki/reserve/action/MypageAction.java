package hotel.tikki.reserve.action;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel.tikki.reserve.model.ReserveDAO;
import hotel.tikki.reserve.model.ReserveVO;


public class MypageAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8"); 
		ReserveVO vo = new ReserveVO();
		
		String nickname = request.getParameter("nickname");
		String roomNum = request.getParameter("roomNum");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		int peopleNum = Integer.parseInt(request.getParameter("peopleNum"));
		
		if( roomNum != null) {
			vo.setRoom_num(Integer.parseInt(roomNum));
			vo.setRsrv_ppl(peopleNum);
			vo.setCheck_in(checkIn);
			vo.setCheck_out(checkOut);
			vo.setRsrv_nick(nickname);
			
			vo.setRsrv_num(ReserveDAO.getInstance().insert(vo));
		}
		
		return "reserve/reserveMypage.jsp";

	}

}