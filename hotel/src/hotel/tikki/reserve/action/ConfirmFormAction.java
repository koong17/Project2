package hotel.tikki.reserve.action;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConfirmFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String checkIn= request.getParameter("checkIn");
		String checkOut= request.getParameter("checkOut");
		int peopleNum= Integer.parseInt(request.getParameter("peopleNum"));
		String nick= request.getParameter("nick");
		String roomType= request.getParameter("roomType");
		int price= 0;
		
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int checkDate = (int)(sdf.parse(checkOut).getTime()-sdf.parse(checkIn).getTime())/(24*60*60*1000);
		
		
		
		if( roomType.equals("deluxe")) {
			roomType="Deluxe";
			price = 20;
		} else if( roomType.equals("grand")) {
			roomType="Grand Deluxe";
			price = 30;
		} else if( roomType.equals("suite")) {
			roomType="Suite";
			price = 50;
		}
		
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.setAttribute("peopleNum", peopleNum);
		request.setAttribute("nick", nick);
		request.setAttribute("roomType", roomType);
		request.setAttribute("price",price);
		request.setAttribute("checkDate", new Integer(checkDate));
		
		return "/reserve/reserveConfirmForm.jsp";
	}

}
