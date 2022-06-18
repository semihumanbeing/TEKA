package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.MemberVo;

public class MemberDao {

	SqlSessionFactory factory;

	// single-ton : 객체 1개만 생성해서 사용하자
	static MemberDao single = null;

	public static MemberDao getInstance() {

		// 객체가 생성되어 있지 않으면 만들어라.
		if (single == null) {
			single = new MemberDao();
		}
		// 이전에 만들어 놨던 객체를 그대로 반환한다.
		return single;
	}

	// 외부에서 생성하지 못하도록 접근제한. 객체는 getInstance메소드를 통해서만 생성가능.
	private MemberDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	// id값으로 사용자 조회
	public MemberVo selectOneById(String m_id) {
		MemberVo vo = null;

		SqlSession sqlSession = factory.openSession();

		vo = sqlSession.selectOne("member.memberListById", m_id);

		sqlSession.close();

		return vo;
	}

	// nickname값으로 사용자 조회
	public MemberVo selectOneByNickname(String m_nickname) {
		MemberVo vo = null;

		SqlSession sqlSession = factory.openSession();

		vo = sqlSession.selectOne("member.memberListByNickname", m_nickname);

		sqlSession.close();

		return vo;
	}
	
	// email값으로 사용자 조회
	public MemberVo selectOneByEmail(String m_email) {
		MemberVo vo = null;

		SqlSession sqlSession = factory.openSession();

		vo = sqlSession.selectOne("member.memberListByEmail", m_email);

		sqlSession.close();

		return vo;
	}
	
	// 회원정보 insert
	public int insertMember(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.insert("member.insert", vo);
		
		sqlSession.close();
		
		return res;
	}
	

}
