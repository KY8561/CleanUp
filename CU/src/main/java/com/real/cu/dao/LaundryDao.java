package com.real.cu.dao;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.cu.bean.Coin;
import com.real.cu.bean.Image;
import com.real.cu.bean.Laundryhandle;
import com.real.cu.bean.Member;
import com.real.cu.bean.N_laundry;

@Repository("laundrydao")
public class LaundryDao {
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   public Coin CoinDetailSelect(String cl_code) {
       return  sqlSession.selectOne("laundry.CoinDetailSelect", cl_code);
      }


   public List<Image> ImageSelect(String nl_code) {
         return sqlSession.selectList("laundry.ImageSelect",nl_code);
      }
   public void coinShopAdd(Coin co){
       sqlSession.insert("laundry.coinShopAdd",co);
      
   }

   public void lisencePictureAdd(LinkedHashMap<String, String> fMap) {
      sqlSession.insert("laundry.lisencePictureAdd",fMap);
   }

   public void shopPictureAdd(LinkedHashMap<String, String> fMap) {
      sqlSession.insert("laundry.shopPictureAdd",fMap);      
   }

   public List<Coin> CoinListSelect(String id) {
      return sqlSession.selectList("laundry.CoinListSelect",id);
   }
   public int LaundryDelete(String string) {
         return sqlSession.delete("laundry.LaundryDelete", string);
      }
    public int CoinShopDelete(String string) {
         return sqlSession.delete("laundry.CoinShopDelete", string);
      }


   public void coinShopUpdate(LinkedHashMap<String, Object> fmap) {
      sqlSession.update("laundry.coinShopUpdate",fmap);
   }


   public List<N_laundry> LaundryAdminSelect() {
      return sqlSession.selectList("laundry.LaundryAdminSelect");
   }


   public List<Coin> CoinAdminSelect() {
      return sqlSession.selectList("laundry.CoinAdminSelect");
   }


   public List<N_laundry> LaundryKindSelect(String search) {
      return sqlSession.selectList("laundry.LaundryKindSelect",search);
   }


   public List<Coin> CoinKindSelect(String search) {

      return sqlSession.selectList("laundry.CoinKindSelect",search);
   }


   public Member addressSelect(String id) {
      return sqlSession.selectOne("laundry.addressSelect",id);
   }


   public List<N_laundry> SearchPlace(String keyword) {
      return sqlSession.selectList("laundry.SearchPlace",keyword);
   }


   public List<Coin> SearchCoinPlace(String keyword) {
      return sqlSession.selectList("laundry.SearchCoinPlace",keyword);
   }


   public List<N_laundry> laundryCheck() {
      return sqlSession.selectList("laundry.laundryCheck");
   }


   public List<Coin> CoinShopCheck() {
       return sqlSession.selectList("laundry.CoinShopCheck");
   }


   public void PerMissionUpdate(String code) {
      sqlSession.update("laundry.PerMissionUpdate",code);
   }


   public void CoinPerMissionUpdate(String code) {
      sqlSession.update("laundry.CoinPerMissionUpdate",code);
   }
   public void UpdateNlAddress(N_laundry nl) {
         sqlSession.update("laundry.UpdateNlAddress", nl);
      }

   public void acceptshopdelete(String code) {
      sqlSession.delete("laundry.acceptshopdelete",code);
   }
   public void Coinacceptshopdelete(String code) {
      sqlSession.delete("laundry.Coinacceptshopdelete",code);
   }
   public int InsertN_laundry(N_laundry nl) {
         return sqlSession.insert("laundry.InsertN_laundry", nl);
      }
   public void insertLaundryHandle(LinkedHashMap<Object, Object> lhMap) {
         sqlSession.insert("laundry.insertLaundryHandle", lhMap);
      }
   public List<N_laundry> LaundrySelect(String id) {
         return sqlSession.selectList("laundry.LaundrySelect",id);
      }
   public N_laundry LaundryDetailSelect(String nl_code) {
         return sqlSession.selectOne("laundry.LaundryDetailSelect", nl_code);
      }
   public List<Laundryhandle> HandleSelect(String nl_code) {
         return sqlSession.selectList("laundry.HandleSelect", nl_code);
      }
   public int updateN_laundry(N_laundry nl) {
         return sqlSession.update("laundry.updateN_laundry", nl);
      }
   public void laundryHandleDelete(Laundryhandle lh) {
         sqlSession.delete("laundry.laundryHandleDelete", lh);
      }


   public void imgDelete(Image image) {
       sqlSession.delete("laundry.imgDelete", image);
      
   }


	public List<N_laundry> shopListSearch(String NLCODE) {

		return sqlSession.selectList("laundry.shopListSearch",NLCODE);
	}



   
   
   

   
}