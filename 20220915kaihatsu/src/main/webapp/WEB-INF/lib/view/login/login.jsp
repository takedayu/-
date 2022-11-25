<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
String userid = (String)request.getAttribute("userid");
String userpassword = (String)request.getAttribute("userpassword");
String errormessage = (String)request.getAttribute("errormessage");
String logoutmessage = (String)request.getAttribute("logoutmessage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
<link rel="stylesheet" type="text/css" href="style/style.css">

<style>
.box {
    padding: 0.5em 1em;
    margin: 2em 0;
    width:275px;
      margin-right: auto;
  margin-left: auto;
}

/*style=display:block; margin:0 0 0 auto;*/

</style>

</head>
<body>

<%if(errormessage != null){ %><p class="errormessage"><%=errormessage %></p><%} %>
<%if(logoutmessage != null){ %><p><%=logoutmessage %></p><%} %>
<form action="/20220915kaihatsu/Login" method="post">
<div class="box">
<label class="label" for="userid">ユーザID</label>
<input class="inputbox" type="search" id="userid" name="USER_ID" <%if(userid != null){ %>value="<%=userid %>"<%} %> required>
<br>
<label class="label" for="userpassword">パスワード</label>
<input class="inputbox" type="password" id="userpassword" name="USER_PASSWORD" <%if(userpassword != null){ %>value="<%=userpassword %>"<%} %> required>
<br>
<button class="buttoncss" type="submit">ログイン</button>
</div>

</form>
</body>
</html>