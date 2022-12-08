<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
Mstkokyaku koushin=(Mstkokyaku)request.getAttribute("koushin");
//String searchname = (String)session.getAttribute("searchname");
//String searchcode = (String)session.getAttribute("searchcode");

%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="style/style.css">

<script>

</script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>更新画面</title>
</head>
<body>
<form name="updatem" action="/20220915kaihatsu/UpdateMSTKOKYAKU" method="Post" onsubmit="return kakunin();">
<p class="valimessage">*の項目は入力必須です。</p><br>
<label class="label">顧客コード</label>
<p style="display:inline"><%= koushin.getKokyaku_code() %></p><br>

<!-- 製品コード：<input type="text" name="SEIHIN_CODE" value="<!%=koushin.getSeihincode() %>"><br> -->
			<input type="hidden" name="KOKYAKU_CODE" value="<%=koushin.getKokyaku_code() %>">
<label class="label required" for="kokyakuname1">顧客名</label>
	<input id="kokyakuname1" type="text" name="KOKYAKU_NAME" maxlength="20" required value="<%=koushin.getKokyaku_name() %>"><br>
<label class="label" for="kokyakuaddress1">住所</label>
	<input id="kokyakuaddress1" type="text" name="KOKYAKU_ADDRESS" maxlength="50" value="<%=koushin.getKokyaku_address()%>"><br>
<label class="label" for="kokyakutel1">電話番号</label>
	<input class="no-hyphen" id="kokyakutel1" type="tel" name="KOKYAKU_TEL" value="<%=koushin.getKokyaku_tel() %>" 
	pattern="[0-9]{10,11}" title="10～11桁の半角数字を入力してください。（ハイフン不可）"><br>
<br>
<button id="submitbtn" class="buttoncss" type="submit">更新</button>
<!-- <button class="buttoncss" type="submit" onclick="confirm('更新してよろしいですか？')">更新</button> -->
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