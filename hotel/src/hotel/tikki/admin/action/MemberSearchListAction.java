package hotel.tikki.admin.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.admin.model.AdminDAO;

public class MemberSearchListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int pageSize =10; //화면에 출력 레코드 수 
		
		request.setCharacterEncoding("utf-8");
		String option= request.getParameter("searchOption");
		String search= request.getParameter("search");

		String pageNum = request.getParameter("pageNum");
		
		if( pageNum == null ) pageNum = "1";
		
		int currentPage = Integer.parseInt(pageNum);  // 1
		int startRow = ((currentPage-1) * pageSize) + 1  ;  // 1
		int endRow = currentPage * pageSize ;  // 7
		int count = 0, number = 0;
		
		
		List list = null;
		AdminDAO  dao = AdminDAO.getInstance();
		count = dao.getSearchListAllCount(search, option) ; //전체 페이지 리턴... 
		
		if( count > 0 ) {
			list =dao.getSearchResult(startRow, endRow, search , option);  //레코드 목록 보기
		} else {
			list = Collections.EMPTY_LIST ;
		}
		
		// 글목록에 표시 할 글번호 
		number = count - (currentPage - 1) * pageSize ;		 // ex) 9
		
		//해당 뷰에서 사용할 속성(저장)
		request.setAttribute("searchOption", option);
		request.setAttribute("search", search);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("list", list);
		
		return "/admin/memberSearchList.jsp";
	}
}
