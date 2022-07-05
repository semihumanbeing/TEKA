package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ViewVo;

public class ViewDao {
	
	SqlSessionFactory factory;
	
	static ViewDao single = null;
	public static ViewDao getInstance() {
		if (single == null)
			single = new ViewDao();
		return single;
	}
	private ViewDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	//c_title로 c_idx 구하기
	public ViewVo selectCIdx(String c_title) {
		
		ViewVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("card.selectCidx", c_title);
		
		sqlSession.close();
		
		return vo;
	}
	//c_idx에 해당하는 qnaCard테이블 List 구하기
	public List<ViewVo> qnaCardList(int c_idx){
		
		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("card.preview", c_idx);
		
		sqlSession.close();
		
		return list;
	}
	//c_idx로 m_nickname 구하기
	public String selectNickname(int c_idx) {
		
		SqlSession sqlSession = factory.openSession();
		String     m_nickname = sqlSession.selectOne("studyCard.selectNickname", c_idx);
		sqlSession.close();
		
		return m_nickname; 
	}
	
	//qnaCard DML
	public int qnaInsert(ViewVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession();
		
		res = sqlSession.insert("card.qnaInsert", vo);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}
	//qnaCard ���̺� DML
	public int cardInsert(ViewVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession();
		
		res = sqlSession.insert("card.cardInsert", vo);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}	
	//좋아요 insert
	public int insertLiked(ViewVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession();
		
		res = sqlSession.insert("card.insertLiked", vo);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}
	//qnaCard ���̺� DML
	public int myCardSetInsert(ViewVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession();
		
		res = sqlSession.insert("card.myCardSetInsert", vo);
		
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}	
}