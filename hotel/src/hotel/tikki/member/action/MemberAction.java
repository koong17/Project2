package hotel.tikki.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface MemberAction {
	public String process(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
}
