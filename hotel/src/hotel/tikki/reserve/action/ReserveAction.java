package hotel.tikki.reserve.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//��û �Ķ���ͷ� ��ɾ�� �����ϴ� �����������̽�
public interface ReserveAction {
	public String process(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
}
