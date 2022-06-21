package action.tekamember;

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

import dao.TekaMemberDao;
import vo.TekaMemberVo;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/tekamember/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String encryptedID  = request.getParameter("encryptedID");
		String encryptedPWD = request.getParameter("encryptedPWD");
		
		HttpSession session = request.getSession();
		//System.out.println("# 암호화 된 아이디 : " + m_id + ", # 암호화 된 비밀번호 : " + m_pwd);
		
		//로그인 전에 세션에 저장한 개인키를 가져온다. 
		PrivateKey privateKey = (PrivateKey) session.getAttribute("RSA_WEB_KEY");
		
		//동일한 개인키로 중복 로그인하는 것을 방지하기 위해 값을 꺼내자마자 세션에서 삭제해버린다. 세션에 개인키가 쌓이는 것을 방지한다. 
		//로그인 시에는 항상 새로운 개인키를 이용하도록 강제한다.
		session.removeAttribute("RSA_WEB_KEY");
		
		if(privateKey == null) {
			
			throw new RuntimeException("암호화된 개인키를 찾을 수 없습니다. 새로고침을 해주세요.");
			
		}else {//개인키가 존재한다면,,,
			
			try {
				//암호화된 데이터를 복호화 처리한다.
				String m_id  = decryptRSA(privateKey, encryptedID);
				String m_pwd = decryptRSA(privateKey, encryptedPWD);
				
				//System.out.println("#복호화 된 아이디 : " + _m_id + ", # 복호화 된 비밀번호 : " + _m_pwd);
				//복호화 처리된 계정 정보를 사용해서 로그인 검증을 시작한다. 
				TekaMemberVo user = TekaMemberDao.getInstance().selectOneById(m_id);
				
				//id 체크
				if(user == null) {
					response.sendRedirect("loginForm.do?reason=failId");
					return;
				} //pwd체크 
				
				if(!user.getM_pwd().equals(m_pwd)) {//user != null && 비밀번호 다름
					response.sendRedirect("loginForm.do?reason=failPwd");
					return;
				}
				
				//로그인 성공 시 유저정보 세션에 저장
				session.setAttribute("user", user);
				response.sendRedirect("../card/list.do");
				
			} catch (Exception e) {
				// TODO: handle exception
				//System.out.println("로그인 체크 실패. Error : " + e.getMessage());
			}
		}
		/*
			1	:  개인키가 생성되지 않음
			2	:  id가 틀림
			3	:  pwd가 틀림
			4	:  로그인 성공
			5	:  예외 발생
		*/
		
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
	
	
	//16진 문자열을 다시 바이트 배열로 바꾸는 작업
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
