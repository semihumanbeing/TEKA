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
	
	//팝업 리스트 전체조회
	public List<ViewVo> previewList(){
		
		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("card.preview");
		
		sqlSession.close();
		
		return list;
	}
	
	//c_idx에 해당하는 닉네임/카드제목/소개글 구하기
	public List<ViewVo> previewSelectThree(int c_idx) {
		
		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("card.previewSelectThree", c_idx);
		sqlSession.close();
		
		return list; 
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
	//좋아요 insert : 카드만들기 할 때 추가
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