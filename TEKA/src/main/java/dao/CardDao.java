package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.QnaCardVo;

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
	
	public List<QnaCardVo> selectList() {

		List<QnaCardVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("card.selectAll");
		
		sqlSession.close();

		return list;
	} 
	

}
