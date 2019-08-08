package hotel.tikki.reserve.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import hotel.tikki.reserve.model.ReserveDAO;

public class RSBarAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String checkInStr = request.getParameter("checkIn");
		String checkOutStr = request.getParameter("checkOut");
		Date checkIn = (Date) sdf.parse(checkInStr);
		Date checkOut = (Date) sdf.parse(checkOutStr);
		String peopleNum = request.getParameter("peopleNum");
		
		ReserveDAO dao = ReserveDAO.getInstance();
		ArrayList<Integer> roomList = new ArrayList<>();
		
		roomList = dao.select(checkIn, checkOut); 
		
		JSONObject obj = new JSONObject(); 
		obj.put("roomList", roomList); 
		
		PrintWriter out= response.getWriter(); 
		out.println(obj); 
		out.flush();
		
		return null;
	}

}
