package hotel.tikki.reserve.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAction {
	// ��û �Ķ���ͷ� ��ɾ�� �����ϴ� �����������̽�
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
