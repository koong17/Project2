package hotel.tikki.reserve.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import hotel.tikki.reserve.model.ReserveDAO;

public class ReserveFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
	    String daterange = request.getParameter("daterange"); 
	    String checkIn = daterange.substring(0, 10); 
	    String checkOut = daterange.substring(13, 23);

		int peopleNum = Integer.parseInt(request.getParameter("peopleNum"));
		
		ReserveDAO dao = ReserveDAO.getInstance();
		ArrayList<Integer> roomList = new ArrayList<>();
		
		roomList = dao.select(checkIn, checkOut, peopleNum);
		
		JSONArray jsonArr = new JSONArray(roomList);
        PrintWriter pw = response.getWriter();
        pw.println(jsonArr);
        
        System.out.println(peopleNum);
        System.out.println(jsonArr);
        return null;
	}

}
