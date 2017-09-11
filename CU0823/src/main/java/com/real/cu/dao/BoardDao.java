package com.real.cu.dao;

import java.util.LinkedHashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.cu.bean.Image;
import com.real.cu.bean.N_laundry;
import com.real.cu.bean.Notice;
import com.real.cu.bean.Person;
import com.real.cu.bean.Request;
import com.real.cu.bean.Review;

@Repository
public class BoardDao {

   @Autowired
   private SqlSessionTemplate sqlSession;

   
   public int NoticeCount(LinkedHashMap<String, Object> map) {
	      return sqlSession.selectOne("board.NoticeCount",map); 
	   }

	   public int NoticeCustomerCount() {
	       return sqlSession.selectOne("board.NoticeCustomerCount"); 
	   }

	   public List<Notice> selectnotice(LinkedHashMap<String, Object> map) {
	      // TODO Auto-generated method stub
	      return sqlSession.selectList("board.selectnotice",map);
	   }

	   public Notice noticedetail(String nt_code) {
	      return sqlSession.selectOne("board.noticedetail",nt_code); 
	   }

	   public void NoticeAdd(Notice nt) {
	      sqlSession.insert("board.NoticeAdd",nt); 
	   }

	   public void noticeDelete(String nt_code) {
	      sqlSession.delete("board.noticeDelete",nt_code); 
	   }

	   public void noticeUpdate(Notice nt) {
	      sqlSession.update("board.noticeUpdate",nt);
	   }

	   public void noticedetailHit(String nt_code) {
	      sqlSession.update("board.noticedetailHit",nt_code);
	   }
   
   
   public List<Review> selectReview(String id) {
      return sqlSession.selectList("board.selectReview",id);
   }

   public List<Request> selectRequest(String id) {
      return sqlSession.selectList("board.selectRequest",id);
   }

   public N_laundry LaundryInfo(String re_nrcode) {
      return sqlSession.selectOne("board.LaundryInfo",re_nrcode);
   }

   public Review reviewInfo(String re_code) {
      return sqlSession.selectOne("board.reviewInfo",re_code);
   }

   public List<Image> ImageSelect(String re_code) {
      return sqlSession.selectList("board.ImageSelect",re_code);
   }

   public void reviewadd(Review re) {
      sqlSession.insert("board.reviewadd",re);
   }

   public void reviewUpdate(LinkedHashMap<String, Object> fmap) {
      sqlSession.update("board.reviewUpdate",fmap);
   }

   public void reviewPictureAdd(LinkedHashMap<String, String> fMap) {
      sqlSession.insert("board.reviewPictureAdd",fMap);
   }
   public void imgDelete(Image image) {
       sqlSession.delete("board.imgDelete", image);
   }

   public N_laundry shopInfo(String re_nlcode) {
      return sqlSession.selectOne("board.shopInfo",re_nlcode); 
   }

   
	public List<Request> requestCheck() {
		return sqlSession.selectList("board.requestCheck");
	}

	public List<Person> getperson(String pid) {
		return sqlSession.selectList("board.getperson",pid);
	}

   

}