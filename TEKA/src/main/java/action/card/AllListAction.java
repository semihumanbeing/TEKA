package action.card;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CardDao;
import vo.ViewVo;

/**
 * Servlet implementation class AllListAction
 */
@WebServlet("/card/list.do")
public class AllListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//url 종류
		// http://localhost:9090/TEKA/card/list.do
		// http://localhost:9090/TEKA/card/list.do?subject=
		
		String subject = request.getParameter("subject");
		
		
		if(subject != null && !subject.isEmpty()) {//특정 주제를 원하는 경우에는 특정 주제에 부합하는 내용만을 읽어오기
			
			switch(subject) {
			case "os":
				subject = "운영체제";
				break;
			case "network":
				subject = "네트워크";
				break;
			case "algorithm":
				subject = "알고리즘";
				break;
			case "datastructure":
				subject = "자료구조";
				break;
			case "java":
				subject = "자바";
				break;
			case "spring":
				subject = "스프링";
				break;
			}
			
			List<ViewVo> list = CardDao.getInstance().selectBySubject(subject);
			
			request.setAttribute("list", list);
			request.setAttribute("subject", subject);
			
			//forward
			String forward_page = "list.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);
			
		}else { //주제가 없으면 전체 리스트 보기
			
			List<ViewVo> list = CardDao.getInstance().selectList();
			
			request.setAttribute("list", list);
			
			//forward
			String forward_page = "list.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);
		}
		
	}
}