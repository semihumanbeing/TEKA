package action.studyCard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.StudyCardDao;
import vo.WrongQnaVo;

/**
 * Servlet implementation class StudyCardCheckWrongAction
 */
@WebServlet("/studyCard/checkWrong.do")
public class StudyCardCheckWrongAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		JSONObject json = new JSONObject();
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));

		// 특정 사용자가 특정 카드에서 추가한 질문번호 모두 읽어오기
		WrongQnaVo vo = new WrongQnaVo();
		vo.setC_idx(c_idx);
		vo.setM_idx(m_idx);

		List<Integer> wrongNum = StudyCardDao.getInstance().selectWrongNumber(vo);

		for (Integer i : wrongNum) {
			System.out.print(i + " ");
		}

		if (wrongNum.size() > 0) {
			json.put("res", true);
			json.put("list", wrongNum);
		} else {
			json.put("res", false);
		}

		String json_str = json.toJSONString();
		// System.out.println(json_str);

		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json_str);

	}

}
