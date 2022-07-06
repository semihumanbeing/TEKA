package action.card;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.LikeyDao;
import vo.ViewVo;

/**
*  Servlet implementation class LikedAction
*/

@WebServlet("/card/likeInsert.do")
public class LikeInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		//전달된 파라미터 받기
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		
		//m_idx, c_idx를 포장한 vo -> 모두 일치하는데 l_like가 1이면 좋아요 못함
		ViewVo vo = new ViewVo();
		vo.setM_idx(m_idx);
		vo.setC_idx(c_idx);
		
		JSONObject json = new JSONObject();
		
		//DB에 좋아요+1 하기 전, l_like의 값 조회
		ViewVo resVo = LikeyDao.getInstance().selectLike(vo);
		
		//l_like가 0인 경우 좋아요+1 DB insert 
		if(resVo.getL_like()==0) {
			
			//DB insert
			int res = LikeyDao.getInstance().liked(vo);
			//결과 저장 -> 1 반환
			json.put("res", 1);
		
		//이미 좋아요를 눌렀다면, 0 반환
		}else if(resVo.getL_like()==1) {
			json.put("already", 0);
		}
		
		//데이터타입 지정
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json.toJSONString());
	}
}