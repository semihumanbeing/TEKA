package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.MemberVo;

public class MemberDao {
	
	SqlSessionFactory factory;
	
	//single-ton : ��ü 1���� �����ؼ� �������
	static MemberDao single = null;

	public static MemberDao getInstance() {

		//��ü�� �����Ǿ� ���� ������ ������.
		if (single == null) {
			single = new MemberDao();
		}
		//������ ����� ���� ��ü�� �״�� ��ȯ�Ѵ�.
		return single;
	}

	//�ܺο��� �������� ���ϵ��� ��������. ��ü�� getInstance�޼ҵ带 ���ؼ��� ��������.
	private MemberDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//id������ ����� ��ȸ
	public MemberVo selectOneById(String m_id){
		MemberVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("member.memberListById", m_id);
		
		sqlSession.close();
		
		return vo;
	}
	
}
