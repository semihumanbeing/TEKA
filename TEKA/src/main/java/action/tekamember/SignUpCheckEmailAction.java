package action.tekamember;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.TekaMemberDao;
import vo.TekaMemberVo;

/**
 * Servlet implementation class SignUpCheckEmailAction
 */
@WebServlet("/tekamember/checkEmail.do")
public class SignUpCheckEmailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// �Ķ���� �ޱ�
		request.setCharacterEncoding("utf-8");
		String m_email = request.getParameter("m_email");
		TekaMemberVo vo = TekaMemberDao.getInstance().selectOneByEmail(m_email);
		
		// ���̵� ��� ���� Ȯ���ϱ�
		boolean bResult = false;
		if(vo==null) bResult = true;
		
		// json ���� �����Ͽ� ��� ����
		JSONObject json = new JSONObject();
		json.put("result", bResult);
		
		String jsonString = json.toJSONString();
		
		response.setContentType("text/json; charset=utf-8");
		response.getWriter().print(jsonString);
		

	}

}
