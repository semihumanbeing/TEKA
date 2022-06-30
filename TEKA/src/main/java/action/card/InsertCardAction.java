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
		
		//�������ڵ� ����
		request.setCharacterEncoding("utf-8");
		
		int    s_idx     = Integer.parseInt(request.getParameter("s_idx"));
		int    m_idx     = Integer.parseInt(request.getParameter("m_idx"));
		String c_title   = request.getParameter("c_title");
		String c_content = request.getParameter("c_content");
		
		//vo����
		ViewVo vo = new ViewVo();
		
		vo.setS_idx(s_idx);
		vo.setM_idx(m_idx);
		vo.setC_title(c_title);
		vo.setC_content(c_content);
		
		
		//ī�����̺� insert
		int cardRes = ViewDao.getInstance().cardInsert(vo);
		
		//int c_idx = ViewDao.getInstance().selectCIdx(c_title);
		//int c_idx = c_idxVo.getC_idx();
		//vo.setC_idx(c_idx);
		//ī�����̺� insert ��, c_idx ���ϱ�
		ViewVo c_idxVo = ViewDao.getInstance().selectCIdx(c_title);
		
		int c_idx = c_idxVo.getC_idx();
		
		//���� ���� c_idx ����
		vo.setC_idx(c_idx);
		
		//�� �н���Ʈ ���̺� insert
		int myCardSetRes = ViewDao.getInstance().myCardSetInsert(vo);
		
		//�迭 �Ķ���� �ޱ� (������ �Է¹����ϱ� �� �迭�� ���̴� ������ ����)
		String[] q_questionStrArray = request.getParameterValues("q_question");
		String[] q_answerStrArray   = request.getParameterValues("q_answer");
		
		for(int i=0; i<q_questionStrArray.length; i++) {
				
			vo.setQ_question(q_questionStrArray[i]);
			vo.setQ_answer(q_answerStrArray[i]);
			
			//vo�� �� ���õ� ������ insert
			int Qnares = ViewDao.getInstance().qnaInsert(vo);
		}
		
		response.sendRedirect("myCardSet.do");

	}
}