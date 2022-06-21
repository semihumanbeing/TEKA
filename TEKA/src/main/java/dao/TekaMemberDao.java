package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.TekaMemberVo;

public class TekaMemberDao {

	SqlSessionFactory factory;

	// single-ton : 객체 1개만 생성해서 사용하자
	static TekaMemberDao single = null;

	public static TekaMemberDao getInstance() {

		// 객체가 생성되어 있지 않으면 만들어라.
		if (single == null) {
			single = new TekaMemberDao();
		}
		// 이전에 만들어 놨던 객체를 그대로 반환한다.
		return single;
	}

	// 외부에서 생성하지 못하도록 접근제한. 객체는 getInstance메소드를 통해서만 생성가능.
	private TekaMemberDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	// id값으로 사용자 조회
	public TekaMemberVo selectOneById(String m_id) {
		TekaMemberVo vo = null;

		SqlSession sqlSession = factory.openSession();

		vo = sqlSession.selectOne("tekamember.memberListById", m_id);

		sqlSession.close();

		return vo;
	}

	// nickname값으로 사용자 조회
	public TekaMemberVo selectOneByNickname(String m_nickname) {
		TekaMemberVo vo = null;

		SqlSession sqlSession = factory.openSession();

		vo = sqlSession.selectOne("tekamember.memberListByNickname", m_nickname);

		sqlSession.close();

		return vo;
	}
	
	// email값으로 사용자 조회
	public TekaMemberVo selectOneByEmail(String m_email) {
		TekaMemberVo vo = null;

		SqlSession sqlSession = factory.openSession();

		vo = sqlSession.selectOne("tekamember.memberListByEmail", m_email);

		sqlSession.close();

		return vo;
	}
	
	// 회원정보 insert
	public int insertMember(TekaMemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.insert("tekamember.insert", vo);
		
		sqlSession.close();
		
		return res;
	}
	

}