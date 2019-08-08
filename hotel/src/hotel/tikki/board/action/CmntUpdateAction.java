package hotel.tikki.board.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import hotel.tikki.board.comments.model.CommentsVO;
import hotel.tikki.board.model.BoardDAO;
 
public class CmntUpdateAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        int cmnt_num = Integer.parseInt(request.getParameter("cmnt_num"));
        int board_num = Integer.parseInt(request.getParameter("board_num"));
        String cmnt_content = request.getParameter("cmnt_content");
        System.out.println("cmnt_num : "+cmnt_num+", board_num : "+board_num+", cmnt_content : "+cmnt_content);
        BoardDAO.getInstance().updateComment(cmnt_num, board_num, cmnt_content);
        
        ArrayList<CommentsVO> comments = null;
        
        comments = BoardDAO.getInstance().selectComments(board_num);
        for(CommentsVO vo : comments) {
        	System.out.println(vo);
        }
        
        JSONArray jsonArr = new JSONArray(comments);        // 스프링에선 애노테이션(?)
        PrintWriter pw = response.getWriter();
        pw.println(jsonArr);
        
        return null;
	}
 
}
