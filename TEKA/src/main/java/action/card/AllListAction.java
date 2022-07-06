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
import dao.ViewDao;
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

		// url 종류
		// http://localhost:9090/TEKA/card/list.do
		// http://localhost:9090/TEKA/card/list.do?subject=
		// http://localhost:9090/TEKA/card/list.do?subject=?&order=?

		String subject = request.getParameter("subject"); // 주제
		String order   = request.getParameter("order"); // 필터

		if (subject != null && !subject.isEmpty()) {// 특정 주제를 원하는 경우에는 특정 주제에 부합하는 내용만을 읽어오기

			// 주제 리스트 가져오기
			List<ViewVo> list = getSubjectList(subject);
			
			// 필터가 있으면 정렬
			if (order != null && !order.isEmpty()) {
				Collections.sort(list, new ViewVoComp(order));
			}

			// 리퀘스트 바인딩
			request.setAttribute("list", list);
			request.setAttribute("subject", subject);

			// forward
			String forward_page = "mainList.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);

		} else { // 주제가 없으면 전체 리스트 보기
			
			// 전체 리스트 가져오기
			List<ViewVo> list = CardDao.getInstance().selectList();
			
			// 필터가 있으면 정렬
			if (order != null && !order.isEmpty()) {
				Collections.sort(list, new ViewVoComp(order));
			}
			
			// 리퀘스트 바인딩
			request.setAttribute("list", list);

			// forward
			String forward_page = "mainList.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(forward_page);
			disp.forward(request, response);
		}

	}

	// 주제 리스트를 가져오는 메서드
	private List<ViewVo> getSubjectList(String subject) {

		switch (subject) {
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
		return list;

	}
	
	// 필터 리스트를 정렬하는 내부 클래스
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