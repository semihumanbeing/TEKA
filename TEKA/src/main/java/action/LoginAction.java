package action;

import java.io.IOException;
import java.security.PrivateKey;

import javax.crypto.Cipher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

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
		
		JSONObject json = new JSONObject();
		String m_id  = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");
		
		System.out.println(m_id);
		System.out.println(m_pwd);
		HttpSession session = request.getSession();
		System.out.println("# 암호화 된 아이디 : " + m_id + ", # 암호화 된 비밀번호 : " + m_pwd);
		
		//로그인 전에 세션에 저장한 개인키를 가져온다. 
		PrivateKey privateKey = (PrivateKey) session.getAttribute("RSA_WEB_KEY");
		
		if(privateKey == null) {
			System.out.println("# 로그인 체크 실패");
			json.put("state", 1);
		}else {
			
			try {
				//암호화된 데이터를 복호화 처리한다.
				String _m_id  = decryptRSA(privateKey, m_id);
				String _m_pwd = decryptRSA(privateKey, m_pwd);
				
				System.out.println("#복호화 된 아이디 : " + _m_id + ", # 복호화 된 비밀번호 : " + _m_pwd);
				//복호화 처리된 계정 정보를 사용해서 로그인 검증을 시작한다. 
				MemberVo user = MemberDao.getInstance().selectOneById(_m_id);
				
				//id 체크
				if(user == null) {
					System.out.println("id 오류");
					json.put("state", 2);
				} //pwd체크 
				else if(!user.getM_pwd().equals(_m_pwd)) {//user != null && 비밀번호 다름
					System.out.println(user.getM_pwd());
					System.out.println("pwd 오류");
					json.put("state", 3);
				}else {
					System.out.println("로그인 체크 성공");
					System.out.println(privateKey);
					json.put("state", 4);
					session.setAttribute("user", user);
				}
			} catch (Exception e) {
				// TODO: handle exception
				json.put("state", 5);
				System.out.println("로그인 체크 실패. Error : " + e.getMessage());
			}
		}
		/*
			1	:  개인키가 생성되지 않음
			2	:  id가 틀림
			3	:  pwd가 틀림
			4	:  로그인 성공
			5	:  예외 발생
		*/
		
		String json_str = json.toJSONString();
		System.out.println(json_str);
		response.setContentType("text/json; charset=utf-8;");
		response.getWriter().print(json_str);
	}

	private String decryptRSA(PrivateKey privateKey, String m_id) {
		// TODO Auto-generated method stub
		String decryptedValue = "";
		try {
			Cipher cipher = Cipher.getInstance("RSA");
			
			byte[] encryptedBytes = hexToByteArray(m_id);
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
			decryptedValue = new String(decryptedBytes, "utf-8");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("# 복호화 에러 발생 : " + e.getMessage());
		}
		return decryptedValue;
	}

	private byte[] hexToByteArray(String m_id) {
		// TODO Auto-generated method stub
		if(m_id == null || m_id.length()%2 != 0) {
			return new byte[] {};
		}
		
		byte[] bytes = new byte[m_id.length()/2];
		for(int i=0; i< m_id.length(); i+=2) {
			byte val = (byte) Integer.parseInt(m_id.substring(i, i+2), 16);
			bytes[(int) Math.floor(i/2)] = val;
		}
		
		return bytes;
	}

}
