package action.card;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CardDao;
import vo.MyCardSetVo;
import vo.TekaMemberVo;

/**
 * Servlet implementation class MyCardListAction
 */
@WebServlet("/card/myCardInsert.do")
public class MyCardInsertAction extends HttpServlet {
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
		int s_idx = Integer.parseInt(request.getParameter("s_idx"));
		int m_idx = user.getM_idx();
		
		//삽입할 데이터 포장하기
		MyCardSetVo vo = new MyCardSetVo();
		vo.setC_idx(c_idx);
		vo.setS_idx(s_idx);
		vo.setM_idx(m_idx);
		
		//카드의 추가여부를 보는 것이 아니라 -> 특정 회원에 대해서 특정 카드가 추가 되었는지를 확인해야 한다.
		MyCardSetVo vo1 = CardDao.getInstance().selectCheckMyCard(vo);
		if(vo1 != null) {//값이 있다면, 있다고 알려주기
			response.sendRedirect("mainList.do?reason=exist");
			return;
		}else {
			
			int res = CardDao.getInstance().insertMyCard(vo);
			response.sendRedirect("mainList.do?reason=success");
			return;
		}
		
	}

}

