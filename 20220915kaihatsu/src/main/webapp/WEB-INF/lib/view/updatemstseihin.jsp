<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
Mstseihin koushin=(Mstseihin)request.getAttribute("koushin");
//String searchname = (String)session.getAttribute("searchname");
//String searchcode = (String)session.getAttribute("searchcode");

%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="style/style.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>更新画面</title>
</head>
<body>
<form name="updatem" action="/20220915kaihatsu/UpdateMSTSEIHIN" method="Post" onsubmit="return kakunin();">
<p class="valimessage">*の項目は入力必須です。</p><br>
<label class="label">製品コード&nbsp;&nbsp;</label>
<p style="display:inline"><%= koushin.getSeihincode() %></p><br>
<!-- 製品コード：<input type="text" name="SEIHIN_CODE" value="<!%=koushin.getSeihincode() %>"><br> -->
			<input type="hidden" name="SEIHIN_CODE" value="<%=koushin.getSeihincode() %>">
			
<label class="label required" for="seihinname1">　　製品名</label>
	<input id="seihinname1" type="text" name="SEIHIN_NAME" maxlength="20" required value="<%=koushin.getSeihinname() %>"><br>
	
<label class="label" for="seihingenka1">　　　原価&nbsp;&nbsp;</label>
	<input id="seihingenka1" type="text" name="SEIHIN_GENKA" value="<%=koushin.getSeihingenka()%>"
	pattern="[0-9]{0,10}" title="10桁以下の半角数字のみ入力可能です。"><br>
	
<label class="label" for="seihinteika1">　　　定価&nbsp;&nbsp;</label>
	<input id="seihinteika1" type="text" name="SEIHIN_TEIKA" value="<%=koushin.getSeihinteika() %>"
	pattern="[0-9]{0,10}" title="10桁以下の半角数字のみ入力可能です。"><br>
<br>
<button class="buttoncss" type="submit">更新</button>
<!-- <button name="btn" onclick="confirmsubmit()">更新</button> -->

<button class="closebuttoncss" type="button" onclick="closeWin2();">閉じる</button>

<script>
function kakunin() {
	if(confirm('更新してよろしいですか？') == true){
		window.onbeforeunload=null;
		return true;
	}else{
		return false;
	}
}

function closeWin2() {
//	if (confirm('更新を中断しますか？') == true){
		window.close();
//		}
}
window.onbeforeunload = function(e) {
	  return "ブラウザを閉じても良いでしょうか？"; // 文字列はメッセージに反映されません。必ずreturnすればブランクでもOKです。
}
</script>

<script>
/*
function confsub() {
	if (confirm('更新してよろしいですか？') == true){
		return true
		}
	return false;
}

function confirmsubmit() {
	if (confirm('更新してよろしいですか？') == true){
		document.updatem.submit();
		}
	return false;
}
*/

/*
document.updatem.btn.addEventListener('click', function() {
    document.updatem.submit();
});
*/
			<!--	  //formオブジェクトを取得する
				  var fm = document.getElementById("fm1");
				  //Submit値を操作したい場合
				  document.getElementById("1").value = "値を自動入力";
				  document.getElementById("2").value = "値を自動入力";
				  document.getElementById("3").value = "値を自動入力";
				  document.getElementById("4").value = "値を自動入力";
				  //Submit実行
				  fm.submit();
				  //画面を閉じる
				  window.close();
				}-->

</script>

</form>
</body>
</html>