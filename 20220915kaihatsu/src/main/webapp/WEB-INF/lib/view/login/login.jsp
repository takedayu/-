<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
String userid = (String)request.getAttribute("userid");
String userpassword = (String)request.getAttribute("userpassword");
String errormessage = (String)request.getAttribute("errormessage");
String logoutmessage = (String)session.getAttribute("logoutmessage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
<link rel="stylesheet" type="text/css" href="style/style.css">

<style>
.box {

/*  border: solid 3px #000000;    */
    width: 170px;
      margin-right: auto;
  margin-left: auto;
  text-align: center;

}

.label {
  display:block;
  text-align: left;
  margin-top: 1em;
}

.message{
	margin-top: 1em;
	text-align: center;
}


</style>

</head>
<body>
<div class="message">
<%if(errormessage != null){ %><p class="errormessage"><%=errormessage %></p><%} %>
<%if(logoutmessage != null){ %><p><%=logoutmessage %></p><%} %>
</div>

<div class="box">
<form action="/20220915kaihatsu/Login" method="post">
<label class="label" for="userid">ユーザID</label>
<input class="inputbox" type="search" id="userid" name="USER_ID" <%if(userid != null){ %>value="<%=userid %>"<%} %> required>
<br>
<label class="label" for="userpassword">パスワード</label>
<input class="inputbox" type="password" id="userpassword" name="USER_PASSWORD" <%if(userpassword != null){ %>value="<%=userpassword %>"<%} %> required>
<br>
<div class="loginbutton">
<button class="buttoncss" style="margin-top:1em; margin-bottom:2em;" type="submit">ログイン</button>
<br>
</div>
</form>
	<a class="toiawaseurl" href="/20220915kaihatsu/Toiawase">お問い合わせ</a>
</div>
</body>
</html>