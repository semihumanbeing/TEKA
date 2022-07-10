package action.studyCard;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudyCardDao;
import vo.TekaMemberVo;
import vo.ViewVo;

/**
 * Servlet implementation class StudyCardWordAction
 */
@WebServlet("/studyCard/studyCardTest.do")
public class StudyCardTestAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		TekaMemberVo user = (TekaMemberVo) request.getSession().getAttribute("user");
		if(user == null) {
			response.sendRedirect("../tekamember/loginForm.do?reason=sessionTimeout");
			return;
		}
		
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		String type = request.getParameter("type");
		
		
		List<ViewVo> list = StudyCardDao.getInstance().selectCard(c_idx);
		
		request.setAttribute("list", list);
		request.setAttribute("type", type);
		//forward
		String forward_page = "studyCardTest.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}

