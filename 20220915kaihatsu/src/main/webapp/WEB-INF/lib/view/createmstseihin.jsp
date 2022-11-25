<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
    //Mstseihin tsuika=(Mstseihin)request.getAttribute("tsuika");
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

<form action="/20220915kaihatsu/CreateMSTSEIHIN" method="post" onsubmit="return kakunin();">
<label class="label required" for="seihincode1">製品コード</label>
	<input id="seihincode1" type="text" name="SEIHIN_CODE" maxlength="5" required><br>
<label class="label required" for="seihinname1">　　製品名</label>
	<input id="seihinname1" type="text" name="SEIHIN_NAME" maxlength="20" required><br>
<label class="label" for="seihingenka1">　　　原価&nbsp;&nbsp;</label>
	<input id="seihingenka1" type="text" name="SEIHIN_GENKA" pattern="[0-9]{0,10}" title="10桁以下の半角数字のみ入力可能です。"><br>
<label class="label" for="seihinteika1">　　　定価&nbsp;&nbsp;</label>
	<input id="seihinteika1" type="text" name="SEIHIN_TEIKA" pattern="[0-9]{0,10}" title="10桁以下の半角数字のみ入力可能です。"><br><br>
<button class="buttoncss" type="submit">追加</button>
<button class="closebuttoncss" type="button" onclick="closeWin2()">閉じる</button>

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
	//if (confirm('入力内容は破棄されます') == true){
		window.close();
	//}
}

window.onbeforeunload = function(e) {
	  return "ブラウザを閉じても良いでしょうか？"; // 文字列はメッセージに反映されません。必ずreturnすればブランクでもOKです。
}
</script>
</form>
</body>
</html>