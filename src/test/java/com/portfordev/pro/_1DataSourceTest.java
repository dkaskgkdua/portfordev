package com.portfordev.pro;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.portfordev.pro.domain.MyBatisTestVO2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class _1DataSourceTest {
	private static final Logger logger
				= LoggerFactory.getLogger(_1DataSourceTest.class);
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	
	
	//@Test
	public void testCreate() throws Exception {
		MyBatisTestVO2 vo = new MyBatisTestVO2();
		vo.setName("D반");
		vo.setEmail("D@gmailc.om");
		vo.setTel("010010");
		vo.setAddr("서울시 종로구");
		
		int n = sqlsession.insert("Members.insert", vo);
		logger.info("~~~~~~~~~~~~~~n : " + n + "~~~~~~~~~~~~~~~~~~");
	}
	
	@Test
	public void testSelect() throws Exception {
		MyBatisTestVO2 vo = sqlsession.selectOne("Members.testidcheck", "1");
		System.out.println(vo.toString());
	}
	@Test
	public void testAllSelect() throws Exception {
		List<MyBatisTestVO2> list = sqlsession.selectList("Members.selectAll");
		list.forEach(item ->{
			System.out.println(item);
		});
	}
	
}
