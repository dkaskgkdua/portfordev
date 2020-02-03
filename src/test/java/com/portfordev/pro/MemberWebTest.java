package com.portfordev.pro;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.Random;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.portfordev.pro.domain.Member;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class MemberWebTest {
	private static final Logger logger
 	    = LoggerFactory.getLogger(MemberWebTest.class);
	
	@Autowired
	private WebApplicationContext wac;
	
	//웹 어플리케이션을 어플리케이션 서버에 배포하지 않고도 스프링 MVC 동작을 재현할 수 있는 클래스
	private MockMvc mockMvc;
	
	// 매번 테스트를 진행할때 마다 테스트 하기전 MockMvc mockMvc 객체를 만들어 주기 위해
	// Before 어노테이션으로 setup() 메소드를 실행
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		logger.info("setup~~~~");
	}
	
	@Test
	public void testMyBatisTest() throws Exception {
		logger.info("===testMybatisTest() =====");
		try {
			// .perform()을 이용하면 매핑 url로 request(요청)합니다.
			// .andExpect를 이용해서 다양하게 검증할 수 있다.
			// status().isOk()는 응답을 받아 HttpStatus 코드가 "200"인지 체크할 수 있다.
			mockMvc.perform(post("/joinProcess")
					.param("MEMBER_ID","junit2")
					.param("MEMBER_NAME","junit2")
					.param("MEMBER_PASSWORD", "junit"))
			.andDo(print())
			.andExpect(status().isOk()); // 응답을 받아 HttpStatus 코드가 200인지
			logger.info("~~~ 수행 성공 ~~~");
		} catch(Exception e) {
			logger.error(">> 수행 실패 : " + e.getMessage());
		}
	}
}