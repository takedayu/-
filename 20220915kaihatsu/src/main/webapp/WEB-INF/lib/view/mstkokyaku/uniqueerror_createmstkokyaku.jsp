<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
    Mstkokyaku mstkokyaku=(Mstkokyaku)request.getAttribute("mstkokyaku");
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

<p class="valimessage"><b>顧客コードが既に登録されています！</b></p>

<p class="valimessage">*の項目は入力必須です。</p><br>

<form action="/20220915kaihatsu/CreateMSTKOKYAKU" method="post">
<label class="label required" for="kokyakucode1">顧客コード</label>
	<input id="kokyakucode1" type="text" name="KOKYAKU_CODE" value="<%=mstkokyaku.getKokyaku_code() %>" maxlength="5" required><br>



<label class="label required" for="kokyakuname1">　　顧客名</label>
	<input id="kokyakuname1" type="text" name="KOKYAKU_NAME" value="<%=mstkokyaku.getKokyaku_name() %>" maxlength="20" required><br>
<label class="label" for="kokyakuaddress1">　　　住所&nbsp;&nbsp;</label>
	<input id="kokyakuaddress1" type="text" name="KOKYAKU_ADDRESS" value="<%=mstkokyaku.getKokyaku_address() %>"><br>
<label class="label" for="kokyakutel1">　電話番号&nbsp;&nbsp;</label>
	<input id="kokyakutel1" type="text" name="KOKYAKU_TEL" value="<%=mstkokyaku.getKokyaku_tel() %>"
	pattern="[0-9]{10,11}" title="10～11桁の半角数字（ハイフンなし）"><br><br>
<button class="buttoncss" type="submit">追加</button>
<button class="cancelbuttoncss" type="button" onclick="closeWin2()">閉じる</button>
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
</form>
</body>
</html>