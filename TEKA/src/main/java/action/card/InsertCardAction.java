package action.card;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ViewDao;
import vo.ViewVo;

/**
 * Servlet implementation class CardInsertAction
 */
@WebServlet("/card/insertCard.do")
public class InsertCardAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		//파라미터 얻어오기
		int    s_idx     = Integer.parseInt(request.getParameter("s_idx"));
		int    m_idx     = Integer.parseInt(request.getParameter("m_idx"));
		String c_title   = request.getParameter("c_title");
		String c_content = request.getParameter("c_content");
		//배열로 넘어온 파라미터 얻어오기
		String[] q_questionStrArray = request.getParameterValues("q_question");
		String[] q_answerStrArray   = request.getParameterValues("q_answer");
		//카드 질문갯수
		int c_qCnt = q_questionStrArray.length;
		
		//vo포장
		ViewVo vo = new ViewVo();
		vo.setS_idx(s_idx);
		vo.setM_idx(m_idx);
		vo.setC_title(c_title);
		vo.setC_content(c_content);
		vo.setC_qCnt(c_qCnt);
		
		//카드 추가하기
		int cardRes = ViewDao.getInstance().cardInsert(vo);
		
		//c_title로 c_idx 얻어오기
		ViewVo c_idxVo = ViewDao.getInstance().selectCIdx(c_title);
		
		int c_idx = c_idxVo.getC_idx();
		
		//얻은 c_idx를 다시 vo에 포장
		vo.setC_idx(c_idx);
		
		//m_idx, c_idx에 해당하는 좋아요 수 insert
		int insertLiked = ViewDao.getInstance().insertLiked(vo);
		//내 학습세트에 추가하기
		int myCardSetRes = ViewDao.getInstance().myCardSetInsert(vo);
		
		//질문 추가하기
		for(int i=0; i<q_questionStrArray.length; i++) {
				
			vo.setQ_question(q_questionStrArray[i]);
			vo.setQ_answer(q_answerStrArray[i]);
			
			int Qnares = ViewDao.getInstance().qnaInsert(vo);
		}//for end
		
		//결과 재요청
		response.sendRedirect("myCardList.do");
	}
}