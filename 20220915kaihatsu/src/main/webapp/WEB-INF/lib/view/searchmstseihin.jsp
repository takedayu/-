<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*" import="controller.*,java.util.*"
    %>
    
<%
@SuppressWarnings("unchecked")
List<Mstseihin> list=(List<Mstseihin>)session.getAttribute("list");
@SuppressWarnings("unchecked")
List<Mstseihin> list2=(List<Mstseihin>)session.getAttribute("list2");
@SuppressWarnings("unchecked")
List<Mstseihin> list3=(List<Mstseihin>)session.getAttribute("list3");


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

});</script>





<meta charset="UTF-8">
<title>製品一覧</title>
</head>
<body>

<div class="Header">
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

<br>
<button class="buttoncss" type="button" onclick="window.open('/20220915kaihatsu/CreateMSTSEIHIN','null','menubar=0');">新規登録</button><br>

<form action="/20220915kaihatsu/SearchMSTSEIHIN" method="post">
<label class="label" for="searchcode1">　　製品コード&nbsp;</label>
	<select name="searchcode" id="searchcode1">
	<option value="">製品コードを選択</option>
	<%for(Mstseihin box:list2){%>
		<% if(box.getSeihincode().equals(searchcode)){	%>
		<option value=<%=box.getSeihincode()%> selected><%=box.getSeihincode()%></option>
	<%}else{%>
		<option value=<%=box.getSeihincode()%>><%=box.getSeihincode()%></option>
	
	<%}%>
	<%}%>

	</select>
<label class="label" for="searchname2">　　製品名&nbsp;</label>
<input type="search" id="searchname2" name="searchname" value="<%= searchname %>">
<button class="buttoncss" type="submit">検索</button>
<!-- button type="button" onclick=history.back()>戻る</button> -->
</form>


<div class="listhcss">
<table border="1" id="table">
<thead>
<tr>
<th width="20%" id="0" data-sort="">製品コード</th><th width="40%" id="1" data-sort="">製品名</th><th width="15%" id="2" data-sort="">原価</th><th width="15%" id="3" data-sort="">定価</th><th width="10%"></th>
</tr>
</thead>
</table>
</div>
</div>


<div class="listcss">

<table border="1" id="table" >
<tbody>
<%
for(Mstseihin seihin:list){
%>
<tr>
<td width="20%" id="0" data-sort=""><%=seihin.getSeihincode() %></td>
<td width="40%" id="1" data-sort=""><%=seihin.getSeihinname() %></td>
<td width="15%" id="2" data-sort=""><%=seihin.getSeihingenka() %></td>
<td width="15%" id="3" data-sort=""><%=seihin.getSeihinteika() %></td>
<td width="10%">
<span class="func">
<button class="funcbuttoncss" onClick="window.open('/20220915kaihatsu/UpdateMSTSEIHIN?SEIHIN_CODE=<%=seihin.getSeihincode() %>','null','menubar=0');" >更新</button>
<a class="cancelbuttoncss" href="/20220915kaihatsu/DeleteMSTSEIHIN?SEIHIN_CODE=<%=seihin.getSeihincode() %>" onclick="return confirm('製品コード<%=seihin.getSeihincode()%>を削除してよろしいですか？');">削除</a>
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
<!-- <p>(sessionID=<!%= session.getId() %>)</p> -->
</body>
</html>