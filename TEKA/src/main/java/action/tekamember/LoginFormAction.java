package action.tekamember;

import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginFormAction
 */
@WebServlet("/tekamember/loginForm.do")
public class LoginFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		try {
			KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");	//Ű �� ���� RSA�˰���
			generator.initialize(1024);											//Ű ������ 1024
			KeyPair keyPair       = generator.genKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PublicKey publicKey   = keyPair.getPublic(); //������
			PrivateKey privateKey = keyPair.getPrivate();//����Ű
			
			session.setAttribute("RSA_WEB_KEY", privateKey);//���ǿ� ����Ű�� ����
			
			//����Ű�� 16�� ���ڿ��� �ٲپ� Ŭ���̾�Ʈ�� �����Ѵ�. 
			RSAPublicKeySpec publicSpec = keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			
			String publicKeyModulus    = publicSpec.getModulus().toString(16);
			String publicKeyExponenet  = publicSpec.getPublicExponent().toString(16);
			
			request.setAttribute("RSAModulus", publicKeyModulus);
			request.setAttribute("RSAExponent", publicKeyExponenet);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//forward
		String forward_page = "loginForm.jsp";
		RequestDispatcher disp = request.getRequestDispatcher(forward_page);
		disp.forward(request, response);

	}

}
