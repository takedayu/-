<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*" import="controller.*,java.util.*"
    %>
    
<%
@SuppressWarnings("unchecked")
List<Mstkokyaku> list=(List<Mstkokyaku>)session.getAttribute("list");
@SuppressWarnings("unchecked")
List<Mstkokyaku> list2=(List<Mstkokyaku>)session.getAttribute("list2");
@SuppressWarnings("unchecked")
List<Mstkokyaku> list3=(List<Mstkokyaku>)session.getAttribute("list3");


String searchname = (String)session.getAttribute("searchname");
String searchcode = (String)session.getAttribute("searchcode");
String userid=(String)session.getAttribute("userid");
%>

<!DOCTYPE html>

<html>
<head>

<style>
body {
	width:90%;
    margin: 0 auto;
}
</style>

<link rel="stylesheet" type="text/css" href="style/style.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>

'use strict';

$(function(){

  /**
   * クリックイベント
   */
  $('th').click(function(){
    // 情報取得
    let ele = $(this).attr('id');
    let sortFlg = $(this).data('sort');

    // リセット
    $('th').data('sort', "");

    // ソート順序
    if(sortFlg == "" || sortFlg == "desc"){
      sortFlg = "asc";
      $(this).data('sort', "asc");
    }else{
      sortFlg = "desc";
      $(this).data('sort', "desc");
    }

    // テーブルソート処理
    sortTable(ele, sortFlg);
  });

  /**
   * テーブルソートメソッド
   * 
   * @param ele 
   * @param sortFlg 
   */
  function sortTable(ele, sortFlg){
    let arr = $('table tbody tr').sort(function(a, b){
      // ソート対象が数値の場合
      if($.isNumeric($(a).find('td').eq(ele).text())){
        let aNum = Number($(a).find('td').eq(ele).text());
        let bNum = Number($(b).find('td').eq(ele).text());

        if(sortFlg == "asc"){
          return aNum - bNum;
        }else{
          return bNum - aNum;
        }
      }else{ // ソート対象が数値でない場合
        let sortNum = 1;

        // 比較時は小文字に統一
        if($(a).find('td').eq(ele).text().toLowerCase() > $(b).find('td').eq(ele).text().toLowerCase()){
          sortNum = 1;
        }else{
          sortNum = -1;
        }
        if(sortFlg == "desc"){
          sortNum *= (-1);
        }

        return sortNum;
      }
    });
    $('table tbody').html(arr);
  }

});
</script>





<meta charset="UTF-8">
<title>顧客一覧</title>
</head>
<body>

<div class="Header">
<header class="headercss">

<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadTURIAGE'">売上表</button>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadTZAIKO'">在庫表</button>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadMSTSEIHIN'">製品マスタ</button>
<button class="buttonselectedcss1" onclick="location.href='/20220915kaihatsu/ReadMSTKOKYAKU'">顧客マスタ</button>

<span class="headerright">
<span class="shironukicss" style="padding:20px"><%=userid %></span>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/Logout'">ログアウト</button>
</span>

</header>


<br>
<button class="buttoncss" type="button" onclick="window.open('/20220915kaihatsu/CreateMSTKOKYAKU','null','menubar=0');">新規登録</button><br>

<form action="/20220915kaihatsu/SearchMSTKOKYAKU" method="post">

<label class="label" for="searchcode1">顧客コード</label>
	<select name="searchcode" id="searchcode1">
	<option value="">顧客コードを選択</option>
	<%for(Mstkokyaku box:list2){%>
		<% if(box.getKokyaku_code().equals(searchcode)){	%>
		<option value=<%=box.getKokyaku_code()%> selected><%=box.getKokyaku_code()%></option>
	<%}else{%>
		<option value=<%=box.getKokyaku_code()%>><%=box.getKokyaku_code()%></option>
	
	<%}%>
	<%}%>

	</select>
<label class="label" for="searchname2">顧客名</label>
<input type="search" id="searchname2" name="searchname" value="<%= searchname %>">
<button class="buttoncss" type="submit">検索</button>
<!-- button type="button" onclick=history.back()>戻る</button> -->
</form>

<div class="listhcss">
<table border="1" id="table">
<thead>
<tr>
<th width="12%" id="0" data-sort="">顧客コード</th><th width="28%" id="1" data-sort="">顧客名</th><th width="35%" id="2" data-sort="">住所</th><th width="15%" id="3" data-sort="">電話番号</th><th width="10%"></th>
</tr>
</thead>
</table>
</div>
</div>

<div class="listcss">
<table border="1" id="table">
<tbody>
<%
for(Mstkokyaku kokyaku:list){
%>

<tr>
<td width="12%"><%=kokyaku.getKokyaku_code() %></td>
<td width="28%"><%=kokyaku.getKokyaku_name() %></td>
<td width="35%"><%=kokyaku.getKokyaku_address() %></td>
<td width="15%"><%=kokyaku.getKokyaku_tel() %></td>
<td width="10%">
<span class="func">
<button class="funcbuttoncss" onClick="window.open('/20220915kaihatsu/UpdateMSTKOKYAKU?KOKYAKU_CODE=<%=kokyaku.getKokyaku_code() %>','null','menubar=0');" >更新</button>
<a class="cancelbuttoncss" href="/20220915kaihatsu/DeleteMSTKOKYAKU?KOKYAKU_CODE=<%=kokyaku.getKokyaku_code() %>" onclick="return confirm('顧客コード<%=kokyaku.getKokyaku_code()%>を削除してよろしいですか？');">削除</a>
</span>
</td>
</tr>
<%} %>
</tbody>
</table>
<% if(list.size() == 0){ %>
<p class="errormessage">検索条件に一致するデータが存在しません！</p>
<%} %>
</div>

<div class="Footer">
    <footer>
   <span class="footerright">
	<a class="toiawaseurl" href="/20220915kaihatsu/Toiawase">お問い合わせ</a>
	</span>
    </footer>
</div>
<!-- <p>(sessionID=<!%= session.getId() %>)</p> -->
</body>
</html>