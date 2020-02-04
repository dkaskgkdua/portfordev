package com.portfordev.pro;

import java.util.List;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.portfordev.pro.domain.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberTest {
	private static final Logger logger
				= LoggerFactory.getLogger(MemberTest.class);
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	
	
	@Test
	public void testCreate() throws Exception {
		Member member = new Member();
		member.setMEMBER_ID("junit");
		member.setMEMBER_NAME("junit");
		Random r = new Random();
		String salt = "";
		for(int salt_index = 0; salt_index <5; salt_index++) {
			salt += String.valueOf((char) ((int) (r.nextInt(26)) + 97));
		}
		member.setMEMBER_PASSWORD_SALT(salt);
		member.setMEMBER_PASSWORD(""+(salt+"junit").hashCode());
		
		int n = sqlsession.insert("Members.insert", member);
		logger.info("~~~~~~~~~~~~~~n : " + n + "~~~~~~~~~~~~~~~~~~");
	}
	
	@Test
	public void testSelect() throws Exception {
		Member member = sqlsession.selectOne("Members.get_member", "junit");
		System.out.println(member);
	}
	@Test
	public void testAllSelect() throws Exception {
		List<Member> list = sqlsession.selectList("Members.get_member_list");
		list.forEach(item ->{
			System.out.println(item);
		});
	}
}