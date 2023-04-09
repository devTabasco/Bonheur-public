package icia.team.bonheur;
import java.sql.Connection;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import icia.team.bonheur.mapper.MapperInter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DbcpTest {
	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;
	@Setter(onMethod_ = @Autowired)
	private SqlSessionFactory sessionFactory;
	@Setter(onMethod_ = @Autowired)
	private SqlSessionTemplate sqlSession;
	@Setter(onMethod_ = @Autowired)
	private MapperInter mapper;
	
	@Test
	public void testConnection() {
		try(Connection connect = dataSource.getConnection()){
			//System.out.println("HikariCP Connection : " + connect);
//			log.info(connect);
//			log.info(sessionFactory);
//			log.info(sqlSession);
//			log.info(mapper.getDate());
//			log.info(mapper.getDate2());
		}catch(Exception e) {e.printStackTrace();}
	}
}
