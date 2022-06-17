package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MemberDao;
import vo.MemberVo;

/**
 * Servlet implementation class SignUpCheckIDAction
 */
@WebServlet("/checkID.do")
public class SignUpCheckIDAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 파라미터 받기
		request.setCharacterEncoding("utf-8");
		String m_id = request.getParameter("m_id");
		MemberVo vo = MemberDao.getInstance().selectOneById(m_id);
		
		// 아이디 사용 유무 확인하기
		boolean bResult = false;
		if(vo==null) bResult = true;
		
		// json 으로 포장하여 결과 전송
		JSONObject json = new JSONObject();
		json.put("result", bResult);
		
		String jsonString = json.toJSONString();
		
		response.setContentType("text/json; charset=utf-8");
		response.getWriter().print(jsonString);
		

	}

}
