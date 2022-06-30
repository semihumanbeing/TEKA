package action.card;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ViewDao;
import vo.ViewVo;

/**
*  Servlet implementation class MyCardSetAction
*/

@WebServlet("/card/myCardSet.do")
public class MyCardSetAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<ViewVo> list = ViewDao.getInstance().qnaCardselectList();
		
		request.setAttribute("list", list);
		
		String forward_page = "myCardSet.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);
	}
}