<%@page import="java.io.PrintWriter"%>
<%@page import="Dao.MemberDao"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<%
	request.setCharacterEncoding("UTF-8");
	 
	 String id = request.getParameter("id");
	 String password = request.getParameter("password");
	 String passwordcheck = request.getParameter("passwordcheck");
	 String name = request.getParameter("name");
	 String sex = request.getParameter("sex");
	 String phone = request.getParameter("phone");
	 
	 int resdentnum = Integer.parseInt(request.getParameter("resdentnum"));
	 
	 String company = request.getParameter("company");
	 String interset1 = request.getParameter("interset1");
	 if( interset1 == null ) interset1="";
	 String interset2 = request.getParameter("interset2");
	 if( interset2 == null ) interset2="";
	 String interset3 = request.getParameter("interset3");
	 if( interset3 == null ) interset3="";
	 String interset4 = request.getParameter("interset4");
	 if( interset4 == null ) interset4="";
	 String interset5 = request.getParameter("interset5");
	 if( interset5 == null ) interset5="";
	 String interset6 = request.getParameter("interset6");
	 if( interset6 == null ) interset6="";
	 String interset7 = request.getParameter("interset7");
	 if( interset7 == null ) interset7="";
	 String interset8 = request.getParameter("interset8");
	 if( interset8 == null ) interset8="";
	 String interset9 = request.getParameter("interset9");
	 if( interset9 == null ) interset9="";
	 String interset10 = request.getParameter("interset10");
	 if( interset10 == null ) interset10="";
	 String benefit = interset1+"/"+interset2+"/"+interset3+"/"+interset4+"/"+interset5+"/"+interset6+"/"+interset7+"/"+interset8+"/"+interset9+"/"+interset10;
	
	 String type1 =request.getParameter("type1");
	 if( type1 == null ) type1="";
	 String type2 =request.getParameter("type2");
	 if( type2 == null ) type2="";
	 String type3 =request.getParameter("type3");
	 if( type3 == null ) type3="";
	 String type = type1+"/"+type2+"/"+type3;
	 
	 MemberDto dto = new MemberDto();
	 dto.setMember_id(id);
	 dto.setMember_password(password);
	 dto.setMember_name(name);
	 dto.setMember_sex(sex);
	 dto.setMember_phone(phone);
	 dto.setMember_resdentnum(resdentnum);
	 dto.setMember_cardcompany(company);
	 dto.setMember_cardbenefit(benefit);
	 dto.setMember_cardtype(type);
	 
	 out.print( dto.getMember_id());
	 out.print( dto.getMember_password());
	 out.print( dto.getMember_name());
	 out.print( dto.getMember_sex());
	 out.print( dto.getMember_phone());
	 out.print( dto.getMember_resdentnum());
	 out.print( dto.getMember_cardcompany());
	 out.print( dto.getMember_cardbenefit());
	 out.print( dto.getMember_cardtype());
	 
	 
	 
	 
	 MemberDao dao = MemberDao.getinstance();
	 
	 int result = dao.signup(dto);
	 
	 if( result == 1 ){  
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공 되었습니다 .');");
			script.println("location.href ='/Card/Main_jsp/section.jsp'");
			script.println("</script>");
		}
	 
		else{
			
			PrintWriter script =response.getWriter();
			script.println("<script>");
/* 			script.println("location.href ='/Card/Member/signup.jsp?cancel=1'"); */
			script.println("</script>");
		}
		
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 %>
</body>
</html>