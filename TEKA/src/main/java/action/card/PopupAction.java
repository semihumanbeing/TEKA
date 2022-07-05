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
		
		List<ViewVo> previewList = null;
		
		//previewPopup 전체 조회
		previewList = ViewDao.getInstance().previewList();
		
		JSONObject json = new JSONObject();
		
		//결과저장 : c_idx에 해당하는 질문/답변
		List<String> list = new ArrayList<>();

		for(ViewVo res : previewList) {
			
			//파라미터로 들어온 c_idx와 전체리스트의 c_idx가 일치할 때만 list에 추가
			if(c_idx==res.getC_idx()) {

				list.add(res.getQ_question());
				list.add(res.getQ_answer());
			}
		}
		
		//응답할 데이터 저장
		json.put("list", list);
		
		
		//m_nickname 구하기
		previewList = ViewDao.getInstance().previewSelectThree(c_idx);
		
		
		for(ViewVo vo : previewList) {
			
			String c_title    = vo.getC_title();
			String c_content  = vo.getC_content();
			String m_nickname = vo.getM_nickname();
			
			json.put("c_title", c_title);
			json.put("c_content", c_content);
			json.put("m_nickname", m_nickname);
			//조회는 카드개수만큼 되지만, 위 데이터들은 1개씩만 필요하므로 1회 반복 후 강제탈출
			break;
		}
		
		//응답할 데이터 저장
		
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json.toJSONString());
		
	}
}