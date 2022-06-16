package service;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MyBatisConnector {
    
	//mybatis 작업 객체를 만드는 공장. interface(사용설명서)이다.
	SqlSessionFactory  factory=null;
	
	//싱글톤 구조로 객체를 생성한다.
	private static MyBatisConnector connector; 
	
	//생성자로 커넥터와, 공장을 만든다.
	public MyBatisConnector()
	{
		try {
			//sqlMapConfig.xml읽어들인다.
			Reader reader = 
				Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);			//읽어 들인 xml파일을 기반으로 공장을 만든다.
			reader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//single-ton
	public static MyBatisConnector getInstance(){
		if(connector==null)
			connector = new MyBatisConnector();
		return connector;
	}
	public SqlSessionFactory  getSqlSessionFactory()
	{
		return factory;
	}
}
