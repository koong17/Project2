package hotel.tikki.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.board.model.*;

public class UpdateProAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");   // 업데이트시 한글 깨짐처리 
		
		String pageNum = request.getParameter("pageNum");
		BoardVO vo = new BoardVO();
		
		vo.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		vo.setBoard_title(request.getParameter("board_title"));
		vo.setBoard_content(request.getParameter("board_content"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.update(vo);  //실제 변경 내용 반영 함수 호출
		
		request.setAttribute("pageNum", pageNum);
			
		return "/board/boardUpdatePro.jsp";
	}

}
