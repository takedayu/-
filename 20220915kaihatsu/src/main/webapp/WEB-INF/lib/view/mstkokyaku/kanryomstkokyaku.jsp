<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>完了</title>

<%request.setAttribute("登録が完了しました。",("登録が完了しました。")); %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
		window.onload = function() {
			//親ウィンドウをReadに画面遷移させる
			window.opener.location.href = "/20220915kaihatsu/ReadMSTKOKYAKU";
				  //画面を閉じる
				  window.close();
				}
</script>

</head>
<body>
</body>
</html>