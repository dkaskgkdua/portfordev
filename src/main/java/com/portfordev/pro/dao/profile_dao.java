package com.portfordev.pro.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class profile_dao {
 @Autowired
 private SqlSessionTemplate sql;
 
 public int insertprofile(Map<String, Object> map) {
	return sql.insert("profile.insert",map);
	 
 }
 
 public int checkid(String id) {
	 return sql.selectOne("profile.checkid",id);
 }
 
}
