package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ViewVo;

public class ViewDao {
	
	SqlSessionFactory factory;
	
	static ViewDao single = null; //static변수: 프로그램 시작시, 클래스 내에 단 1개, 1번만 생성
	public static ViewDao getInstance() {
		if (single == null)
			single = new ViewDao();
		return single;
	}
	private ViewDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

//c_idx 객체 1건 구하기
	public ViewVo selectCIdx(String c_title) {
		
		//int c_idx = 0;
		ViewVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("card.selectCidx", c_title);
		
		sqlSession.close();
		
		return vo;
		//return c_idx;
	}
	
//qnaCard 전체조회
	public List<ViewVo> qnaCardselectList(){
		
		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("card.selectCard");
		
		sqlSession.close();
		
		return list;
	}
	
//qnaCard 테이블 DML
	public int qnaInsert(ViewVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession();
		
		res = sqlSession.insert("card.qnaInsert", vo);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}
//qnaCard 테이블 DML
	public int cardInsert(ViewVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession();
		
		res = sqlSession.insert("card.cardInsert", vo);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}	
	//qnaCard 테이블 DML
	public int myCardSetInsert(ViewVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession();
		
		res = sqlSession.insert("card.myCardSetInsert", vo);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}	
}