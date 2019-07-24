<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>HR Tab</h1>

<pre>
SELECT * FROM TAB
모든 테이블의 정보를 출력한다
</pre>

<!-- has% 는 $를 포함하고 있는지 알아보는 함수 -->
<!-- contains("$") $가 포함되어 있는지 알아본다 왜? $가 있으면 테이블이 아니다 -->
<%!
public boolean has$(String msg){
	return msg.contains("$");
}
// UtilityClass를 만들어서 없어도 된다
%>



<%
Class.forName("oracle.jdbc.driver.OracleDriver");
/* 패키지명과 함께 클래스명이다 */

String url = "jdbc:oracle:thin:@192.168.0.26:1521:xe";
String user = "hr";
String pass = "hr";

Connection conn = DriverManager.getConnection(url, user, pass);

String sql = "SELECT * FROM TAB";
// 모든 테이블들을 보여준다

PreparedStatement psmt = conn.prepareStatement(sql);

ResultSet rs = psmt.executeQuery();
// select는 executeQuery() select를 제외한 모두 executeUpdate()

ResultSetMetaData rsmd = rs.getMetaData();
// 컬럼정보를 취득할 수 있다
// 결과물 안에 있는 쪼개진 데이터로 가져오겠다
// firstname, lastname등의 이름을 가져올 수 있다

int count = rsmd.getColumnCount();
System.out.println("count : " + count);
// 컬럼 수 3나온다

// imployees 테이블이 아니다
// 지금 가져오는 것은 테이블들을 가져왔다
// 테이블들의 테이블명을 가져왔다
%>



<table border="1">
<tr>
	<%
	for(int i = 1; i < count + 1; i++){
		// 오라클은 1부터 시작이다 0부터하면 안된다
	%>
		<td>
			<%=rsmd.getColumnName(i) %>
		</td>
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
		// i는 1, 2, 3
		// rs.getString(1) = JOBS, rs.getString(2) = TABLE, rs.getString(3) = null
		String cols = rs.getString(i);
		
		// 모든 테이블들의 결과값에서 첫번째 테이블을 가져온다
		if(i == 1 && has$(cols) == false ){
			// 정상적인 테이블일 때
			// i라는 것은 컬럼의 첫번째 부분 즉, TNAME에 해당한다는 뜻이다
			// 1은 TNAME이다 2는 TABTYPE이다
			// cols가 테이블 이름이다
			%>
			<td>
				<!-- 테이블을 클릭하면 그 테이블의 정보를 보고싶다 -->
				<a href="tableInfo.jsp?tname=<%=cols %>"><%=cols %></a>
			</td>
			<%
		}else{
			%>
			<td>
				<!-- 테이블의 이름만 뿌려준다 -->
				<%=rs.getString(i) %>
			</td>
			<%
		}
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