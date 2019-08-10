package hotel.tikki.reserve.action;

import java.text.DecimalFormat;
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
		String priceview= "", total="";
		int price= 0;
		int roomNum = 0;
		
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int checkDate = (int)(sdf.parse(checkOut).getTime()-sdf.parse(checkIn).getTime())/(24*60*60*1000);
		
		DecimalFormat df = new DecimalFormat("#,##0");
		
		if( roomType.equals("deluxe")) {
			roomNum=1;
			roomType="Deluxe";
			price=200000;
			
		} else if( roomType.equals("grand")) {
			roomNum=2;
			roomType="Grand Deluxe";
			price=300000;
			
		} else if( roomType.equals("suite")) {
			roomNum=3;
			roomType="Suite";
			price=500000;
		}
		
		priceview = df.format(price);
		total = df.format(price*checkDate);
		
		
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.setAttribute("peopleNum", peopleNum);
		request.setAttribute("nick", nick);
		request.setAttribute("roomType", roomType);
		request.setAttribute("priceview",priceview);
		request.setAttribute("total",total);
		request.setAttribute("price",price);
		request.setAttribute("checkDate", checkDate);
		request.setAttribute("roomNum", roomNum);
		
		return "/reserve/reserveConfirmForm.jsp";
	}

}
