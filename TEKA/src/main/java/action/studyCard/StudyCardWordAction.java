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
@WebServlet("/studyCard/studyCardWord.do")
public class StudyCardWordAction extends HttpServlet {
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
		
		String random = request.getParameter("opt");
		//System.out.println(c_idx);
		
		List<ViewVo> list = null;
		
		if(random != null && !random.isEmpty()) {//순서를 섞으라는 명령이 들어왔다면,,,
			
			list = StudyCardDao.getInstance().selectCard(c_idx);
			Collections.shuffle(list);
			
		}else {//아니면 일반 출력
			list = StudyCardDao.getInstance().selectCard(c_idx);
		}
		
		
		request.setAttribute("list", list);
		//forward
		String forward_page = "studyCardWord.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}

