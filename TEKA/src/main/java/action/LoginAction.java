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
		System.out.println("# ��ȣȭ �� ���̵� : " + m_id + ", # ��ȣȭ �� ��й�ȣ : " + m_pwd);
		
		//�α��� ���� ���ǿ� ������ ����Ű�� �����´�. 
		PrivateKey privateKey = (PrivateKey) session.getAttribute("RSA_WEB_KEY");
		
		if(privateKey == null) {
			System.out.println("# �α��� üũ ����");
			json.put("state", 1);
		}else {
			
			try {
				//��ȣȭ�� �����͸� ��ȣȭ ó���Ѵ�.
				String _m_id  = decryptRSA(privateKey, m_id);
				String _m_pwd = decryptRSA(privateKey, m_pwd);
				
				System.out.println("#��ȣȭ �� ���̵� : " + _m_id + ", # ��ȣȭ �� ��й�ȣ : " + _m_pwd);
				//��ȣȭ ó���� ���� ������ ����ؼ� �α��� ������ �����Ѵ�. 
				MemberVo user = MemberDao.getInstance().selectOneById(_m_id);
				
				//id üũ
				if(user == null) {
					System.out.println("id ����");
					json.put("state", 2);
				} //pwdüũ 
				else if(!user.getM_pwd().equals(_m_pwd)) {//user != null && ��й�ȣ �ٸ�
					System.out.println(user.getM_pwd());
					System.out.println("pwd ����");
					json.put("state", 3);
				}else {
					System.out.println("�α��� üũ ����");
					System.out.println(privateKey);
					json.put("state", 4);
					session.setAttribute("user", user);
				}
			} catch (Exception e) {
				// TODO: handle exception
				json.put("state", 5);
				System.out.println("�α��� üũ ����. Error : " + e.getMessage());
			}
		}
		/*
			1	:  ����Ű�� �������� ����
			2	:  id�� Ʋ��
			3	:  pwd�� Ʋ��
			4	:  �α��� ����
			5	:  ���� �߻�
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
			System.out.println("# ��ȣȭ ���� �߻� : " + e.getMessage());
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
