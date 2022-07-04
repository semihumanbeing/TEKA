package action.card;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.StudyCardDao;
import dao.ViewDao;
import vo.ViewVo;

/**
*  Servlet implementation class PopupAction
*/

@WebServlet("/card/popup.do")
public class PopupAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int c_idx = Integer.parseInt(request.getParameter("c_idx")); //c_idx
		
		//c_idx에 해당하는 객체 구하기
		List<ViewVo> previewList = ViewDao.getInstance().qnaCardList(c_idx);
		//List<ViewVo> nickname    = StudyCardDao.getInstance().selectCard(c_idx);
		
		JSONObject json = new JSONObject();
		
		List<String> list = new ArrayList<>();
		
		for(ViewVo res : previewList) {
			
			list.add(res.getC_title());
			list.add(res.getQ_question());
			list.add(res.getQ_answer());
		}
		
		json.put("list", list);
		
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json.toJSONString());
		
	}
}