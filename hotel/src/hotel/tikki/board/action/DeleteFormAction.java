package hotel.tikki.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.board.model.*;

public class DeleteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		//request.setCharacterEncoding("UTF-8");
		
		String board_num = request.getParameter("board_num");
		String pageNum = request.getParameter("pageNum");

		request.setAttribute("pageNum", Integer.parseInt(pageNum) );
		request.setAttribute("board_num", board_num);
		
		return "/board/boardDeleteForm.jsp" ;
	}

}

