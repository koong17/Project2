package hotel.tikki.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements CommandAction{

	@Override
	public String process(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("pageNum", pageNum);
		
		return "/board/boardWriteForm.jsp" ;
	}

}