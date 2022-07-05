package action.studyCard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.StudyCardDao;
import vo.WrongQnaVo;

/**
 * Servlet implementation class StudyCardWrongQnaAction
 */
@WebServlet("/studyCard/CorrectQna.do")
public class StudyCardCorrectQnaAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		JSONObject json = new JSONObject();
		
		int q_idx = Integer.parseInt(request.getParameter("q_idx"));
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));
		
		WrongQnaVo vo = new WrongQnaVo();
		vo.setQ_idx(q_idx);
		vo.setC_idx(c_idx);
		vo.setM_idx(m_idx);
		
		int res = StudyCardDao.getInstance().deleteWrongQnaCard(vo);
		
		//int res = StudyCardDao.getInstance().updateCorrectCard(q_idx);
		
		if(res == 1) {//수정에 성공했다면,,,
			json.put("res", true);
		}else {
			json.put("res", false);
		}
		
		String json_str = json.toJSONString();
		
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json_str);
	}

}
