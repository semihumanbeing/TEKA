package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.MemberVo;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// /login.do?m_id=yhn032&m_pwd=1234
		String m_id  = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		
		
		MemberVo user = MemberDao.getInstance().selectOneById(m_id);
		
		
		//id üũ
		if(user == null) {
			response.sendRedirect("loginForm.do?reason=fail_id");
			return;
		}
		
		//pwdüũ 
		if(!user.getM_pwd().equals(m_pwd)) {
			response.sendRedirect("loginForm.do?reason=fail_pwd&m_id=" + m_id);
			return;
		}
		
		request.getSession().setAttribute("user", user);
		
		response.sendRedirect("list.do");
		

	}

}
