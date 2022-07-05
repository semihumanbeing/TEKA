package action.card;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.card.AllListAction.ViewVoComp;
import dao.CardDao;
import vo.ViewVo;

/**
*  Servlet implementation class CardSearchAction
*/

@WebServlet("/card/cardSearch.do")
public class CardSearchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		AllListAction all = new AllListAction();
		
		//요청 url : /card/cardSearch.do?selectSearch=all&text=
		//           /card/cardSearch.do?selectSearch=c_title&text=길동
		request.setCharacterEncoding("utf-8");
		
		String selectSearch = request.getParameter("selectSearch");
		String text = request.getParameter("text");      
		
		//selectSearch가 null / 비어있으면 검색필터 = 전체
		if(selectSearch==null || selectSearch.isEmpty()) {
			selectSearch = "all";
		}
		
		List<ViewVo> searchList = null;
		
		Map map = new HashMap();
		
		//전체검색이 아닌 경우 검색조건
		if(!selectSearch.equals("all")) {
			
			if(selectSearch.equals("c_title")) {
				
				map.put("c_title", text);	
			
			}else if(selectSearch.equals("c_content")) {
				
				map.put("c_content", text);
			
			}else if(selectSearch.equals("m_nickname")) {
				
				map.put("m_nickname", text);	
			}
		}else {
			
			//전체카드 조회
			searchList = CardDao.getInstance().selectList();
		}
		
		searchList = CardDao.getInstance().cardCondition(map);
		
		request.setAttribute("list", searchList);
		
		String forward_page = "mainList.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}
}