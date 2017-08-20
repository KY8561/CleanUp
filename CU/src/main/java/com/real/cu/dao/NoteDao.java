package com.real.cu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.cu.bean.Coin;
import com.real.cu.bean.N_laundry;
import com.real.cu.bean.Note;
@Repository
public class NoteDao {

   @Autowired
   private SqlSessionTemplate sqlSession;
   public int messageCheck(String id) {
      return sqlSession.selectOne("note.messageCheck", id);
   }
   public List<Note> messageForm(String id) {
      return sqlSession.selectList("note.messageForm",id);
   }
   public List<Note> sendmessage(String id) {
      return sqlSession.selectList("note.sendmessage",id);
   }
   public void Messagesave(Note no) {
      sqlSession.update("note.Messagesave",no);
   }
   public void Messagedelete(Note no) {
      sqlSession.delete("note.Messagedelete",no);
   }
   public List<N_laundry> laundryId(String n_takeid) {
      return sqlSession.selectList("note.laundryId",n_takeid);
   }
   public Note MessageDetail(String n_code) {
      return sqlSession.selectOne("note.MessageDetail", n_code);
   }
   public List<Coin> coinId(String n_takeid) {
      return sqlSession.selectList("note.coinId",n_takeid);
   }
   public void realmessageSend(Note nt) {
       sqlSession.insert("note.realmessageSend",nt);
   }
   public void MessageUpdate(String n_code) {
      sqlSession.update("note.MessageUpdate",n_code);      
   }
}