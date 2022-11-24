<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
String userid = (String)request.getAttribute("userid");
String userpassword = (String)request.getAttribute("userpassword");
String errormessage = (String)request.getAttribute("errormessage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
</head>
<body>
<%if(errormessage != null){ %><p><%=errormessage %></p><%} %>
<form action="/20220915kaihatsu/Entry" method="post">

<label class="label" for="userid">ID</label>
<input type="search" id="userid" name="USER_ID" <%if(userid != null){ %>value="<%=userid %>"<%} %> required>
<label class="label" for="userpassword">パスワード</label>
<input type="password" id="userpassword" name="USER_PASSWORD" <%if(userpassword != null){ %>value="<%=userpassword %>"<%} %> required>

<button class="buttoncss" type="submit">ログイン</button>

</form>
</body>
</html>