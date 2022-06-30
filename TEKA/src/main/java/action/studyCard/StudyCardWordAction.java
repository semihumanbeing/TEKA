package action.studyCard;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CardDao;
import dao.StudyCardDao;
import vo.ViewVo;

/**
 * Servlet implementation class StudyCardActionExample
 */
@WebServlet("/studyCard/studyCardWord.do")
public class StudyCardWordAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<ViewVo> list = StudyCardDao.getInstance().selectCard();
		
		request.setAttribute("list", list);
		
		
		//forward
		String forward_page = "slideCard.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}

