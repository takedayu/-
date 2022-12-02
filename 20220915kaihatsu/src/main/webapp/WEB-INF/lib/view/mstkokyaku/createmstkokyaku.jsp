<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
    //Mstseihin tsuika=(Mstseihin)request.getAttribute("tsuika");
//String primary_error=(String)request.getAttribute("製品コードが既に登録されています！");
%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="style/style.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>新規登録</title>
</head>
<body>
<p class="valimessage">*の項目は入力必須です。</p><br>
<form action="/20220915kaihatsu/CreateMSTKOKYAKU" method="post" onsubmit="return kakunin();">
<label class="label required" for="kokyakucode1">顧客コード</label>
	<input id="kokyakucode1" type="text" name="KOKYAKU_CODE" maxlength="10"
	pattern="^[a-zA-Z0-9]+$" title="記号や特殊文字、全角英数字は入力できません。" required><br>
<label class="label required" for="kokyakuname1">　　顧客名</label>
	<input id="kokyakuname1" type="text" name="KOKYAKU_NAME" maxlength="20" required><br>
<label class="label" for="kokyakuaddress1">　　　住所&nbsp;&nbsp;</label>
	<input id="kokyakuaddress1" type="text" name="KOKYAKU_ADDRESS"><br>
<label class="label" for="kokyakutel1">　電話番号&nbsp;&nbsp;</label>
	<input class="no-hyphen" id="kokyakutel1" type="tel" name="KOKYAKU_TEL" 
	pattern="[0-9]{10,11}" title="10～11桁の半角数字を入力してください。(ハイフン不可)"><br><br>
<button id="submitbtn" class="buttoncss" type="submit">追加</button>
<button class="closebuttoncss" type="button" onclick="closeWin2()">閉じる</button>
<script>
/*
$(function(){
	  $('.no-hyphen').keypress(function(e){
	    if((e.which < "0".charCodeAt(0) || "9".charCodeAt(0) < e.which) && e.which != 8 && e.which != 0) {
	      return false;
	    }
	  });
	})
	
	$(function(){
	  $('.no-hyphen').keydown(function(e){
		  if (event.keyCode === 13) {
			  	submitbtn.click();
			    // エンターキーが押されたときの動作
			  }
	  });
	})
*/	


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
</form>
</body>
</html>