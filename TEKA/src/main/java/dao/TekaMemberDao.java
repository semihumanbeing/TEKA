package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.TekaMemberVo;

public class TekaMemberDao {

	SqlSessionFactory factory;

	// single-ton : ��ü 1���� �����ؼ� �������
	static TekaMemberDao single = null;

	public static TekaMemberDao getInstance() {

		// ��ü�� �����Ǿ� ���� ������ ������.
		if (single == null) {
			single = new TekaMemberDao();
		}
		// ������ ����� ���� ��ü�� �״�� ��ȯ�Ѵ�.
		return single;
	}

	// �ܺο��� �������� ���ϵ��� ��������. ��ü�� getInstance�޼ҵ带 ���ؼ��� ��������.
	private TekaMemberDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	// id������ ����� ��ȸ
	public TekaMemberVo selectOneById(String m_id) {
		TekaMemberVo vo = null;

		SqlSession sqlSession = factory.openSession();

		vo = sqlSession.selectOne("tekamember.memberListById", m_id);

		sqlSession.close();

		return vo;
	}

	// nickname������ ����� ��ȸ
	public TekaMemberVo selectOneByNickname(String m_nickname) {
		TekaMemberVo vo = null;

		SqlSession sqlSession = factory.openSession();

		vo = sqlSession.selectOne("tekamember.memberListByNickname", m_nickname);

		sqlSession.close();

		return vo;
	}
	
	// email������ ����� ��ȸ
	public TekaMemberVo selectOneByEmail(String m_email) {
		TekaMemberVo vo = null;

		SqlSession sqlSession = factory.openSession();

		vo = sqlSession.selectOne("tekamember.memberListByEmail", m_email);

		sqlSession.close();

		return vo;
	}
	
	// ȸ������ insert
	public int insertMember(TekaMemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.insert("tekamember.insert", vo);
		
		sqlSession.close();
		
		return res;
	}
	

}