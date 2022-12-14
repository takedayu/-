<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*" import="controller.*,java.util.*"
    %>
    
<%
@SuppressWarnings("unchecked")
List<Turiage> list=(List<Turiage>)session.getAttribute("list");
@SuppressWarnings("unchecked")
List<Turiage> listno=(List<Turiage>)session.getAttribute("listno");
@SuppressWarnings("unchecked")
List<Mstkokyaku> list2=(List<Mstkokyaku>)session.getAttribute("list2");
@SuppressWarnings("unchecked")
List<Mstseihin> list3=(List<Mstseihin>)session.getAttribute("list3");


//Integer searchno2 = (Integer)session.getAttribute("searchno");
//int searchno = searchno2;
String searchno2 = (String)session.getAttribute("searchno");

Date searchdateST = (Date)session.getAttribute("searchdateST");
Date searchdateEN = (Date)session.getAttribute("searchdateEN");
String searchkokyaku = (String)session.getAttribute("searchkokyaku");
String searchseihin = (String)session.getAttribute("searchseihin");
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

});</script>





<meta charset="UTF-8">
<title>売上一覧</title>
</head>
<body>

<div class="Header">
<header class="headercss">

<button class="buttonselectedcss1" onclick="location.href='/20220915kaihatsu/ReadTURIAGE'">売上表</button>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadTZAIKO'">在庫表</button>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadMSTSEIHIN'">製品マスタ</button>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/ReadMSTKOKYAKU'">顧客マスタ</button>

<span class="headerright">
<span class="shironukicss" style="padding:20px"><%=userid %></span>
<button class="buttoncss1" onclick="location.href='/20220915kaihatsu/Logout'">ログアウト</button>
</span>
</header>

<br>
<button class="buttoncss" type="button" onclick="window.open('/20220915kaihatsu/CreateTURIAGE','null','menubar=0');">新規登録</button><br>

<form action="/20220915kaihatsu/SearchTURIAGE" method="post">

<label class="label" for="searchno1">売上No</label>
	<select name="searchno" id="searchno1">
	<option value="">売上No.を選択</option>

	<%if (searchno2.equals("")){
			for(Turiage box:listno){%>
			<option value=<%=box.getUriageno()%>><%=box.getUriageno()%></option>
			<%}%>
	<%}else{

		int searchno=Integer.parseInt(searchno2);
		for(Turiage box:listno){	
			if(box.getUriageno() == searchno){%>
			<option value=<%=box.getUriageno()%> selected><%=box.getUriageno()%></option>
			<%}else{%>
			<option value=<%=box.getUriageno()%>><%=box.getUriageno()%></option>
			<%}%>
		<%}%>			
			
			
			
			
	<%}%>

	</select>


	<label class="label" for="searchdate2">取引日</label>
	<input type="date" id="searchdate2" name="searchdateST" value="<%= searchdateST %>">
	<p style="display:inline">～</p>
	<input type="date" id="searchdate2" name="searchdateEN" value="<%= searchdateEN %>">

<label class="label" for="searchkokyaku1">顧客コード</label>
	<select name="searchkokyaku" id="searchkokyaku1">
	<option value="">顧客コードを選択</option>
	<%for(Mstkokyaku box:list2){%>
		<% if(box.getKokyaku_code().equals(searchkokyaku)){	%>
		<option value=<%=box.getKokyaku_code()%> selected><%=box.getKokyaku_code()%></option>
	<%}else{%>
		<option value=<%=box.getKokyaku_code()%>><%=box.getKokyaku_code()%></option>
	<%}%>
	<%}%>

	</select>
	
<label class="label" for="searchseihin1">製品コード</label>
	<select name="searchseihin" id="searchseihin1">
	<option value="">製品コードを選択</option>
	<%for(Mstseihin box:list3){%>
		<% if(box.getSeihincode().equals(searchseihin)){	%>
		<option value=<%=box.getSeihincode()%> selected><%=box.getSeihincode()%></option>
	<%}else{%>
		<option value=<%=box.getSeihincode()%>><%=box.getSeihincode()%></option>
	<%}%>
	<%}%>

	</select>

<button class="buttoncss" type="submit">検索</button>
<!-- button type="button" onclick=history.back()>戻る</button> -->
</form>


<div class="listhcss">
<table border="1" id="table">
<thead>
<tr>
<th width="10%" id="0" data-sort="">売上No.</th><th width="15%" id="1" data-sort="">取引日</th><th width="12%" id="2" data-sort="">顧客コード</th><th width="15%" id="3" data-sort="">製品コード</th><th width="15%" id="4" data-sort="">数量</th><th width="26%" id="5" data-sort="">売上高</th><th width="5%"></th>
</tr>
</thead>
</table>
</div>
</div>

<div class="listcss">
<table border="1" id="table" >
<tbody>
<%
for(Turiage uriage:list){
%>

<tr>
<td width="10%"><%=uriage.getUriageno() %></td>
<td width="15%"><%=uriage.getUriagedate() %></td>
<td width="12%"><%=uriage.getKokyakucode() %></td>
<td width="15%"><%=uriage.getSeihincode() %></td>
<td width="15%" style="text-align: right"><%=String.format("%,d",uriage.getUriagesuryo()) %></td>
<td width="26%" id="priceyen" style="text-align: right"><%=String.format("%,d",uriage.getUriage()) %></td>
<td width="5%">
<span class="func">
<a class="cancelbuttoncss" href="/20220915kaihatsu/DeleteTURIAGE?URIAGE_NO=<%=uriage.getUriageno() %>" onclick="return confirm('売上No.<%=uriage.getUriageno()%>を削除してよろしいですか？');">削除</a>
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