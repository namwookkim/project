<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" session ="false"%>

<%
	HttpSession session = request.getSession(false);
	if(session != null){
		session.invalidate(); //세션종료
	}
%>
<script>
alert("로그아웃 하셨습니다.");
location.href="test.jsp";

</script>