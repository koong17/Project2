package hotel.tikki.reserve.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.reserve.model.ReserveDAO;

public class RealMypageAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String nickname = request.getParameter("nickname");
		List list = null;
		ReserveDAO  dao = ReserveDAO.getInstance();
		int count = dao.getListAllCount(); 
		
		if( count > 0 ) {
			list = dao.getSelectAll(nickname);  //레코드 목록 보기
		} else {
			list = Collections.EMPTY_LIST ;
		}
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		return "/reserve/mypage.jsp";
	}

}
