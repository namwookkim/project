<%@ page contentType="text/html;charset=utf-8" import= "java.sql.*" session = "false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8/">
<title></title>
<link rel="stylesheet" type="text/css" href="../stylesheet/buy1.css"/>
<title>Insert title here</title>
<%!

	int doSql(String id, String pw, HttpSession session){

		Connection con = null;
		Statement stmt = null;
		ResultSet rs;
		try {
			String DB_SERVER = "localhost:3306";
			String DB_SERVER_USERNAME = "root";
			String DB_SERVER_PASSWORD = "tiger";
			String DB_DATABASE = "test";
			String JDBC_URL = "jdbc:mysql://" + DB_SERVER + "/" + DB_DATABASE;

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(JDBC_URL, DB_SERVER_USERNAME, DB_SERVER_PASSWORD);
		stmt = con.createStatement();
		//DB에서 입력받은 ID와 PW에 데이터를 찾아 ResultSet에 저장
		String query = "select * from User where email=\""+id+"\"and pw_hash=\""+pw+"\"";
		rs = stmt.executeQuery(query);
			if(rs.next()){
				String u_id = rs.getString("email");
				String u_pw = rs.getString("pw_hash");
				String u_nick = rs.getString("nickname");
				String u_status = rs.getString("status");

				session.setAttribute("id",u_id); //세션에 ID와 PW 유지
				session.setAttribute("pw",u_pw);
				session.setAttribute("nickname",u_nick);
				session.setAttribute("status",u_status);

				rs.close(); 
				stmt.close(); 
				con.close(); 

				return 0;
			}else{
				rs.close(); 
				stmt.close(); 
				con.close(); 

				return 1;
			}

		}catch(Exception e){ 
			e.printStackTrace(); 
		} 
		return 2;
	}
	%>
	<%
	HttpSession session = request.getSession(true);
	String login_id = request.getParameter("userId");
	String login_pw = request.getParameter("userPassword");

	int result = doSql(login_id, login_pw, session);
	if(result == 0){ 
		%>
		<script type="text/javascript">
		alert('로그인 성공!');
		opener.location.href("./test.jsp");
		window.close();
		</script>
	<%
	}else if(result == 1){
		%>
		<script type="text/javascript">
				alert('로그인 실패...아이디나 비밀번호를 확인하세요...');
				history.go(-1);
		</script>
		<%
	}else{
%>
		<script type="text/javascript">
				alert('안되는데?');
		</script>
<%
	}
%>
</head>
<body>

</body>
</html>