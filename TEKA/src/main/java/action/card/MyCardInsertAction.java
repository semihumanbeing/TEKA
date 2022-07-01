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
		
		//�̹� �߰� �Ǿ��ִ��� Ȯ���ϱ�
		MyCardSetVo vo1 = CardDao.getInstance().selectCheckMyCard(c_idx);
		if(vo1 != null) {//�̹� �߰��Ǿ� �ִ� ī����
			response.sendRedirect("mainList.do?reason=exist");
			return;
		}else {
			
			//���� �н���Ʈ�� insert
			MyCardSetVo vo = new MyCardSetVo();
			vo.setC_idx(c_idx);
			vo.setS_idx(s_idx);
			vo.setM_idx(user.getM_idx());
			
			int res = CardDao.getInstance().insertMyCard(vo);
			response.sendRedirect("mainList.do?reason=success");
			return;
		}
		
	}

}

