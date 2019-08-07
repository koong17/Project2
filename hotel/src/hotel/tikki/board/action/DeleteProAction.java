package hotel.tikki.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.board.model.BoardDAO;

public class DeleteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		BoardDAO  dao = BoardDAO.getInstance();
		String board_num = request.getParameter("board_num");
		String pageNum = request.getParameter("pageNum");
		
		dao.delete(Integer.parseInt(board_num)); 
		
		//저장
		//request.setAttribute("board_num", board_num);
		request.setAttribute("pageNum", pageNum);
		
		return "list.do?pageNum="+pageNum ;
	}

}





