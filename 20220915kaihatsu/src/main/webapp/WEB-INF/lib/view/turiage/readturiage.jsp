<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>  
<%
@SuppressWarnings("unchecked")
List<Turiage> list=(List<Turiage>)request.getAttribute("list");
@SuppressWarnings("unchecked")
List<Turiage> list2=(List<Turiage>)request.getAttribute("list2");
@SuppressWarnings("unchecked")
List<Turiage> list3=(List<Turiage>)session.getAttribute("list3");
String kanryomessage=(String)session.getAttribute("kanryomessage");
%>



<!DOCTYPE html>

<html>
<head>

<style>

/*
.indicator::before {
  content: "";
  height: 100px;
  width: 100px;
  position: absolute;
  border: 50px solid transparent;;
  border-bottom-color: #aaa;
  margin-top: -5px;
}

.indicator::after {
  content: "";
  height: 100px;
  width: 100px;
  position: absolute;
  border: 50px solid transparent;;
  border-top-color: #555;
  margin-top: 105px;
}
*/

.listcss{
    overflow: auto;
     /*width: 100%;*/
    height: 400px;
}
.listcss table{
    margin: 0;
    border-spacing: 0;
    /*table-layout: fixed;*/
    width: 100%;
	/*height:200%;*/
	
}

.listcss td{
    white-space: nowrap;
    border-right: 1px solid #999;
    border-bottom: 1px solid #999;
    background: #FFF;
    /*padding: 2px;
    height: 30%;*/
}

.listcss tr:nth-child(even) td{
	background: #ffffe0;
}

.listcss th{
	cursor: pointer;
    white-space: nowrap;
    border-right: 1px solid #999;
    border-bottom: 1px solid #999;
    background: #f2f2f2;
    position: sticky;
    top: 0;
    left: 0;
	height: 100%;
	
}



.listcss th::before, .listcss th::after {
  content: "";
  height: 0;
  width: 0;
  position: absolute;
  border: 5px solid transparent;
  right: 7px;
  top: 50%;
}

.listcss th::before {
    border-bottom-color: #aaa;
    margin-top: -10px;
}
.listcss th::after {
    border-top-color: #aaa;
    margin-top: 2px;
}





.errormessage {
	color: #ff0000;
}



.buttoncss {
  display       : inline-block;
  font-size     : 12pt;        /* 文字サイズ */
  text-align    : center;      /* 文字位置   */
  cursor        : pointer;     /* カーソル   */
  padding       : 7px 8px;   /* 余白       */
  background    : #007749;     /* 背景色     */
  color         : #ffffff;     /* 文字色     */
  line-height   : 1em;         /* 1行の高さ  */
  opacity       : 1;         /* 透明度     */
  transition    : .3s;         /* なめらか変化 */
  border: none;/*線を消す*/
  text-decoration: none; 
  
}
.buttoncss:hover {
  background    : rgb(0,140,86);     /* 背景色     */
}

.buttoncss:active {
 /* border-bottom: solid 2px #fd9535;
  box-shadow: 0 0 2px rgba(0, 0, 0, 0.30);*/
  background    : #007749;     /* 背景色     */   */  
}


.funcbuttoncss {
  display       : inline-block;
  font-size     : 12pt;        /* 文字サイズ */
  text-align    : center;      /* 文字位置   */
  cursor        : pointer;     /* カーソル   */
  padding       : 4px 5px;   /* 余白       */
  background    : #007749;     /* 背景色     */
  color         : #ffffff;     /* 文字色     */
  line-height   : 1em;         /* 1行の高さ  */
  opacity       : 1;         /* 透明度     */
  transition    : .3s;         /* なめらか変化 */
  border: none;/*線を消す*/
  text-decoration: none; 
  
}
.funcbuttoncss:hover {
  background    : rgb(0,140,86);     /* 背景色     */
}

.funcbuttoncss:active {
 /* border-bottom: solid 2px #fd9535;
  box-shadow: 0 0 2px rgba(0, 0, 0, 0.30);*/
  background    : #007749;     /* 背景色     */   */  
}


.func {
      display: flex;
  justify-content: space-evenly;
}





body {
	width:90%;
    margin: 0 auto;
}

.label{
/* 背景の上から95％に色をつける */
background:linear-gradient(to bottom,#f2f2f2 0% 95%, rgba(0,0,0,0) 95% 100%);
}

    p{
margin:0 0 0em; /*上 左右 下*/
}

</style>


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



<!-- link rel="stylesheet" type="text/css" href="<!%= request.getContextPath() %>/style/style.css"> -->
<meta charset="UTF-8">
<title>売上一覧</title>
</head>
<body>

<a href="/20220915kaihatsu/ReadTURIAGE">
    <button   class="buttoncss"   type="button">売上表</button>
</a>

<a href="/20220915kaihatsu/ReadTZAIKO">
    <button    class="buttoncss"  type="button">在庫表</button>
</a>

<a href="/20220915kaihatsu/ReadMSTSEIHIN">
    <button    class="buttoncss"  type="button">製品マスタ</button>
</a>

<a href="/20220915kaihatsu/ReadMSTKOKYAKU">
    <button    class="buttoncss"  type="button">顧客マスタ</button>
</a>
<br>
<br>
<%if(kanryomessage != null){ %>
<p><%=kanryomessage %></p>
<%} %>
<button class="buttoncss" type="button" onclick="window.open('/20220915kaihatsu/CreateTURIAGE','null','menubar=0');">新規登録</button><br>

<form action="/20220915kaihatsu/SearchTURIAGE" method="post">

<label class="label" for="searchno1">　　売上No&nbsp;</label>
	<select name="searchno" id="searchno1">
	<option value="">売上No.を選択　 </option>
	<%for(Turiage box:list2){%>
		<option value=<%=box.getUriageno()%>><%=box.getUriageno()%></option>
	<%}%>
	</select>
	
	<label class="label" for="searchdate2">　　取引日&nbsp;</label>
	<input type="date" id="searchdate2" name="searchdateST">
	<p style="display:inline">～</p>
	<input type="date" id="searchdate2" name="searchdateEN">
	
<label class="label" for="searchkokyaku1">　　顧客コード&nbsp;</label>
	<select name="searchkokyaku" id="searchkokyaku1">
	<option value="">顧客コードを選択</option>
	<%for(Turiage box:list2){%>
		<option value=<%=box.getKokyakucode()%>><%=box.getKokyakucode()%></option>
	<%}%>
	</select>
	
<label class="label" for="searchseihin1">　　製品コード&nbsp;</label>
	<select name="searchseihin" id="searchseihin1">
	<option value="">製品コードを選択</option>
	<%for(Turiage box:list2){%>
		<option value=<%=box.getSeihincode()%>><%=box.getSeihincode()%></option>
	<%}%>
	</select>

<button class="buttoncss" type="submit">検索</button>

</form>

<!-- 
<!% if(list3!=null && list3.size() == 1){ %>
<script>
	alert('ORA-02292: 整合性制約に違反しています！')
</script>
<!%} %>
 -->

<div class="listcss">
<table border="1" id="table" >
<thead>
<tr>
<th width="10%" id="0" data-sort="">売上No.</th><th width="15%" id="1" data-sort="">取引日</th><th width="12%" id="2" data-sort="">顧客コード</th><th width="12%" id="3" data-sort="">製品コード</th><th width="15%" id="4" data-sort="">数量</th><th width="31%" id="5" data-sort="">売上高</th><th width="5%"></th>
</tr>
</thead>
<tbody>
<%
for(Turiage uriage:list){
%>

<tr>
<td><%=uriage.getUriageno() %></td>
<td><%=uriage.getUriagedate() %></td>
<td><%=uriage.getKokyakucode() %></td>
<td><%=uriage.getSeihincode() %></td>
<td><%=uriage.getUriagesuryo() %></td>
<td><%=uriage.getUriage() %></td>
<td>
<span class="func">
<a class="funcbuttoncss" href="/20220915kaihatsu/DeleteTURIAGE?URIAGE_NO=<%=uriage.getUriageno() %>" onclick="return confirm('製品コード<%=uriage.getUriageno()%>を削除してよろしいですか？');">削除</a>
</span>
 <!-- 
<button onclick="deleteshori();">削除</button>
<script>
function deleteshori() {
	if (confirm('製品コード<!%=seihin.getSeihincode()%>を削除してよろしいですか？') == true){
		location.href="/20220915kaihatsu/DeleteMSTSEIHIN?SEIHIN_CODE=<!%=seihin.getSeihincode() %>";
		}
}
</script>
-->
</td>
</tr>
<%} %>
</tbody>



</table>
</div>
</body>
</html>