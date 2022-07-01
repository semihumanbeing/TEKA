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
import dao.ViewDao;
import vo.ViewVo;

/**
 * Servlet implementation class AllListAction
 */
@WebServlet("/card/mainList.do")
public class AllListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//url ����
		// http://localhost:9090/TEKA/card/list.do
		// http://localhost:9090/TEKA/card/list.do?subject=
		
		String subject = request.getParameter("subject");
		
		
		if(subject != null && !subject.isEmpty()) {//Ư�� ������ ���ϴ� ��쿡�� Ư�� ������ �����ϴ� ���븸�� �о����
			
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
			List<ViewVo> previewList = ViewDao.getInstance().qnaCardselectList();
			
			request.setAttribute("list", list);
			request.setAttribute("subject", subject);
			request.setAttribute("previewList", previewList);
			
			//forward
			String forward_page = "mainList.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);
			
		}else { //������ ������ ��ü ����Ʈ ����
			
			List<ViewVo> list = CardDao.getInstance().selectList();
			List<ViewVo> previewList = ViewDao.getInstance().qnaCardselectList();
			
			request.setAttribute("list", list);
			request.setAttribute("previewList", previewList);
			
			//forward
			String forward_page = "mainList.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);
		}
		
	}
}