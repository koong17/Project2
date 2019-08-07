package hotel.tikki.board.action;

import java.io.PrintWriter;
import java.util.HashMap;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.json.JSONObject;

import hotel.tikki.board.model.BoardDAO;
 
public class CmntWriteFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        String cmnt_nick = request.getSession().getAttribute("nick").toString();
        int board_num = Integer.parseInt(request.getParameter("board_num"));
        String cmnt_content = request.getParameter("cmnt_content");
        
        HashMap<String, Object> result = null;
        
        try {
            result = BoardDAO.getInstance().insertComment(board_num, cmnt_content, cmnt_nick);
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        JSONObject jsonObj = new JSONObject(result);
        PrintWriter pw = response.getWriter();
        pw.println(jsonObj);
        
        return null;
	}
 
}