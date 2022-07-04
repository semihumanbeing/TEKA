package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ViewVo;

public class ViewDao {
	
	SqlSessionFactory factory;
	
	static ViewDao single = null; //static����: ���α׷� ���۽�, Ŭ���� ���� �� 1��, 1���� ����
	public static ViewDao getInstance() {
		if (single == null)
			single = new ViewDao();
		return single;
	}
	private ViewDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

//c_idx ��ü 1�� ���ϱ�
	public ViewVo selectCIdx(String c_title) {
		
		//int c_idx = 0;
		ViewVo vo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		vo = sqlSession.selectOne("card.selectCidx", c_title);
		
		sqlSession.close();
		
		return vo;
		//return c_idx;
	}
	
	//c_idx에 해당하는 qnaCard테이블 List 구하기
	public List<ViewVo> qnaCardList(int c_idx){
		
		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("card.preview", c_idx);
		
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