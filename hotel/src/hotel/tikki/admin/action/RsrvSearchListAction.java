package hotel.tikki.admin.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotel.tikki.admin.model.AdminDAO;

public class RsrvSearchListAction implements CommandAction {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		int pageSize =10;
		
		request.setCharacterEncoding("utf-8");
		String option= request.getParameter("rsrvOption");
		String search= request.getParameter("search");
		System.out.println("search : "+search);
		String pageNum = request.getParameter("pageNum");
		
		if( pageNum == null ) pageNum = "1";
		
		int currentPage = Integer.parseInt(pageNum);  // 1
		int startRow = ((currentPage-1) * pageSize) + 1  ;  // 1
		int endRow = currentPage * pageSize ;  // 7
		int count = 0, number = 0;
		
		
		List list = null;
		AdminDAO  dao = AdminDAO.getInstance();
		count = dao.getRsrvSearchListAllCount(search, option) ; //검색한 결과의 총개수를 구하고 10개씩 보여준다.
		
		if( count > 0 ) {
			list =dao.getRsrvSearchResult(startRow, endRow, search , option);  //검색결과보기
		} else {
			list = Collections.EMPTY_LIST ;
		}
		
		// 글목록에 표시 할 글번호 
		number = count - (currentPage - 1) * pageSize ;		 // ex) 9
		
		//해당 뷰에서 사용할 속성(저장)
		request.setAttribute("rsrvOption", option);
		request.setAttribute("search", search);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("list", list);
				
	
		return "/admin/rsrvSearchList.jsp";
	}

}
