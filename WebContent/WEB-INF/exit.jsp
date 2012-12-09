<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" session ="false"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8/">
<title></title>

</head>

<body id = "wrap">

<%	

	request.setCharacterEncoding("utf-8");
	HttpSession session = request.getSession(false);

	String login_id = (String)session.getAttribute("id");

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
	//비밀번호가 일치할경우 세션의 id에 해당하는 레코드 삭제
		String sql = "delete from User where email = \""+login_id+"\"";
		pstmt = con.prepareStatement(sql);
		pstmt.executeUpdate();
		
		if(session != null){//세션종료
		session.invalidate();
		}

%>
	<h1>정상적으로 탈퇴되었습니다</h1><br/><br/>
	<a href="test.jsp">메인으로</a>
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