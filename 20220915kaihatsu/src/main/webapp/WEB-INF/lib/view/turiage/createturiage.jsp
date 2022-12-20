<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
    //Mstseihin tsuika=(Mstseihin)request.getAttribute("tsuika");
@SuppressWarnings("unchecked")
List<Turiage> list2=(List<Turiage>)request.getAttribute("list2");
@SuppressWarnings("unchecked")
List<Tzaiko> zaikolist=(List<Tzaiko>)request.getAttribute("zaikolist");
@SuppressWarnings("unchecked")
List<Mstkokyaku> kokyakulist=(List<Mstkokyaku>)request.getAttribute("kokyakulist");
%>
<!DOCTYPE html>
<html>
<head>



<link rel="stylesheet" type="text/css" href="style/style.css">


<script>
/*
	function closePopUp() {
	  fukidashi.style.display = "none";
	}
	function openPopUp() {
	  closePopUp();
	  fukidashi.style.display = "block";
	}
*/

</script>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>新規登録</title>
</head>
<body>
<p class="valimessage">*の項目は入力必須です。</p>
<p>※製品コードに項目が見当たらない場合は、在庫登録を行ってください。</p><br>
<form action="/20220915kaihatsu/CreateTURIAGE" method="post" onsubmit="return kakunin();">
<label class="label required" for="uriagedate1">取引日</label>
	<input id="uriagedate1" type="date" name="URIAGE_DATE" required><br>
	 
	 <label class="label required" for="kokyakucode1">顧客コード</label>
	<select name="KOKYAKU_CODE" id="kokyakucode1" required>
	<option value="">顧客コードを選択</option>
	<%for(Mstkokyaku box:kokyakulist){%>
		<option value=<%=box.getKokyaku_code()%>><%=box.getKokyaku_code()%></option>
	<%}%>
	</select><br>
	
	
<label class="label required" for="seihincode1">製品コード</label>
	<select class="seihinlist" name="SEIHIN_CODE" id="seihincode1" required>
	<option value="">製品コードを選択</option>
	<%for(Tzaiko box:zaikolist){%>
		<option value=<%=box.getSeihincode()%>><%=box.getSeihincode()%></option>
	<%}%>
	</select>
	<br>
	
<label class="label required" for="uriagesuryo1">数量</label>
	<input class="no-comma" id="uriagesuryo1" type="text" name="URIAGE_SURYO"
	pattern="[0-9]{0,5}" title="5桁以下の半角数字を入力してください。（記号不可）" required><br>
<label class="label" for="uriage1">売上高</label>
	<input class="no-comma" id="uriage1" type="text" name="URIAGE"
	pattern="[0-9]{0,10}" title="10桁以下の半角数字を入力してください。（記号不可）"><br><br>
<button id="submitbtn" class="buttoncss" type="submit">登録</button>
<button class="closebuttoncss" type="button" onclick="closeWin2()">閉じる</button>
<script>
/*
$(function(){
	  $('.no-comma').keypress(function(e){
	    if((e.which < "0".charCodeAt(0) || "9".charCodeAt(0) < e.which) && e.which != 8 && e.which != 0) {
	      return false;
	    }
	  });
	})
	
	$(function(){
	  $('.no-comma').keydown(function(e){
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