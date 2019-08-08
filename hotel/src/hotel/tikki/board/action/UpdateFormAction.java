package hotel.tikki.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.board.model.*;

public class UpdateFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		//request.setCharacterEncoding("UTF-8");
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String pageNum = request.getParameter("pageNum");

		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.update(board_num); 

		request.setAttribute("pageNum", Integer.parseInt(pageNum) );
		request.setAttribute("vo",  vo);
		
		return "/board/boardUpdateForm.jsp" ;
	}

}

