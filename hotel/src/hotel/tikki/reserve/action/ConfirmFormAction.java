package hotel.tikki.reserve.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConfirmFormAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return "/hotel/reserveConfirmForm.jsp";
	}

}
