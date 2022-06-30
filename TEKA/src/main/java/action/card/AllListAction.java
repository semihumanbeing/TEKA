package action.card;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
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
@WebServlet("/card/mainList.do")
public class AllListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// url ����
		// http://localhost:9090/TEKA/card/list.do
		// http://localhost:9090/TEKA/card/list.do?subject=
		// http://localhost:9090/TEKA/card/list.do?subject=?&order=?

		String subject = request.getParameter("subject"); // ����
		String order = request.getParameter("order"); // ����

		if (subject != null && !subject.isEmpty()) {// Ư�� ������ ���ϴ� ��쿡�� Ư�� ������ �����ϴ� ���븸�� �о����

			// ���� ����Ʈ ��������
			List<ViewVo> list = getSubjectList(subject);

			// ���Ͱ� ������ ����
			if (order != null && !order.isEmpty()) {
				Collections.sort(list, new ViewVoComp(order));
			}

			// ������Ʈ ���ε�
			request.setAttribute("list", list);
			request.setAttribute("subject", subject);

			// forward
			String forward_page = "mainList.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);

		} else { // ������ ������ ��ü ����Ʈ ����

			// ��ü ����Ʈ ��������
			List<ViewVo> list = CardDao.getInstance().selectList();

			// ���Ͱ� ������ ����
			if (order != null && !order.isEmpty()) {
				Collections.sort(list, new ViewVoComp(order));
			}

			// ������Ʈ ���ε�
			request.setAttribute("list", list);

			// forward
			String forward_page = "mainList.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);
		}

	}

	// ���� ����Ʈ�� �������� �޼���
	private List<ViewVo> getSubjectList(String subject) {

		switch (subject) {
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
		return list;

	}
	
	// ���� ����Ʈ�� �����ϴ� ���� Ŭ����
	class ViewVoComp implements Comparator<ViewVo> {
		String order;

		public ViewVoComp(String order) {
			super();
			this.order = order;
		}

		@Override
		public int compare(ViewVo o1, ViewVo o2) {
			int ret = 0;

			if(order.equals("oldest")) {
				if (o1.getC_regdate().compareTo(o2.getC_regdate()) > 0) {
					ret = 1;
				} else if (o1.getC_regdate().compareTo(o2.getC_regdate()) < 0) {
					ret = -1;
				}
			} else if(order.equals("mostLiked")) {
				if (o1.getL_like() > o2.getL_like()) {
					ret = 1;
				} else if (o1.getL_like() < o2.getL_like()) {
					ret = -1;
				}
			} else if(order.equals("newest")) {
				if (o1.getC_regdate().compareTo(o2.getC_regdate()) < 0) {
					ret = 1;
				} else if (o1.getC_regdate().compareTo(o2.getC_regdate()) > 0) {
					ret = -1;
				}
			}
			return ret;
		}

	}

	
}