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
import vo.TekaMemberVo;
import vo.ViewVo;

/**
 * Servlet implementation class MyCardListAction
 */
@WebServlet("/card/myCardList.do")
public class MyCardListAction extends HttpServlet {
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
		
		List<ViewVo> list = CardDao.getInstance().selectMyCardList(user.getM_idx());
		
		//System.out.println(user.getM_idx());
		//System.out.println(list.get(0).getC_qCnt());
		
		request.setAttribute("list", list);
		

		//forward
		String forward_page = "myCardList.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
