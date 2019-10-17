package hotel.tikki.kakaopay;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;

import hotel.tikki.reserve.model.ReserveDAO;
import hotel.tikki.reserve.model.ReserveVO;

@WebServlet("/pay")
public class KakaopayController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		JsonElement je = KakaoPay.payRequest();
		
		String nickname = request.getParameter("nickname");
		String roomNum = request.getParameter("roomNum");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		int peopleNum = Integer.parseInt(request.getParameter("peopleNum"));
		String roomType = request.getParameter("roomType");
		int priceview = Integer.parseInt(request.getParameter("priceview").replace(",", ""));
		
		ReserveVO vo = new ReserveVO();
		
		vo.setRoom_num(Integer.parseInt(roomNum));
		vo.setCheck_in(checkIn);
		vo.setCheck_out(checkOut);
		vo.setRsrv_ppl(peopleNum);
		vo.setRsrv_nick(nickname);
		vo.setRsrv_num(ReserveDAO.getInstance().insert(vo));
		
		JsonElement je = KakaoPay.payRequest(roomType, priceview, vo.getRsrv_num());
		
		PrintWriter pw = response.getWriter();
	    pw.println(je);
	}
	

}
