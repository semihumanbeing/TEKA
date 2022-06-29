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
		//url ����
		// http://localhost:9090/TEKA/card/list.do
		// http://localhost:9090/TEKA/card/list.do?subject=
		
		String subject = request.getParameter("subject");
		
		
		if(subject != null && !subject.isEmpty()) {//Ư�� ������ ���ϴ� ��쿡�� Ư�� ������ �����ϴ� ���븸�� �о����
			
			switch(subject) {
			case "os":
				subject = "�ü��";
				break;
			case "network":
				subject = "��Ʈ��ũ";
				break;
			case "algorithm":
				subject = "�˰���";
				break;
			case "datastructure":
				subject = "�ڷᱸ��";
				break;
			case "java":
				subject = "�ڹ�";
				break;
			case "spring":
				subject = "������";
				break;
			}
			
			List<ViewVo> list = CardDao.getInstance().selectBySubject(subject);
			
			request.setAttribute("list", list);
			request.setAttribute("subject", subject);
			
			//forward
			String forward_page = "list.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);
			
		}else { //������ ������ ��ü ����Ʈ ����
			
			List<ViewVo> list = CardDao.getInstance().selectList();
			
			request.setAttribute("list", list);
			
			//forward
			String forward_page = "list.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);
		}
		
	}
}