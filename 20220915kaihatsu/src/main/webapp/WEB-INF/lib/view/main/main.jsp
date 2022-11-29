<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
String userid = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>トップページ</title>
<link rel="stylesheet" type="text/css" href="style/style.css">

<style>

/*  border: solid 3px #000000;    */
/*    width: 170px;
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
*/

body {
	width:90%;
    margin: 0 auto;
}

</style>

</head>
<body>


<div class="Header">
<header class="headercss">

<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadTURIAGE'">売上表</button>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadTZAIKO'">在庫表</button>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadMSTSEIHIN'">製品マスタ</button>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadMSTKOKYAKU'">顧客マスタ</button>

<span class="headerright">
<span class="shironukicss" style="padding:20px"><%=userid %></span>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/Logout'">ログアウト</button>
</span>

</header>
</div>




</body>
</html>