package hotel.tikki.kakaopay;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		KakaoPay kakaopay = new KakaoPay();
		String redirect_url = kakaopay.payRequest();
		request.setAttribute("pay_url", redirect_url);
		RequestDispatcher dp = request.getRequestDispatcher("/payPro.jsp");
		dp.forward(request, response);
		
	}
	

}
