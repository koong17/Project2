package hotel.tikki.kakaopay;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.admin.model.AdminDAO;
import hotel.tikki.reserve.model.ReserveDAO;

@WebServlet("/cancelpay")
public class KakaopayCancelController  extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int rsrv_num = Integer.parseInt(request.getParameter("rsrv_num"));
		
		ReserveDAO.getInstance().delete(rsrv_num);
		
		RequestDispatcher rd = request.getRequestDispatcher("/kakaopay/cancel.jsp");
		rd.forward(request, response);
	}
	
}
