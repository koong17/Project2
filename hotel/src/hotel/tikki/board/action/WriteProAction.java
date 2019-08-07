package hotel.tikki.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.board.model.*;


public class WriteProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		BoardVO vo = new BoardVO();
		vo.setBoard_nick(request.getParameter("board_nick"));
		vo.setBoard_title(request.getParameter("board_title"));
		vo.setBoard_content(request.getParameter("board_content"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.insert(vo);
		
		return "/board/boardWritePro.jsp";
	}

}
