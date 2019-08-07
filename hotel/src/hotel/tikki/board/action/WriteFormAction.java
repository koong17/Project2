package hotel.tikki.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//세션에서 닉네임 받아오기
		request.setAttribute("board_nick", request.getAttribute("nick"));
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("pageNum", pageNum);
		
		return "/board/boardWriteForm.jsp" ;
	}

}