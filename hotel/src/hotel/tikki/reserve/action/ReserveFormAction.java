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
		 
		 
		
		
		/*
		 * String checkIn = request.getParameter("checkIn"); String checkOut =
		 * request.getParameter("checkOut");
		 */
		 
		 

		String peopleNum = request.getParameter("peopleNum");
		
		ReserveDAO dao = ReserveDAO.getInstance();
		ArrayList<Integer> roomList = new ArrayList<>();
		
		roomList = dao.select(checkIn, checkOut);
		
		JSONArray jsonArr = new JSONArray(roomList);
        PrintWriter pw = response.getWriter();
        pw.println(jsonArr);
		/*
		 * request.setAttribute("checkIn", checkIn); request.setAttribute("checkOut",
		 * checkOut);
		 * 
		 * return "/hotel/reserve.to";
		 */
        return null;
	}

}
