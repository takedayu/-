<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
String userid = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>問い合わせフォーム</title>
<link rel="stylesheet" type="text/css" href="style/style.css">

<style>

/*
body {
	width:90%;
    margin: 0 auto;
}
*/


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

<!-- 
<div class="Headertoiawase">
<header class="headercss">

<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadTURIAGE'">売上表</button>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadTZAIKO'">在庫表</button>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadMSTSEIHIN'">製品マスタ</button>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadMSTKOKYAKU'">顧客マスタ</button>

<span class="headerright">
<span class="shironukicss" style="padding:20px"><!%=userid %></span>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/Logout'">ログアウト</button>
</span>

</header>
</div>
 -->
<p class="valimessage message">*の項目は入力必須です。</p>

<div class="box">
 
<form action="/20220915kaihatsu/Toiawase" method="post" onsubmit="return kakunin();">

        <label class="label required" for="Name">氏名</label>
        <input type="text" id="name1" name="name" maxlength="20" required>
        <br>
        <label class="label required" for="Mail_address">メールアドレス </label>
        <input type="email" id="mail_address1" name="mail_address" maxlength="80" required>
        <br>
        <label class="label required" for="Tel">電話番号</label>
        <input type="tel" id="Tel1" name="tel" pattern="[0-9]{10,11}" title="10～11桁の半角数字を入力してください。(ハイフン不可)" required>
		<br>
		<label class="label required" for="Inquiry_details">お問い合わせ内容</label>
		<textarea id="inquiry_details1" name="inquiry_details"  rows="10" cols="50" maxlength="250" required></textarea>
		<br>

        <button id="submitbtn" class="buttoncss" type="submit" style="margin: 1em 0;">送信</button>
		<button class="closebuttoncss" type="button" onclick="history.back ()">戻る</button>
        
    </form>
</div>
    
    
<script>
function kakunin() {
	if(confirm('送信してよろしいですか？') == true){
		window.onbeforeunload=null;
		return true;
	}else{
		return false;
	}
}

/*
function closeWin2() {
//	if (confirm('入力内容は破棄されます') == true){
		window.close();
//		}
}
*/

window.onbeforeunload = function(e) {
	  return "ブラウザを閉じても良いでしょうか？"; // 文字列はメッセージに反映されません。必ずreturnすればブランクでもOKです。
}


</script>

</body>
</html>