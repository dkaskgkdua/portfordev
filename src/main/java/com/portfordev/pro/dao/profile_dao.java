package com.portfordev.pro.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfordev.pro.domain.Profile;
@Repository
public class profile_dao {
 @Autowired
 private SqlSessionTemplate sql;
 //프로필 등록
 public int insertprofile(Map<String, Object> map) {
	return sql.insert("profile.insert",map);
	 
 }
 //프로필에 등록 되어있는지 
 public int checkid(String id) {
	 return sql.selectOne("profile.checkid",id);
 }
 
 //프로필 조회
 public Profile profile_view(String id) {
	 return sql.selectOne("profile.profile_view",id);
 }
 
 public List<Profile> portfolioImg(String id ) {
	 return sql.selectList("profile.portfolioImg",id);
 }
 //프로필 수정
 public int updateprofile(Map<String,Object> map) {
	 return sql.update("profile.update_profile",map);
 }
 //프로필 수정 자기소개
 public int updateprofile_intro(Map<String,Object> map) {
	 return sql.update("profile.update_profile_intro",map);
 }
 //프로필 수정 기술
 public int updateprofile_skill(Map<String,Object>map) {
	 return sql.update("profile.update_profile_skill",map);
 }
 
 // profile collection
 // 프로필 리스트
 public List<Profile> getProfileList(Map<String, String> map){
	 return sql.selectList("profile.collection", map);
 }
}
