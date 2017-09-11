package com.real.cu.service;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.real.cu.bean.Business;
import com.real.cu.bean.Member;
import com.real.cu.bean.Person;
import com.real.cu.dao.MemberDao;


@Service
public class MemberService {

	@Autowired
	private HttpSession session;
	@Autowired
	private MemberDao mDao;
	@Autowired
	private HttpServletRequest req;


	ModelAndView mav;                                                                                                                                              


	public ModelAndView execute(Person p, int check, int cmd) {
		switch(cmd){
		case 5: 
			joinVCsend(p,check); break;
		default:break;
		}
		return mav;
	}

	public ModelAndView execute(Person p, int cmd) {
		switch(cmd){
		case 1:
			login(p); break;
		case 2:
			memberInsert(p); break;
		case 3:
			businessInsert(p); break;
		case 12:
			personUpdate(p); break;
		case 16:
			businessUpdate(p); break;
		default:break;
		}
		return mav;
	}


	public ModelAndView execute(int cmd) {
		switch(cmd){
		case 6:
			findId(); break;
		case 7:
			findPw(); break;
		case 8:
			personUpdateMV(); break;
		case 9:
			personMyPage(); break;
		case 13:
			memberDelete(); break;
		case 14:
			businessUpdateMV(); break;
		case 15:
			businessMyPage(); break;
		case 17:
			businessDelete(); break;
		case 18:
			blackList(); break;
		case 21:
			adminDeleteMV(); break;
		default:break;
		}
		return mav;
	}


	public ModelAndView execute(int check, int cmd){
		switch(cmd){
		case 4:
			idCheck(check); break;
		case 5: 
			joinVCsend(check); break;
		case 10:
			pwCheck(check); break;
		case 11:
			vcCheck(check); break;
		case 19:
			selectMemberList(check); break;
		case 20:
			classChange(check); break;
		case 22:
			selectList(check); break;
		case 23:
			personDelete(check); break;
		}
		return mav;
	}


	private void personDelete(int check) {
		if(check==0||check==1||check==2){
			String id[] = req.getParameterValues("tot");
			for(int i=0;i<id.length;i++){
				System.out.println(id[i]);
				String p_id=id[i];
				int result = mDao.addDeleteList(p_id);
				if(result!=0){
					System.out.println("회원탈퇴 성공"+i);
				}else{
					System.out.println("회원탈퇴 실패"+i);
				}
			}if(check==0){
				System.out.println("전체");
				req.setAttribute("menu", "tot");
			}else if(check==1){
				req.setAttribute("menu", "member");
				System.out.println("개인");
			}else if(check==2){
				req.setAttribute("menu", "business");
				System.out.println("사업자");
			}
		}selectList(2);
	}


	private void selectList(int check) {
		mav = new ModelAndView();
		List<Person> blist=null;
		if(check==1){
			String menu = req.getParameter("val");
			if(menu.equals("tot")){
				adminDeleteMV();
			}else if(menu.equals("member")){
				blist=mDao.getMemberList2();
				if(blist!=null){
					System.out.println("멤버 리스트 성공");
					String list=makeMemberHtml2(blist);
					mav.addObject("list", list);
					mav.setViewName("AdminDelete");
				}else{
					System.out.println("멤버 리스트 실패");
					mav.addObject("check", 1);
					mav.setViewName("forward:/adminDeleteMV");
				}
			}else if(menu.equals("business")){
				blist=mDao.getBusinessList2();
				if(blist!=null){
					System.out.println("사업자 리스트 성공");
					String list=makeBusinessHtml2(blist);
					mav.addObject("list", list);
					mav.setViewName("AdminDelete");
				}else{
					System.out.println("사업자 리스트 실패");
					mav.addObject("check", 1);
					mav.setViewName("forward:/adminDeleteMV");
				}
			}else{
				blist=mDao.getDeleteList();
				if(blist!=null){
					System.out.println("탈퇴회원 리스트 성공");
					String list=makeDeleteHtml(blist);
					mav.addObject("list",list);
					mav.setViewName("AdminDelete");
				}else{
					System.out.println("탈퇴회원 리스트 실패");
					mav.addObject("check",1);
					mav.setViewName("forward:/adminDeleteMv");
				}
			}
		}else if(check==2){
			String menu = (String) req.getAttribute("menu");
			if(menu.equals("tot")){
				adminDeleteMV();
			}else if(menu.equals("member")){
				blist=mDao.getMemberList2();
				if(blist!=null){
					System.out.println("멤버 리스트 성공2");
					String list=makeMemberHtml2(blist);
					mav.addObject("list", list);
					mav.setViewName("AdminDelete");
				}else{
					System.out.println("멤버 리스트 실패2");
					mav.addObject("check", 1);
					mav.setViewName("forward:/adminDeleteMV");
				}
			}else if(menu.equals("business")){
				blist=mDao.getBusinessList2();
				if(blist!=null){
					System.out.println("사업자 리스트 성공2");
					String list=makeBusinessHtml2(blist);
					mav.addObject("list", list);
					mav.setViewName("AdminDelete");
				}else{
					System.out.println("사업자 리스트 실패2");
					mav.addObject("check", 1);
					mav.setViewName("forward:/adminDeleteMV");
				}
			}else{
				blist=mDao.getDeleteList();
				if(blist!=null){
					System.out.println("탈퇴회원 리스트 성공2");
					String list=makeDeleteHtml(blist);
					mav.addObject("list",list);
					mav.setViewName("AdminDelete");
				}else{
					System.out.println("탈퇴회원 리스트 실패2");
					mav.addObject("check",1);
					mav.setViewName("forward:/adminDeleteMv");
				}
			}

		}
	}

	private String makeDeleteHtml(List<Person> blist) {
		StringBuilder sb = new StringBuilder();
		System.out.println(blist.size());
		sb.append("<select id='selectBox' name='delete' style='height:23px'>");
		sb.append("<option value='tot'>전체회원</option>");
		sb.append("<option value='member'>개인회원</option>");
		sb.append("<option value='business'>사업자회원</option>");
		sb.append("<option value='delete'selected='selected'>탈퇴회원</option>");
		sb.append("</select><span>　</span>");
		sb.append(makeHtml());
		sb.append("<h1>탈퇴회원 리스트</h1>");
		sb.append("<table border='1' style='text-align:center; width:700px;'>");
		sb.append("<tr><td>아이디</td><td>이름</td><td>이메일</td><td>전화번호</td></tr>");
		for (int i = 0; i < blist.size() ; i++) {
			Person p = blist.get(i);
			sb.append("<tr><td>" + p.getP_id() + "</td>");
			sb.append("<td>" + p.getP_name() + "</td>");
			sb.append("<td>" + p.getP_email() + "</td>");
			sb.append("<td>" + p.getP_phone() + "</td></tr>");
			System.out.println(sb);
		}
		sb.append("</table>");
		sb.append("<br/>");
		return sb.toString();
	}


	private String makeBusinessHtml2(List<Person> blist) {
		StringBuilder sb = new StringBuilder();
		System.out.println(blist.size());
		sb.append("<select id='selectBox' name='delete' style='height:23px'>");
		sb.append("<option value='tot'>전체회원</option>");
		sb.append("<option value='member'>개인회원</option>");
		sb.append("<option value='business' selected='selected'>사업자회원</option>");
		sb.append("<option value='delete'>탈퇴회원</option>");
		sb.append("</select><span>　</span>");
		sb.append(makeHtml());
		sb.append("<h1>사업자회원 리스트</h1>");
		sb.append("<table border='1' style='text-align:center; width:700px;'>");
		sb.append("<tr><td>구분</td><td>아이디</td><td>이름</td><td>이메일</td><td>전화번호</td><td>블랙리스트 상태</td></tr>");
		for (int i = 0; i < blist.size() ; i++) {
			Person p = blist.get(i);
			sb.append("<tr><td><input type='checkbox' name='tot' value='"+p.getP_id()+"'/></td>");
			sb.append("<td>" + p.getP_id() + "</td>");
			sb.append("<td>" + p.getP_name() + "</td>");
			sb.append("<td>" + p.getP_email() + "</td>");
			sb.append("<td>" + p.getP_phone() + "</td>");
			System.out.println(sb);
			if(p.getP_state()==0){
				sb.append("<td> X </td></tr>");
			}else{
				sb.append("<td> O </td></tr>");
			}
		}
		sb.append("</table>");
		sb.append("<br/>");
		sb.append("<input type='button' value='회원탈퇴' onclick='personDelete(2)'/>");
		return sb.toString();
	}

	private String makeMemberHtml2(List<Person> blist) {
		StringBuilder sb = new StringBuilder();
		System.out.println(blist.size());
		sb.append("<select id='selectBox' name='delete' style='height:23px'>");
		sb.append("<option value='tot'>전체회원</option>");
		sb.append("<option value='member' selected='selected'>개인회원</option>");
		sb.append("<option value='business'>사업자회원</option>");
		sb.append("<option value='delete'>탈퇴회원</option>");
		sb.append("</select><span>　</span>");
		sb.append(makeHtml());
		sb.append("<h1>일반회원 리스트</h1>");
		sb.append("<table border='1' style='text-align:center; width:700px;'>");
		sb.append("<tr><td>구분</td><td>아이디</td><td>이름</td><td>이메일</td><td>전화번호</td><td>블랙리스트 상태</td></tr>");
		for (int i = 0; i < blist.size() ; i++) {
			Person p = blist.get(i);
			sb.append("<tr><td><input type='checkbox' name='tot' value='"+p.getP_id()+"'/></td>");
			sb.append("<td>" + p.getP_id() + "</td>");
			sb.append("<td>" + p.getP_name() + "</td>");
			sb.append("<td>" + p.getP_email() + "</td>");
			sb.append("<td>" + p.getP_phone() + "</td>");
			if(p.getP_state()==0)
			{
				sb.append("<td> X </td></tr>");
			}else{
				sb.append("<td> O </td></tr>");
			}
			System.out.println(sb);
		}
		sb.append("</table>");
		sb.append("<br/>");
		sb.append("<input type='button' value='회원탈퇴 ' onclick='personDelete(1)'/>");
		return sb.toString();
	}

	private void adminDeleteMV() {
		mav = new ModelAndView();
		List<Person> blist=null;
		blist = mDao.getPersonList();
		if(blist!=null){
			System.out.println("성공");
			String list=makePersonHtml2(blist);
			mav.addObject("list", list);
			mav.setViewName("AdminDelete");
		}else{
			System.out.println("실패");
			mav.addObject("check", 1);
			mav.setViewName("AdminMain");
		}
	}


	private String makePersonHtml2(List<Person> blist) {
		StringBuilder sb = new StringBuilder();
		System.out.println(blist.size());
		sb.append("<select id='selectBox' name='delete' style='height:23px'>");
		sb.append("<option value='tot' selected='selected'>전체회원</option>");
		sb.append("<option value='member'>개인회원</option>");
		sb.append("<option value='business'>사업자회원</option>");
		sb.append("<option value='delete'>탈퇴회원</delete>");
		sb.append("</select><span>　</span>");
		sb.append(makeHtml());
		sb.append("<table border='1' style='text-align:center; width:700px;'>");
		sb.append("<tr><td>구분</td><td>아이디</td><td>이름</td><td>이메일</td><td>전화번호</td><td>회원구분</td><td>블랙리스트 상태</td></tr>");
		for (int i = 0; i < blist.size() ; i++) {
			Person p = blist.get(i);
			if(p.getP_state()==0){
				sb.append("<tr><td><input type='checkbox' name='tot' value='"+p.getP_id()+"'/></td>");
				sb.append("<td>" + p.getP_id() + "</td>");
				sb.append("<td>" + p.getP_name() + "</td>");
				sb.append("<td>" + p.getP_email() + "</td>");
				sb.append("<td>" + p.getP_phone() + "</td>");
				if(p.getP_flag()==1){
					sb.append("<td>개인회원</td>");
					sb.append("<td> X </td></tr>");
				}else{
					sb.append("<td>사업자회원</td>");
					sb.append("<td> X </td></tr>");
				}
			}else if(p.getP_state()==1){	
				sb.append("<tr><td><input type='checkbox' name='tot' value='"+p.getP_id()+"'/></td>");
				sb.append("<td>" + p.getP_id() + "</td>");
				sb.append("<td>" + p.getP_name() + "</td>");
				sb.append("<td>" + p.getP_email() + "</td>");
				sb.append("<td>" + p.getP_phone() + "</td>");
				if(p.getP_flag()==1){
					sb.append("<td>일반회원</td>");
					sb.append("<td> O </td></tr>");
				}else{
					sb.append("<td>사업자회원</td>");
					sb.append("<td> O </td></tr>");
				}
			}
			System.out.println(sb);
		}
		sb.append("</table>");
		sb.append("<br/>");
		sb.append("<input type='button' value='회원탈퇴' onclick='personDelete(0)'/>");
		return sb.toString();
	}

	private void classChange(int check){
		if(check==0||check==1||check==2){
			String[] id= req.getParameterValues("tot");
			for(int i=0; i<id.length; i++){
				System.out.println(id[i]);
				String p_id=id[i];
				int result=mDao.addBlackList(p_id);
				if(result!=0){
					System.out.println("블랙리스트 추가 성공"+i);
				}else{
					System.out.println("블랙리스트 추가 실패"+i);
				}
			}if(check==0){
				req.setAttribute("menu", "tot");
			}else if(check==1){
				req.setAttribute("menu", "member");
			}else if(check==2){
				req.setAttribute("menu", "business");
			}
		}else if(check==3){
			String[] id= req.getParameterValues("black");
			for(int i=0; i<id.length; i++){
				System.out.println(id[i]);
				String p_id=id[i];
				int result=mDao.removeBlack(p_id);
				if(result!=0){
					System.out.println("블랙리스트 삭제 성공"+i);
				}else{
					System.out.println("블랙리스트 삭제 실패"+i);
				}
			}req.setAttribute("menu", "black");
		}selectMemberList(2);
	}


	private void selectMemberList(int check) {
		mav = new ModelAndView();
		List<Person> blist=null;
		if(check==1){
			String menu=req.getParameter("val");
			if(menu.equals("tot")){
				blackList();
			}else if(menu.equals("member")){
				blist=mDao.getMemberList();
				if(blist!=null){
					System.out.println("멤버 리스트 성공");
					String li=makeMemberHtml(blist);
					mav.addObject("li", li);
					mav.setViewName("BlackList");
				}else{
					System.out.println("멤버 리스트 실패");
					mav.addObject("check", 1);
					mav.setViewName("forward:/blackList");
				}
			}else if(menu.equals("business")){
				blist=mDao.getBusinessList();
				if(blist!=null){
					System.out.println("사업자 리스트 성공");
					String li=makeBusinessHtml(blist);
					mav.addObject("li", li);
					mav.setViewName("BlackList");
				}else{
					System.out.println("사업자 리스트 실패");
					mav.addObject("check", 1);
					mav.setViewName("forward:/blackList");
				}
			}else{
				blist=mDao.getBlackList();
				if(blist!=null){
					System.out.println("블랙리스트 성공");
					String li=makeBlackHtml(blist);
					mav.addObject("li", li);
					mav.setViewName("BlackList");
				}else{
					System.out.println("블랙 리스트 실패");
					mav.addObject("check", 1);
					mav.setViewName("forward:/blackList");
				}
			}
		}else if(check==2){
			String menu=(String) req.getAttribute("menu");
			if(menu.equals("tot")){
				blackList();
			}else if(menu.equals("member")){
				blist=mDao.getMemberList();
				if(blist!=null){
					System.out.println("멤버 리스트 성공");
					String li=makeMemberHtml(blist);
					mav.addObject("li", li);
					mav.setViewName("BlackList");
				}else{
					System.out.println("멤버 리스트 실패");
					mav.addObject("check", 1);
					mav.setViewName("forward:/blackList");
				}
			}else if(menu.equals("business")){
				blist=mDao.getBusinessList();
				if(blist!=null){
					System.out.println("사업자 리스트 성공");
					String li=makeBusinessHtml(blist);
					mav.addObject("li", li);
					mav.setViewName("BlackList");
				}else{
					System.out.println("사업자 리스트 실패");
					mav.addObject("check", 1);
					mav.setViewName("forward:/blackList");
				}
			}else{
				blist=mDao.getBlackList();
				if(blist!=null){
					System.out.println("블랙리스트 성공");
					String li=makeBlackHtml(blist);
					mav.addObject("li", li);
					mav.setViewName("BlackList");
				}else{
					System.out.println("블랙 리스트 실패");
					mav.addObject("check", 1);
					mav.setViewName("forward:/blackList");
				}
			}
		}
	}


	private String makeBlackHtml(List<Person> blist) {
		StringBuilder sb = new StringBuilder();
		System.out.println(blist.size());
		sb.append("<select id='selectBox' name='person' style='height:23px'>");
		sb.append("<option value='tot'>전체회원</option>");
		sb.append("<option value='member'>개인회원 리스트</option>");
		sb.append("<option value='business'>사업자회원</option>");
		sb.append("<option value='blacklist' selected='selected'>블랙리스트</option>");
		sb.append("</select><span>　</span>");
		sb.append(makeHtml());
		sb.append("<h1>블랙리스트</h1>");
		sb.append("<table border='1' style='text-align:center; width:700px;'>");
		sb.append("<tr><td>구분</td><td>아이디</td><td>이름</td><td>이메일</td><td>전화번호</td><td>회원구분</td></tr>");
		for (int i = 0; i < blist.size() ; i++) {
			Person p = blist.get(i);
			sb.append("<tr><td><input type='checkbox' name='black' value='"+p.getP_id()+"'/></td>");
			sb.append("<td>" + p.getP_id() + "</td>");
			sb.append("<td>" + p.getP_name() + "</td>");
			sb.append("<td>" + p.getP_email() + "</td>");
			sb.append("<td>" + p.getP_phone() + "</td>");
			if(p.getP_flag()==1){
				sb.append("<td>개인회원</td></tr>");
			}else if(p.getP_flag()==2){
				sb.append("<td>사업자회원</td></tr>");
			}
			System.out.println(sb);
		}
		sb.append("</table>");
		sb.append("<br/>");
		sb.append("<input type='button' value='전환하기' onclick='change(3)'/>");
		return sb.toString();
	}

	private String makeBusinessHtml(List<Person> blist) {
		StringBuilder sb = new StringBuilder();
		System.out.println(blist.size());
		sb.append("<select id='selectBox' name='person' style='height:23px'>");
		sb.append("<option value='tot'>전체회원</option>");
		sb.append("<option value='member'>개인회원</option>");
		sb.append("<option value='business' selected='selected'>사업자회원</option>");
		sb.append("<option value='blacklist'>블랙리스트</option>");
		sb.append("</select><span>　</span>");
		sb.append(makeHtml());
		sb.append("<h1>사업자회원 리스트 (블랙리스트 제외)</h1>");
		sb.append("<table border='1' style='text-align:center; width:700px;'>");
		sb.append("<tr><td>구분</td><td>아이디</td><td>이름</td><td>이메일</td><td>전화번호</td></tr>");
		for (int i = 0; i < blist.size() ; i++) {
			Person p = blist.get(i);
			sb.append("<tr><td><input type='checkbox' name='tot' value='"+p.getP_id()+"'/></td>");
			sb.append("<td>" + p.getP_id() + "</td>");
			sb.append("<td>" + p.getP_name() + "</td>");
			sb.append("<td>" + p.getP_email() + "</td>");
			sb.append("<td>" + p.getP_phone() + "</td></tr>");
			System.out.println(sb);
		}
		sb.append("</table>");
		sb.append("<br/>");
		sb.append("<input type='button' value='블랙리스트 추가하기' onclick='change(2)'/>");
		return sb.toString();
	}

	private String makeMemberHtml(List<Person> blist) {
		StringBuilder sb = new StringBuilder();
		System.out.println(blist.size());
		sb.append("<select id='selectBox' name='person' style='height:23px'>");
		sb.append("<option value='tot'>전체회원</option>");
		sb.append("<option value='member' selected='selected'>개인회원</option>");
		sb.append("<option value='business'>사업자회원</option>");
		sb.append("<option value='blacklist'>블랙리스트</option>");
		sb.append("</select><span>　</span>");
		sb.append(makeHtml());
		sb.append("<h1>일반회원 리스트 (블랙리스트 제외)</h1>");
		sb.append("<table border='1' style='text-align:center; width:700px;'>");
		sb.append("<tr><td>구분</td><td>아이디</td><td>이름</td><td>이메일</td><td>전화번호</td></tr>");
		for (int i = 0; i < blist.size() ; i++) {
			Person p = blist.get(i);
			sb.append("<tr><td><input type='checkbox' name='tot' value='"+p.getP_id()+"'/></td>");
			sb.append("<td>" + p.getP_id() + "</td>");
			sb.append("<td>" + p.getP_name() + "</td>");
			sb.append("<td>" + p.getP_email() + "</td>");
			sb.append("<td>" + p.getP_phone() + "</td></tr>");
			System.out.println(sb);
		}
		sb.append("</table>");
		sb.append("<br/>");
		sb.append("<input type='button' value='블랙리스트 추가하기' onclick='change(1)'/>");
		return sb.toString();
	}

	private void blackList() {
		mav = new ModelAndView();
		List<Person> blist=null;
		blist = mDao.getPersonList();
		if(blist!=null){
			System.out.println("성공");
			String li=makePersonHtml(blist);
			mav.addObject("li", li);
			mav.setViewName("BlackList");
		}else{
			System.out.println("실패");
			mav.addObject("check", 1);
			mav.setViewName("AdminMain");
		}
	}




	private String makePersonHtml(List<Person> blist) {
		StringBuilder sb = new StringBuilder();
		System.out.println(blist.size());
		sb.append("<select id='selectBox' name='person' style='height:23px'>");
		sb.append("<option value='tot' selected='selected'>전체회원</option>");
		sb.append("<option value='member'>개인회원</option>");
		sb.append("<option value='business'>사업자회원</option>");
		sb.append("<option value='blacklist'>블랙리스트</option>");
		sb.append("</select><span>　</span>");
		sb.append(makeHtml());
		sb.append("<table border='1' style='text-align:center; width:700px;'>");
		sb.append("<tr><td>구분</td><td>아이디</td><td>이름</td><td>이메일</td><td>전화번호</td><td>회원구분</td><td>블랙리스트 상태</td></tr>");
		for (int i = 0; i < blist.size() ; i++) {
			Person p = blist.get(i);
			if(p.getP_state()==0){
				sb.append("<tr><td><input type='checkbox' name='tot' value='"+p.getP_id()+"'/></td>");
				sb.append("<td>" + p.getP_id() + "</td>");
				sb.append("<td>" + p.getP_name() + "</td>");
				sb.append("<td>" + p.getP_email() + "</td>");
				sb.append("<td>" + p.getP_phone() + "</td>");
				if(p.getP_flag()==1){
					sb.append("<td>개인회원</td>");
					sb.append("<td> X </td></tr>");
				}else{
					sb.append("<td>사업자회원</td>");
					sb.append("<td> X </td></tr>");
				}
			}else if(p.getP_state()==1){	
				sb.append("<tr><td><input type='checkbox' name='tot' value='"+p.getP_id()+"'/></td>");
				sb.append("<td>" + p.getP_id() + "</td>");
				sb.append("<td>" + p.getP_name() + "</td>");
				sb.append("<td>" + p.getP_email() + "</td>");
				sb.append("<td>" + p.getP_phone() + "</td>");
				if(p.getP_flag()==1){
					sb.append("<td>일반회원</td>");
					sb.append("<td> O </td></tr>");
				}else{
					sb.append("<td>사업자회원</td>");
					sb.append("<td> O </td></tr>");
				}
			}
			System.out.println(sb);
		}
		sb.append("</table>");
		sb.append("<br/>");
		sb.append("<input type='button' value='블랙리스트 추가' onclick='addBlack()'/>");
		return sb.toString();
	}


	private StringBuilder makeHtml(){
		StringBuilder sb = new StringBuilder();
		sb.append("<input type='button' value='검색하기' onclick='searchList()'/>");
		sb.append("<p><input type='hidden' id='val' name='val'/></p>");
		return sb;
	}

	private void businessDelete() {
		mav = new ModelAndView();
		String p_id = (String) session.getAttribute("p_id");
		if(mDao.personDelete(p_id)!=0){
			session.invalidate();
			mav.addObject("check", 4);
			mav.setViewName("home");
		}else{
			mav.addObject("check", 2);
			mav.setViewName("BusinessMain");
		}

	}

	private void businessMyPage() {
		mav = new ModelAndView();
		String p_id = (String) session.getAttribute("p_id");
		Person p = new Person();
		p = mDao.personUpdatePage(p_id);
		p.setP_gender(p.getP_gender().substring(0,1)+"자");
		Business b = new Business();
		b = mDao.businessUpdatePage(p_id);
		mav.addObject("b",b);
		mav.addObject("p",p);
		mav.setViewName("BusinessMyPage");
	}

	private void businessUpdate(Person p) {
		mav = new ModelAndView();
		String view=null;
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		p.setP_pw(pwdEncoder.encode(p.getP_pw()));
		String p_id = (String) session.getAttribute("p_id");
		p.setP_id(p_id);
		p.setP_phone(req.getParameter("phone1")+"-"+req.getParameter("phone2")+"-"
				+req.getParameter("phone3"));
		String val = req.getParameter("email3");
		if(val.equals("9")){
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			mav.addObject("email7",email2);
			p.setP_email(email1+"@"+email2);
		}else{
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email3");
			mav.addObject("email7",email2);
			p.setP_email(email1+"@"+email2);
		}
		Business b = new Business();
		String b_pid=(String) session.getAttribute("p_id");
		b.setB_pid(b_pid);
		int lisence = Integer.valueOf(req.getParameter("lisence"));
		b.setB_lisence(lisence);
		if(mDao.personUpdate(p)!=0){
			mav.addObject("check", 3);
			session.invalidate(); //세션에 저장된 정보 모두 삭제
			view="home";
		}else{
			mav.addObject("check", 1);
			view="BusinessMain";
		}mav.setViewName(view);
	}


	private void businessUpdateMV() {
		String p_id = (String) session.getAttribute("p_id");
		Person p = new Person();
		p = mDao.personUpdatePage(p_id);
		String[] email = p.getP_email().split("@");
		String email1 = email[0];
		String email2 = email[1];
		String[] phone = p.getP_phone().split("-");
		String phone1 = phone[0];
		String phone2 = phone[1];
		String phone3 = phone[2];
		Business b = new Business();
		b = mDao.businessUpdatePage(p_id);
		RandomNum();
		mav.addObject("email1", email1);
		mav.addObject("email7", email2);
		mav.addObject("phone1", phone1);
		mav.addObject("phone2", phone2);
		mav.addObject("phone3", phone3);
		mav.addObject("p_gender", p.getP_gender());
		mav.addObject("b", b);
		mav.addObject("p",p);
		mav.setViewName("BusinessUpdate");

	}


	private void memberDelete() {
		mav = new ModelAndView();
		String p_id = (String) session.getAttribute("p_id");
		if(mDao.personDelete(p_id)!=0){
			session.invalidate();
			mav.addObject("check", 4);
			mav.setViewName("home");
		}else{
			mav.addObject("check", 2);
			mav.setViewName("PersonMain");
		}
	}


	private void personMyPage() {
		mav = new ModelAndView();
		String p_id = (String) session.getAttribute("p_id");
		Person p = new Person();
		p = mDao.personUpdatePage(p_id);
		p.setP_gender(p.getP_gender().substring(0,1)+"자");

		Member m = new Member();
		m = mDao.memberUpdatePage(p_id);
		String[] addr = m.getM_address().split("/");
		String addr1=addr[1];
		String addr2=addr[2];
		m.setM_address(addr1+" "+addr2);
		mav.addObject("m",m);
		mav.addObject("p",p);
		mav.setViewName("PersonMyPage");
	}


	private void personUpdate(Person p) {
		mav = new ModelAndView();
		String view=null;
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		p.setP_pw(pwdEncoder.encode(p.getP_pw()));
		p.setP_phone(req.getParameter("phone1")+"-"+req.getParameter("phone2")+"-"
				+req.getParameter("phone3"));
		String val = req.getParameter("email3");
		if(val.equals("9")){
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			p.setP_email(email1+"@"+email2);
		}else{
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email3");
			p.setP_email(email1+"@"+email2);
		}
		Member m = new Member();
		String m_pid=(String) session.getAttribute("p_id");
		m.setM_pid(m_pid);
		m.setM_address(req.getParameter("post")+"/"+req.getParameter("addr1")+"/"+
				req.getParameter("addr2"));
		if(mDao.personUpdate(p)!=0){
			if(mDao.memberUpdate(m)!=0){
				mav.addObject("check", 3);
				session.invalidate(); //세션에 저장된 정보 모두 삭제
				view="home";
			}else{mav.addObject("check", 1);
			view="PersonMain";
			}
		}mav.setViewName(view);
	}


	private void joinVCsend(Person p, int check) {
		mav = new ModelAndView();
		updatemail();
		mav.addObject("p", p);
		mav.addObject("pw", req.getParameter("pw"));
		mav.addObject("p_pw", p.getP_pw());
		mav.addObject("p_gender", p.getP_gender());
		mav.addObject("email1", req.getParameter("email1"));
		String val = req.getParameter("email3");
		if(val.equals("9")){
			mav.addObject("email7" , req.getParameter("email2"));
			mav.addObject("flag", 2);
		}else{
			mav.addObject("email7" , req.getParameter("email3"));
			mav.addObject("flag",1);
		}
		mav.addObject("phone1", req.getParameter("phone1"));
		mav.addObject("phone2", req.getParameter("phone2"));
		mav.addObject("phone3", req.getParameter("phone3"));
		String r_num = (String) session.getAttribute("r_num");
		mav.addObject("r_num", r_num);
		mav.addObject("check", 3);
		if(check==1){
			mav.addObject("post", req.getParameter("post"));
			mav.addObject("addr1", req.getParameter("addr1"));
			mav.addObject("addr2", req.getParameter("addr2"));
			mav.setViewName("PersonUpdate");
		}else if(check==2){
			Business b = new Business();
			String p_id = (String) session.getAttribute("p_id");
			b = mDao.businessUpdatePage(p_id);
			mav.addObject("b", b);
			mav.setViewName("BusinessUpdate");
		}
	}

	//update시 인증메일 전송시 사용
	private void updatemail() { 
		Person p = new Person();
		mav=new ModelAndView();
		String host = "smtp.gmail.com"; //smtp 주소
		String subject = "세탁소개팅 인증메일 전송"; 
		String fromName = "세탁소개팅 관리자";
		String from = "tofha56@gmail.com";  //보내는 사람 주소
		String val = req.getParameter("email3");
		mav.addObject("p_gender",req.getParameter("p_gender2"));
		mav.addObject("phone1",req.getParameter("phone1"));
		mav.addObject("phone2",req.getParameter("phone2"));
		mav.addObject("phone3",req.getParameter("phone3"));
		if(val.equals("9")){
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			mav.addObject("email7", email2);
			p.setP_email(email1+"@"+email2);
		}else{
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email3");
			mav.addObject("email7", email2);
			p.setP_email(email1+"@"+email2);
		}
		String to1 = p.getP_email();
		System.out.println(to1);
		String authNum = RandomNum();
		System.out.println(authNum);
		String content = "인증번호 : [" + authNum + "]";
		try{
			Properties props = new Properties();
			//G-mail SMTP 보내는 과정
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props,
					new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("tofha56","kk578578578");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(
					fromName, "UTF-8", "B")));

			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1); 
			msg.setSubject(subject); 
			msg.setSentDate(new java.util.Date()); // 보내는 날짜
			msg.setContent(content, "text/html; charset=euc-kr");

			Transport.send(msg); 
			session.setAttribute("r_num", authNum);
		}catch (MessagingException e){
			e.printStackTrace();
		}catch (Exception e){
			e.printStackTrace();
		}
	}


	private void pwCheck(int save) {
		mav=new ModelAndView();
		Person p = new Person();
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String pw = req.getParameter("pw");
		String p_id = (String) session.getAttribute("p_id");
		p = mDao.personUpdatePage(p_id);
		System.out.println(p.getP_pw());
		if(save==1){
			String[] email = p.getP_email().split("@");
			String email1 = email[0];
			String email2 = email[1];
			String[] phone = p.getP_phone().split("-");
			String phone1 = phone[0];
			String phone2 = phone[1];
			String phone3 = phone[2];
			Member m = new Member();
			m = mDao.memberUpdatePage(p_id);
			String[] addr = m.getM_address().split("/");
			String post=addr[0];
			String addr1=addr[1];
			String addr2=addr[2];
			mav.addObject("p_gender", p.getP_gender());
			mav.addObject("email1", email1);
			mav.addObject("email7", email2);
			mav.addObject("post", post);
			mav.addObject("addr1",addr1);
			mav.addObject("addr2", addr2);
			mav.addObject("phone1", phone1);
			mav.addObject("phone2", phone2);
			mav.addObject("phone3", phone3);
			mav.addObject("p",p);
			if(pwdEncoder.matches(pw,p.getP_pw())){
				mav.addObject("pw", pw);
				mav.addObject("check", 1);
				mav.setViewName("PersonUpdate");
			}else{
				mav.addObject("check", 2);
				mav.setViewName("PersonUpdate");
			}
		}else if(save==2){
			mav.setViewName("MemberDelete");
			if(pwdEncoder.matches(pw,p.getP_pw())){
				mav.addObject("pw", pw);
				mav.addObject("check", 1);
				mav.setViewName("MemberDelete");
			}else{
				mav.addObject("check", 2);
				mav.setViewName("MemberDelete");
			}
		}else if(save==3){
			mav.setViewName("BusinessUpdate");
			String[] email = p.getP_email().split("@");
			String email1 = email[0];
			String email2 = email[1];
			String[] phone = p.getP_phone().split("-");
			String phone1 = phone[0];
			String phone2 = phone[1];
			String phone3 = phone[2];
			mav.addObject("p_gender",p.getP_gender());
			mav.addObject("email1", email1);
			mav.addObject("email7", email2);
			mav.addObject("phone1", phone1);
			mav.addObject("phone2", phone2);
			mav.addObject("phone3", phone3);
			mav.addObject("p",p);
			Business b = new Business();
			b = mDao.businessUpdatePage(p_id);
			mav.addObject("b", b);
			if(pwdEncoder.matches(pw, p.getP_pw())){
				mav.addObject("check", 1);
				mav.addObject("pw", pw);
				mav.setViewName("BusinessUpdate");
			}else{
				mav.addObject("check", 2);
				mav.setViewName("BusinessUpdate");
			}
		}else if(save==4){
			mav.setViewName("BusinessDelete");
			if(pwdEncoder.matches(pw,p.getP_pw())){
				mav.addObject("pw", pw);
				mav.addObject("check", 1);
				mav.setViewName("BusinessDelete");
			}else{
				mav.addObject("check", 2);
				mav.setViewName("BusinessDelete");
			}
		}
	}


	private void personUpdateMV() {
		String p_id = (String) session.getAttribute("p_id");
		Person p = new Person();
		p = mDao.personUpdatePage(p_id);
		String[] email = p.getP_email().split("@");
		String email1 = email[0];
		String email2 = email[1];
		String[] phone = p.getP_phone().split("-");
		String phone1 = phone[0];
		String phone2 = phone[1];
		String phone3 = phone[2];
		Member m = new Member();
		m = mDao.memberUpdatePage(p_id);
		String[] addr = m.getM_address().split("/");
		String post=addr[0];
		String addr1=addr[1];
		String addr2=addr[2];
		RandomNum();
		mav.addObject("p_gender",p.getP_gender());
		System.out.println(p.getP_gender());
		mav.addObject("email1", email1);
		mav.addObject("email7", email2);
		mav.addObject("post", post);
		mav.addObject("addr1",addr1);
		mav.addObject("addr2", addr2);
		mav.addObject("phone1", phone1);
		mav.addObject("phone2", phone2);
		mav.addObject("phone3", phone3);
		mav.addObject("p",p);
		mav.setViewName("PersonUpdate");
	}


	private void findPw() {
		mav = new ModelAndView();
		Person p = new Person();
		int find = (int) session.getAttribute("find"); //이메일 전송 후 저장시켜 놓은 값 (1: 임시비밀번호, 2:인증메일)
		if(find==1){ //email을 보낸 후 세션에 저장시킨 값이 들어오면 실행
			System.out.println("임시비밀번호 전송 후 실행되는 findPw");
			String r_num = (String) session.getAttribute("r_num"); //이메일 전송시 담아둔 임시비밀번호
			String p_id = req.getParameter("p_id");
			p.setP_id(p_id);
			BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
			//임시비밀번호를 복호화시켜서 저장
			String p_pw = pwdEncoder.encode(r_num);
			p.setP_pw(p_pw);
			System.out.println(p.getP_id());
			System.out.println(p.getP_pw());
			int uResult = mDao.changePw(p);
			System.out.println(uResult);
			if(uResult!=0){ //update 성공시
				System.out.println("update성공");
				session.removeAttribute("p_id");
				session.removeAttribute("find");
				mav.addObject("check", 2);
				mav.setViewName("home");
			}else{ //update 실패시
				System.out.println("update 실패");
				mav.addObject("check", 4);
				mav.setViewName("SearchMember"); //비밀번호를 찾지 못했습니다.
			}
			session.removeAttribute("find");
		}else{ //email을 보내기 전에나 세션에 값이 저장되지 않을 경우
			System.out.println("인증메인 전송하기 전이므로 넘어간다!");
			p.setP_id(req.getParameter("p_id"));
			String val = req.getParameter("email6");
			if(val.equals("9")){
				String email1 = req.getParameter("email4");
				String email2 = req.getParameter("email5");
				p.setP_email(email1+"@"+email2);
			}else{
				String email1 = req.getParameter("email4");
				String email2 = req.getParameter("email6");
				p.setP_email(email1+"@"+email2);
			}
			int result = mDao.findPw(p);
			if(result==1){ //입력된 정보를 통해 비밀번호를 찾았다면
				session.setAttribute("p_id", req.getParameter("p_id"));
				String email = p.getP_email();
				searchMail(email);
			}else{//입력된 정보를 통해 비밀번호를 찾지 못했다면
				mav.addObject("check", 3);
				mav.setViewName("SearchMember");
			}
		}
		session.removeAttribute("num");
	}


	//비밀번호 변경시 사용하는 이메일 전송
	private void searchMail(String email) { //임시비밀번호 전송
		String view = null;
		Person p = new Person();
		System.out.println("임시비밀번호 전송한다!");
		mav=new ModelAndView();
		String host = "smtp.gmail.com"; //smtp 주소
		String subject = "세탁소개팅 임시 비밀번호 전송"; 
		String fromName = "세탁소개팅 관리자";
		String from = "tofha56@gmail.com";  //보내는 사람 주소
		String to1 = email;
		System.out.println(email);
		String authNum = RandomNum();
		System.out.println(authNum);
		String content = "임시비밀번호 : [" + authNum + "]";
		try{
			Properties props = new Properties();
			//G-mail SMTP 보내는 과정
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props,
					new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("tofha56","kk578578578");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(
					fromName, "UTF-8", "B")));

			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1); 
			msg.setSubject(subject); 
			msg.setSentDate(new java.util.Date()); // 보내는 날짜
			msg.setContent(content, "text/html; charset=euc-kr");

			Transport.send(msg); 
			session.setAttribute("r_num", authNum);
			mav.addObject("Num", authNum);
		}catch (MessagingException e){
			e.printStackTrace();
		}catch (Exception e){
			e.printStackTrace();
		}
		session.setAttribute("find", 1);
		findPw();
	}



	private void findId() {
		mav = new ModelAndView();
			Person p = new Person();
			int flag = Integer.valueOf(req.getParameter("flag"));
			System.out.println(flag);
			p.setP_name(req.getParameter("p_name"));
			mav.addObject("p_name", req.getParameter("p_name"));
			String email1 = req.getParameter("email1");
			mav.addObject("email1", email1);
			if(flag==2){
				String email2 = req.getParameter("email2");
				p.setP_email(email1+"@"+email2);
				mav.addObject("email7", email2);
				mav.addObject("flag",2);
			}else{
				String email2 = req.getParameter("email3");
				mav.addObject("email7", email2);
				p.setP_email(email1+"@"+email2);
				mav.addObject("flag",1);
			}
			int result = mDao.findId(p);
			System.out.println(result);
			if(result==1){
				String p_id = mDao.getId(p);
				System.out.println(p_id);
				mav.addObject("p_id",p_id);
				mav.addObject("authnum", req.getParameter("authnum"));
				mav.addObject("check", 1); //아이디를 찾았습니다.
				mav.setViewName("SearchMember");
			}else{
				mav.addObject("check", 2); //이름이나 이메일이 틀렸습니다.
				mav.setViewName("SearchMember");
			}session.removeAttribute("Num");
		}

	
	private void businessInsert(Person p) {
		mav = new ModelAndView();
		String view = null;
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		p.setP_id(req.getParameter("b_id"));
		System.out.println(p.getP_id());
		//입력한 암호를 복호화시켜서 저장
		p.setP_pw(pwdEncoder.encode(p.getP_pw()));
		String val = req.getParameter("email6");
		if(val.equals("9")){
			String email1 = req.getParameter("email4");
			String email2 = req.getParameter("email5");
			mav.addObject("email7",email2);
			p.setP_email(email1+"@"+email2);
		}else{
			String email1 = req.getParameter("email4");
			String email2 = req.getParameter("email6");
			mav.addObject("email7",email2);
			p.setP_email(email1+"@"+email2);
		}
		p.setP_phone(req.getParameter("phone4")+"-"+req.getParameter("phone5")+
				"-"+req.getParameter("phone6"));
		p.setP_gender(req.getParameter("p_gender2"));
		p.setP_flag(2);
		p.setP_state(0);
		p.setP_name(req.getParameter("p_name2"));
		if(mDao.personInsert(p)!= 0){
			Business b = new Business();
			b.setB_pid(p.getP_id());
			String lisence = req.getParameter("b_lisence");
			b.setB_lisence(Integer.valueOf(lisence));
			if(mDao.businessInsert(b)!=0){
				mav.addObject("check", 1);
				view="home";
			}else{
				mav.addObject("check", 3);
				view="JoinMember";
			}
		}mav.setViewName(view);
	}



	private void memberInsert(Person p) {
		mav = new ModelAndView();
		session.removeAttribute("p_id");
		String view = null;
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		//입력한 암호를 복호화시켜서 저장
		p.setP_pw(pwdEncoder.encode(p.getP_pw()));
		String val = req.getParameter("email3");
		if(val.equals("9")){
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email2");
			mav.addObject("email7",email2);
			p.setP_email(email1+"@"+email2);
		}else{
			String email1 = req.getParameter("email1");
			String email2 = req.getParameter("email3");
			mav.addObject("email7",email2);
			p.setP_email(email1+"@"+email2);
		}
		p.setP_phone(req.getParameter("phone1")+"-"+req.getParameter("phone2")+
				"-"+req.getParameter("phone3"));
		p.setP_gender(req.getParameter("p_gender"));
		p.setP_flag(1);
		p.setP_state(0);
		if(mDao.personInsert(p)!= 0){
			Member m = new Member();
			m.setM_pid(p.getP_id());
			m.setM_ggrade("브론즈");
			m.setM_address(req.getParameter("post")+"/"+req.getParameter("addr1")+"/"
					+req.getParameter("addr2"));
			if(mDao.memberInsert(m)!=0){
				mav.addObject("check", 1);
				view="home";
			}else{
				mav.addObject("check", 3);
				view="JoinMember";
			}
		}mav.setViewName(view);
	}


	private void idCheck(int check){
		if(check==1){
			String p_id=req.getParameter("p_id");
			System.out.println("회원");
			if(mDao.idCheck(p_id)==0){
				mav.addObject("p_id", p_id);
				mav.addObject("idCheck", "사용 가능한 아이디");
				mav.addObject("save", 1);
				mav.addObject("check", 3);
				mav.addObject("phone1", req.getParameter("phone1"));
				mav.addObject("flag", 5);
			}else{
				mav.addObject("idCheck","중복된 아이디");
				mav.addObject("save", 1);	
			}
		}else{
			String p_id=req.getParameter("b_id");
			System.out.println("사업자");
			if(mDao.idCheck(p_id)==0){
				mav.addObject("b_id", p_id);
				mav.addObject("idCheck", "사용 가능한 아이디");
				mav.addObject("phone4", req.getParameter("phone4"));
				mav.addObject("save", 2);
				mav.addObject("check", 3);
				mav.addObject("flag", 6);
			}else{
				mav.addObject("idCheck", "중복된 아이디");
				mav.addObject("save", 2);
			}
		}
		mav.setViewName("JoinMember");

	}

	private void vcCheck(int check) {
		mav=new ModelAndView();
		String Num = RandomNum();
		session.setAttribute("Num", Num);
		System.out.println(Num);
		if(check==3){
			mav.setViewName("JoinMember");
		}else if(check==4){
			mav.setViewName("SearchMember");
		}
	}

	//난수발생
	public String RandomNum(){
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<=6; i++){
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	//회원가입 때 사용하는 이메일 전송
	private void joinVCsend(int check) {
		mav=new ModelAndView();
		Person p = new Person();
		mav.addObject("idCheck", "사용 가능한 아이디");
		System.out.println(check);
		if(check==1||check==3){
			String val = req.getParameter("email3");
			String email1 = req.getParameter("email1");
			mav.addObject("email1", email1);
			if(val.equals("9")){
				System.out.println("하이");
				String email2 = req.getParameter("email2");
				mav.addObject("flag", 2);
				mav.addObject("email7",email2);
				p.setP_email(email1+"@"+email2);
			}else{
				System.out.println("하이222");
				String email2 = req.getParameter("email3");
				mav.addObject("flag", 1);
				mav.addObject("email7",email2);
				p.setP_email(email1+"@"+email2);
			}
			String email = p.getP_email();
			p.setP_name(req.getParameter("p_name"));
			System.out.println(email);
				if(check==3){
				p.setP_name(req.getParameter("p_name"));
				System.out.println("체크3 email="+p.getP_email());
				System.out.println("체크3 name="+p.getP_name());
				int num = mDao.emailCheck2(p); //아이디 찾기 중 이름과 맞는 이메일이 있는지 체크
				System.out.println("num="+num);
					if(num==0){ //일치하는 정보가 없으면(check==3)
						System.out.println("여기야!");
						mav.addObject("check", 7);
						mav.addObject("email1", null);
						mav.addObject("flag", 5);
						mav.setViewName("SearchMember");
					}else{ //일치하는 정보가 있다면
						join(email);
						mav.addObject("p_name", p.getP_name());
						mav.addObject("check", 6);
						mav.setViewName("SearchMember");
					}
				}else{//check가 1일 때
						p.setP_id(req.getParameter("p_id"));
						mav.addObject("p_id", p.getP_id());
						mav.addObject("p_pw", req.getParameter("p_pw"));
						mav.addObject("p_name", req.getParameter("p_name"));
						mav.addObject("p_gender", req.getParameter("p_gender"));
						mav.addObject("phone1", req.getParameter("phone1"));
						mav.addObject("phone2", req.getParameter("phone2"));
						mav.addObject("phone3", req.getParameter("phone3"));
						int result = mDao.emailCheck4(p);
						System.out.println(result);
						if(result==0){
						join(email);
						mav.addObject("save", 1);
						mav.setViewName("JoinMember");
						}else{
							mav.addObject("email1", null);
							mav.addObject("flag",5);
							mav.setViewName("JoinMember");
					}
				}
				
		}else{
			System.out.println("하이");
			String email1 = req.getParameter("email4");
			mav.addObject("email4", email1);
			String val = req.getParameter("email6");
			if(val.equals("9")){
				String email2 = req.getParameter("email5");
				mav.addObject("email7", email2);
				mav.addObject("flag", 4);
				p.setP_email(email1+"@"+email2);
			}else{
				String email2 = req.getParameter("email6");
				mav.addObject("email7", email2);
				mav.addObject("flag", 3);
				p.setP_email(email1+"@"+email2);
			}
			String email = p.getP_email();
			if(check==4){
				p.setP_id(req.getParameter("p_id"));
				mav.addObject("p_id", req.getParameter("p_id"));
				int num = mDao.emailCheck3(p); //비밀번호 찾기 중 아이디와 일치하는 이메일이이 있는지 체크
				System.out.println("num2="+num);
				if(num==0){
					mav.addObject("email4", null);
					mav.addObject("flag", 6);
					mav.addObject("check", 7);
					mav.setViewName("SearchMember");
				}else{
					join(email);
					mav.addObject("check",6);
					mav.addObject("pid", req.getParameter("p_id"));
					mav.setViewName("SearchMember");
					session.setAttribute("find", 2);
				}
			}else{
				join(email);
				System.out.println("이메일 전송");
				mav.addObject("b_id",req.getParameter("b_id"));
				mav.addObject("p_name",req.getParameter("p_name2"));
				mav.addObject("p_gender", req.getParameter("p_gender2"));
				mav.addObject("p_pw",req.getParameter("p_pw3"));
				mav.addObject("phone4", req.getParameter("phone4"));
				mav.addObject("phone5", req.getParameter("phone5"));
				mav.addObject("phone6", req.getParameter("phone6"));
				mav.addObject("save", 2);
				mav.setViewName("JoinMember");
			}
			
		}
	}

	


	private void join(String email){
		System.out.println(email);
		String host = "smtp.gmail.com"; //smtp 주소
		String subject = "세탁소개팅 인증메일"; 
		String fromName = "세탁소개팅 관리자";
		String from = "tofha56@gmail.com";  //보내는 사람 주소
		//String to1 = email1+"@"+email;
		String authNum = (String) session.getAttribute("Num"); //RandomNum함수를 발생시켜서 저장된 난수
		System.out.println(authNum);
		String content = "인증번호 : [" + authNum + "]";
		try{
			Properties props = new Properties();
			//G-mail SMTP 보내는 과정
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props,
					new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("tofha56","kk578578578");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(
					fromName, "UTF-8", "B")));

			InternetAddress[] address1 = { new InternetAddress(email) };
			msg.setRecipients(Message.RecipientType.TO, address1); 
			msg.setSubject(subject); 
			msg.setSentDate(new java.util.Date()); // 보내는 날짜
			msg.setContent(content, "text/html; charset=euc-kr");

			Transport.send(msg); 
			session.setAttribute("Num", authNum);
			mav.addObject("Num", authNum);
		}catch (MessagingException e){
			e.printStackTrace();
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	private void login(Person p) {
		mav=new ModelAndView();
		String view = null;
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		System.out.println(p.getP_id());
		String pwdEncode = mDao.getSecurityPwd(p.getP_id());
		System.out.println("pw="+pwdEncode);
		if(pwdEncode!=null){
			if(pwdEncoder.matches(p.getP_pw(), pwdEncode)){
				p.setP_id(req.getParameter("p_id"));
				p.setP_pw(pwdEncode);
				System.out.println(mDao.getLoginResult(p));
				if(mDao.getLoginResult(p)!=0){ //로그인 결과
					session.setAttribute("p_id", p.getP_id());
					System.out.println(p.getP_id());
					mav.addObject("p", p);
					int flag=mDao.getFlag(p.getP_id());
					if(flag==1){
						System.out.println("회원");
						view="PersonMain";
					}else if(flag==2){
						System.out.println("사업자");
						view="BusinessMain";
					}else if(flag==3){//플래그 확인 else
						System.out.println("관리자");
						view="AdminMain";
					}else{
						System.out.println("탈퇴회원");
						mav.addObject("check",3);
						view="Login";
					}
				}else{//로그인 결과 else
					mav.addObject("check",1);
					view="Login";
				}
			}else{//비밀번호 일치 else
				mav.addObject("check",1);
				view="Login";
			}
		}else{//id를 통한 pw의 값 else
			mav.addObject("check",2);
			view="Login";
		}
		mav.setViewName(view);
		return;
	}
}
