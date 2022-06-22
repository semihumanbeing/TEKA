package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CardVo;
import vo.ViewVo;

public class CardDao {
	//single-ton : ��ü 1���� �����ؼ� �������
	static CardDao single = null;
	
	SqlSessionFactory factory;
	public static CardDao getInstance() {

		//��ü�� ������ �����ض�
		if (single == null)
			single = new CardDao();

		return single;
	}

	//�ܺο��� �������� ����
	private CardDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//��üī����ȸ	
	public List<ViewVo> selectList() {

		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("card.selectAll");
		
		sqlSession.close();

		return list;
	}

	public List<ViewVo> selectCard() {
		// TODO Auto-generated method stub
		
		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("card.selectCard");
		
		sqlSession.close();

		return list;
	} 

	
	
	
}