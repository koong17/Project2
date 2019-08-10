package hotel.tikki.reserve.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.reserve.model.ReserveDAO;
import hotel.tikki.reserve.model.ReserveVO;


public class MypageAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		request.setCharacterEncoding("UTF-8"); 
		ReserveVO vo = new ReserveVO();
		String nickname = request.getParameter("nickname");
		String roomNum = request.getParameter("roomNum");
		if(roomNum != null) {
			vo.setRoom_num(Integer.parseInt(roomNum));
			vo.setCheck_in(request.getParameter("checkIn"));
			vo.setCheck_out(request.getParameter("checkOut"));
			vo.setRsrv_ppl(Integer.parseInt(request.getParameter("peopleNum")));
			vo.setRsrv_nick(nickname);
			
			vo.setRsrv_num(ReserveDAO.getInstance().insert(vo));
		}
		
		int count = 0;
		
		List list = null;
		ReserveDAO  dao = ReserveDAO.getInstance();
		count = dao.getListAllCount(); 
		
		if( count > 0 ) {
			list = dao.getSelectAll(nickname);  //레코드 목록 보기
		} else {
			list = Collections.EMPTY_LIST ;
		}
		
		request.setAttribute("list", list);
		return "reserve/mypage.jsp";
	}

}