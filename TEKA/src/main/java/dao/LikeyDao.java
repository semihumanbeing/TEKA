package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ViewVo;

public class LikeyDao {
	
	SqlSessionFactory factory;
	static LikeyDao single = null; //static변수: 프로그램 시작시, 클래스 내에 단 1개, 1번만 생성
	public static LikeyDao getInstance() {
		if (single == null)
			single = new LikeyDao();
		return single;
	}
	private LikeyDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
//	//현재 좋아요 수 조회
//	public List<ViewVo> selectLike(ViewVo vo) {
//		
//		List<ViewVo> list = null;
//		
//		SqlSession sqlSession = factory.openSession();
//		list = sqlSession.selectList("card.selectLike", vo);
//		sqlSession.close();
//
//		return list;
//	}
	//c_idx, m_idx에 해당하는 객체 1건 구하기
	public ViewVo selectLike(ViewVo vo) {
		
		ViewVo resVo = null;
		
		SqlSession sqlSession = factory.openSession();
		resVo = sqlSession.selectOne("card.selectLike", vo);
		sqlSession.close();
		
		return resVo;
	}
	
	//l_like + 1 (insert)
	public int liked(ViewVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		res = sqlSession.update("card.liked", vo);
		sqlSession.close();

		return res;
	}
	
	public int deleteLike(ViewVo vo) {

		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		res = sqlSession.update("card.deleteLike", vo);
		sqlSession.close();
		
		return res;
	}
	
}