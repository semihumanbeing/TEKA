package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ViewVo;

public class StudyCardDao {
	
	SqlSessionFactory factory;
	//single-ton : 객체 1개만 생성해서 사용하자
	static StudyCardDao single = null;

	public static StudyCardDao getInstance() {

		//객체가 생성되어 있지 않으면 만들어라.
		if (single == null) {
			single = new StudyCardDao();
		}
		//이전에 만들어 놨던 객체를 그대로 반환한다.
		return single;
	}

	//외부에서 생성하지 못하도록 접근제한. 객체는 getInstance메소드를 통해서만 생성가능.
	private StudyCardDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//학습하기 word -> 질문&답변 조회하기 qnaCard 뷰
	public List<ViewVo> selectCard(int c_idx) {
		// TODO Auto-generated method stub
		
		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("studyCard.selectCard", c_idx);
		
		sqlSession.close();

		return list;
	}
}
