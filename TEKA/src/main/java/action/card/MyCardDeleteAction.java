package action.card;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.CardDao;
import vo.MyCardSetVo;
import vo.TekaMemberVo;

/**
 * Servlet implementation class MyCardDeleteAction
 */
@WebServlet("/card/myCardDelete.do")
public class MyCardDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		TekaMemberVo user = (TekaMemberVo) request.getSession().getAttribute("user");
		if(user == null) {
			response.sendRedirect("../member/loginForm.do?reason=sessionTimeout");
			return;
		}
		
		int m_idx = user.getM_idx();
		
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		
		MyCardSetVo vo = new MyCardSetVo();
		vo.setC_idx(c_idx);
		vo.setM_idx(m_idx);
		
		int res = CardDao.getInstance().deleteMyCard(vo);
		
		JSONObject json = new JSONObject();
		if(res == 0) {//에러
			json.put("result", false);
		}else {//성공
			json.put("result", true);
		}
		
		String json_str = json.toJSONString();
		
		response.setContentType("text/json; charset=utf8;");
		response.getWriter().print(json_str);
	}

}

