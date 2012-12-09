<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta charset="utf-8">
	<meta name="title" content="Nodus">
	<meta name="author" content="박소현" />
	<meta name="keywords" content="mindmap" />
	<meta name="description" content="idchk.jsp" />
		<title>ID 중복확인</title>
	</head>
	<body>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
try {
		String DB_SERVER = "localhost:3306";
		String DB_SERVER_USERNAME = "root";
		String DB_SERVER_PASSWORD = "tiger";
		String DB_DATABASE = "test";

		String JDBC_URL = "jdbc:mysql://" + DB_SERVER + "/" + DB_DATABASE;

		Class.forName("com.mysql.jdbc.Driver");

		con = DriverManager.getConnection(JDBC_URL, DB_SERVER_USERNAME, DB_SERVER_PASSWORD);
		String sql = "select email from User where email=?"; 
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
	}catch(Exception e){out.print(e);}

	if(rs.next()){
%>
	<p><%=id%>는 중복되는 아이디입니다.</p>
	<input type='button' value='닫기' onclick="window.close();"/>
<%	
	}else{
%>
	<p><%=id%>는 사용가능한 아이디입니다.</p>
	<input type='button' value='닫기' onclick="opener.idcheck=true; window.close();"/>
<%	}
%>

</body>
</html>