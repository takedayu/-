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


 p {
        font-weight: bolder;
      }

      input {
        width: 300px;
      }

      #name {
        margin-left: 115px;
        margin-bottom: 10px;
      }

      #email {
        margin-left: 35px;
        margin-bottom: 10px;
      }

      #phone {
        margin-left: 83px;
        margin-bottom: 10px;
      }

      .content {
        position: relative;
      }

      .content-label {
        top: 0;
        left: 0;
      }

      #content {
        margin-top: 7px;
        margin-left: 153px;
        height: 200px;
        width: 350px;
      }

      .button {
        margin-top: 30px;
        width: 550px;
        text-align: center;
      }

      button {
        width: 130px;
        height: 30px;
        border: none;
        background-color: skyblue;
        color: white;
        font-size: 113%;
        font-family: MS ゴシック;
      }


</style>

</head>
<body>


<class="Header">
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
</ >










<form action="/20220915kaihatsu/Toiawaseform" method="post" onsubmit="return kakunin();">
    
    
    
    

<div class="name">
        <label for="Name">氏名</label>
        <input type="text" id="name1" name="name" />
      </div>
      <div class="email">
        <label for="Mail_address">メールアドレス </label>
        <input type="text" id="mail_address1" name="mail_address" />
      </div>
      <div class="phone">
        <label for="Tel">電話番号</label>
        <input type="text" id="Tel1" name="tel" />
      </div>
      <div class="content">
        <div class="contet-label">
          <label for="Inquiry_details">お問い合わせ内容</label>
        </div>
        <textarea id="inquiry_details1" name="inquiry_details"></textarea>
      </div>
      <div class="button">
        <button type="submit">送信</button>
      </div>









      
      
      
      
      
      
    </form>
<script>
function kakunin() {
	if(confirm('登録してよろしいですか？') == true){
		window.onbeforeunload=null;
		return true;
	}else{
		return false;
	}
}

function closeWin2() {
//	if (confirm('入力内容は破棄されます') == true){
		window.close();
//		}
}
window.onbeforeunload = function(e) {
	  return "ブラウザを閉じても良いでしょうか？"; // 文字列はメッセージに反映されません。必ずreturnすればブランクでもOKです。
}


</script>

</body>
</html>