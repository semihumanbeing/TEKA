package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CardVo;

public class CardDao {
	//single-ton : 객체 1개만 생성해서 사용하자
	static CardDao single = null;
	
	SqlSessionFactory factory;
	public static CardDao getInstance() {

		//객체가 없으면 생성해라
		if (single == null)
			single = new CardDao();

		return single;
	}

	//외부에서 생성하지 말것
	private CardDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
//전체카드조회	
	public List<CardVo> selectList() {

		List<CardVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("card.selectAll");
		
		sqlSession.close();

		return list;
	} 

	
	
	
}