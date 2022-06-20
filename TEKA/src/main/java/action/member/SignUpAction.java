package action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;

/**
 * Servlet implementation class SignUpAction
 */
@WebServlet("/member/signUp.do")
public class SignUpAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// ���� ���ڵ�
		request.setCharacterEncoding("utf-8");
		
		// �Ķ���� �ޱ�
		String m_id = request.getParameter("m_id");
		String m_nickname = request.getParameter("m_nickname");
		String m_email = request.getParameter("m_email");
		String m_pwd = request.getParameter("m_pwd");
		
		// ����
		MemberVo vo = new MemberVo();
		vo.setM_id(m_id);
		vo.setM_nickname(m_nickname);
		vo.setM_email(m_email);
		vo.setM_pwd(m_pwd);
		
		// �Է�
		MemberDao.getInstance().insertMember(vo);
		
		// �α�����
		response.sendRedirect("loginForm.do");
	}

}
