<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta name="title" content="Nodus">
<meta name="author" content="박소현" />
<meta name="keywords" content="mindmap" />
<meta name="description" content="join.jsp" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8/">
<title>방 생성</title>

<script type="text/javascript">
function golib(){
	window.close();
	opener.location.href("/library/mindmap_lib.html");
}
</script>
<style type="text/css">
#join_succ_box{
	width:350px; height:131px;
	position: absolute;
	top:80px; left:25px;
	background-image: url("./images/join_back.png");
	text-align: center;
}

p.cong{font-size:15px; font-family:돋움, dotum, verdana, sans-serif; text-align: center; color: #000000; font-weight:  bold;
	position: relative;
	top:40px;}
a,img{border: none;	position: relative; top:20px;}

</style>
</head>

<body id = "wrap">
<%	

	request.setCharacterEncoding("utf-8");

	String subject = request.getParameter("subject");
	int member = Integer.parseInt(request.getParameter("member"));
	String intro = request.getParameter("intro"); 
	boolean is_public;

	if(request.getParameter("selec").equals("공개")){
		is_public = true;
	}else{
		is_public = false;
	}

	Connection con = null;
	PreparedStatement pstmt = null;

	try {
		String DB_SERVER = "localhost:3306";
		String DB_SERVER_USERNAME = "root";
		String DB_SERVER_PASSWORD = "tiger";
		String DB_DATABASE = "test";
		String JDBC_URL = "jdbc:mysql://" + DB_SERVER + "/" + DB_DATABASE;

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(JDBC_URL, DB_SERVER_USERNAME, DB_SERVER_PASSWORD);
		String sql = "insert into Session(title,is_public,max_users,summary,start_node_id,created_at) values(?,?,?,?,1,now())"; 
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setBoolean(2, is_public);
		pstmt.setInt(3, member);
		pstmt.setString(4, intro);
		pstmt.executeUpdate();
%>
		<fieldset style="height:260px">
		<div id="join_succ_box">
		<div id="content_line">
		<div id="join_success">
		<p class="cong"> "<%=subject%>"방이 생성되었습니다</p>
		<br/>
		<br/>
		<input type="button" name="" value="창 닫기"  Onclick="golib(); return false;" />
		</div>
		</div>
		</div>
		</fieldset>
<%
	} catch(Exception e) {
		out.println(e);
	} finally {
		if(pstmt != null) {try {pstmt.close();} catch(SQLException sqle) {}}
		if(con != null) {try {con.close();} catch(SQLException sqle) {}}
	}
%>

</body>
</html>