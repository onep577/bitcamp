<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tname = request.getParameter("tname");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>HR Table</h1>

<pre>
SELECT * FROM <%=tname %>
지정 테이블의 데이터를 출력한다.
</pre>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
/* 패키지명과 함께 클래스명이다 */

String url = "jdbc:oracle:thin:@192.168.0.26:1521:xe";
String user = "hr";
String pass = "hr";

Connection conn = DriverManager.getConnection(url, user, pass);
// 대문자로 넘어오지만 대문자로 안 넘어올 수 있다는 가정도 해야한다
tname = (tname == null || tname.equals(""))?"TAB":tname.toUpperCase();
// null이거나 ""이면 TAB로 대입하고 문제가 없으로 대문자로 바꿔라 : 삼항연산자

String sql = "SELECT * FROM " + tname;

PreparedStatement psmt = conn.prepareStatement(sql);
// 데이터를 가져온다
ResultSet rs = psmt.executeQuery();

ResultSetMetaData rsmd = rs.getMetaData();
// 컬럼을 얻어올 수 있다
int count = rsmd.getColumnCount();
// column의 갯수

%>

<table border="1">
<tr>
<%
	for(int i = 1; i < count + 1; i++){
		// JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
	%>
		<td><%=rsmd.getColumnName(i) %></td>
	<%
	}
%>
</tr>

<%
while(rs.next()){
%>
	<tr>
	<%
		for(int i = 1; i < count + 1; i++){
			// 첫번째 값이 있을 때
			// rs.getString(1) = AD_PRES, rs.getString(2) = President
			// re.getString(3) = 20080, rs.getString(4) = 40000
			%>
			<td>
				<%=rs.getString(i) %>
			</td>
			<%
		}
	%>
	</tr>
<%
}
%>

</table>

<%
if(rs != null) rs.close();
if(psmt != null) psmt.close();
if(conn != null) conn.close();

%>

</body>
</html>