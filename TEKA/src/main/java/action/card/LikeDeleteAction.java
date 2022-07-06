package action.card;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.LikeyDao;
import vo.ViewVo;

/**
*  Servlet implementation class LikeDeleteAction
*/

@WebServlet("/card/deleteLiked.do")
public class LikeDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));
		
		ViewVo vo = new ViewVo();
		vo.setC_idx(c_idx);
		vo.setM_idx(m_idx);
		
		//좋아요한 항목 다시 0으로 변경
		int res = LikeyDao.getInstance().deleteLike(vo);
	
		JSONObject json = new JSONObject();
		
		//delete명령이 정상적으로 수행되었다면 처리된 행수 1반환
		json.put("result", 1);
		
		//현재 좋아요 수 구하기
		ViewVo resVo = LikeyDao.getInstance().selectLike(vo);
		
		json.put("currLike", resVo.getL_like());
		
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json.toJSONString());
	
	}
}