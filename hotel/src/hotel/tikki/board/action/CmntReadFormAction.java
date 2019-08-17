package hotel.tikki.board.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import hotel.tikki.board.action.CommandAction;
import hotel.tikki.board.comments.model.CommentsVO;
import hotel.tikki.board.model.BoardDAO;

public class CmntReadFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");        // JSON 한글 깨짐 해결
        
        // String pageNum = request.getParameter("pageNum");
        int board_num = Integer.parseInt(request.getParameter("board_num"));
        ArrayList<CommentsVO> comments = null;
        
        try {
            comments = BoardDAO.getInstance().selectComments(board_num);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        JSONArray jsonArr = new JSONArray(comments);        // 스프링에선 어노테이션(?)
        PrintWriter pw = response.getWriter();
        pw.println(jsonArr);
		return null;
	}

}
