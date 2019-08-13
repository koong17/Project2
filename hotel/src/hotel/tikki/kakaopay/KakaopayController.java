package hotel.tikki.kakaopay;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;

@WebServlet("/pay")
public class KakaopayController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String nickname = request.getParameter("nickname");
		String roomNum = request.getParameter("roomNum");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		int peopleNum = Integer.parseInt(request.getParameter("peopleNum"));
		String roomType = request.getParameter("roomType");
		int priceView = Integer.parseInt(request.getParameter("priceView"));
		
		JsonElement je = KakaoPay.payRequest(roomType, priceView);
		
		PrintWriter pw = response.getWriter();
	    pw.println(je);
	}
	

}
