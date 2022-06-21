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
		//System.out.println("# ��ȣȭ �� ���̵� : " + m_id + ", # ��ȣȭ �� ��й�ȣ : " + m_pwd);
		
		//�α��� ���� ���ǿ� ������ ����Ű�� �����´�. 
		PrivateKey privateKey = (PrivateKey) session.getAttribute("RSA_WEB_KEY");
		
		//������ ����Ű�� �ߺ� �α����ϴ� ���� �����ϱ� ���� ���� �����ڸ��� ���ǿ��� �����ع�����. ���ǿ� ����Ű�� ���̴� ���� �����Ѵ�. 
		//�α��� �ÿ��� �׻� ���ο� ����Ű�� �̿��ϵ��� �����Ѵ�.
		session.removeAttribute("RSA_WEB_KEY");
		
		if(privateKey == null) {
			
			throw new RuntimeException("��ȣȭ�� ����Ű�� ã�� �� �����ϴ�. ���ΰ�ħ�� ���ּ���.");
			
		}else {//����Ű�� �����Ѵٸ�,,,
			
			try {
				//��ȣȭ�� �����͸� ��ȣȭ ó���Ѵ�.
				String m_id  = decryptRSA(privateKey, encryptedID);
				String m_pwd = decryptRSA(privateKey, encryptedPWD);
				
				//System.out.println("#��ȣȭ �� ���̵� : " + _m_id + ", # ��ȣȭ �� ��й�ȣ : " + _m_pwd);
				//��ȣȭ ó���� ���� ������ ����ؼ� �α��� ������ �����Ѵ�. 
				TekaMemberVo user = TekaMemberDao.getInstance().selectOneById(m_id);
				
				//id üũ
				if(user == null) {
					response.sendRedirect("loginForm.do?reason=failId");
					return;
				} //pwdüũ 
				
				if(!user.getM_pwd().equals(m_pwd)) {//user != null && ��й�ȣ �ٸ�
					response.sendRedirect("loginForm.do?reason=failPwd");
					return;
				}
				
				//�α��� ���� �� �������� ���ǿ� ����
				session.setAttribute("user", user);
				response.sendRedirect("../card/list.do");
				
			} catch (Exception e) {
				// TODO: handle exception
				//System.out.println("�α��� üũ ����. Error : " + e.getMessage());
			}
		}
		/*
			1	:  ����Ű�� �������� ����
			2	:  id�� Ʋ��
			3	:  pwd�� Ʋ��
			4	:  �α��� ����
			5	:  ���� �߻�
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
			System.out.println("# ��ȣȭ ���� �߻� : " + e.getMessage());
		}
		return decryptedValue;
	}
	
	
	//16�� ���ڿ��� �ٽ� ����Ʈ �迭�� �ٲٴ� �۾�
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
