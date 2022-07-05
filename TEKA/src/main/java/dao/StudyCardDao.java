package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ViewVo;
import vo.WrongQnaVo;

public class StudyCardDao {
	
	SqlSessionFactory factory;
	//single-ton : ��ü 1���� �����ؼ� �������
	static StudyCardDao single = null;

	public static StudyCardDao getInstance() {

		//��ü�� �����Ǿ� ���� ������ ������.
		if (single == null) {
			single = new StudyCardDao();
		}
		//������ ����� ���� ��ü�� �״�� ��ȯ�Ѵ�.
		return single;
	}

	//�ܺο��� �������� ���ϵ��� ��������. ��ü�� getInstance�޼ҵ带 ���ؼ��� ��������.
	private StudyCardDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	

	//�н��ϱ� word -> ��&�亯 �ȸ�ϱ� qnaCard ��
	public List<ViewVo> selectCard(int c_idx) {

		// TODO Auto-generated method stub
		
		List<ViewVo> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("studyCard.selectCard", c_idx);
		
		sqlSession.close();

		return list;
	}

	public List<Integer> selectWrongNumber(WrongQnaVo vo) {
		// TODO Auto-generated method stub
		List<Integer> list;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("studyCard.selectWrongNumber", vo);
		
		sqlSession.close();
		
		return list;
	}

	public int insertWrongQnaCard(WrongQnaVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.insert("studyCard.insertWrongQnaCard", vo);
		
		sqlSession.close();
		
		return res;
	}

	public int deleteWrongQnaCard(WrongQnaVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.delete("studyCard.deleteWrongQnaCard", vo);
		
		sqlSession.close();
		
		return res;
	}
}
