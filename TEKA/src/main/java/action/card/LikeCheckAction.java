package action.card;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.LikeyDao;
import vo.TekaMemberVo;
import vo.ViewVo;

/**
*  Servlet implementation class LikeCheckAction
*/

@WebServlet("/card/likeCheck.do")
public class LikeCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		//현재 m_idx 구하기
		int m_idx = 0;

		//윈도우 초기화이벤트에서 로그인하지 않았을 경우, m_idx=null인 것에 대한 예외처리
		try {
			m_idx = Integer.parseInt(request.getParameter("m_idx"));
		} catch (NumberFormatException e) {
			
			//e.printStackTrace();
			//예외처리 발생시 메소드 종료?
			//콘솔창에 Exception에 대한 오류만 뜨고 나머지는 정상작동 됨 일단...
			System.out.println(m_idx);
			return;
		}
		
		System.out.println(m_idx);
		
		//l_likey>0인 컬럼만 list에 추가됨
		List<ViewVo> list = LikeyDao.getInstance().likeCheck(m_idx);

		JSONObject json = new JSONObject();
		json.put("liked", true);
		
		List<Integer> likedList = new ArrayList<>();
		
		for(ViewVo vo : list) {
			
			likedList.add(vo.getC_idx());
		}//for end

		json.put("likedList", likedList);
		
		//데이터타입 설정
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json.toJSONString());
	}
}