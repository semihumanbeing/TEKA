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
 * Servlet implementation class StudyCardActionExample
 */
@WebServlet("/exam.do")
public class StudyCardActionExample extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<ViewVo> list = CardDao.getInstance().selectCard();
		
		request.setAttribute("list", list);
		
		System.out.println(list.get(0).getQ_question());
		
		//forward
		String forward_page = "slideCard.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}

