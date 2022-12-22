<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function valuecheck(){
	var regExpName = /^[가-힣]+$/;
	var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
	var regExpEmail=/^[a-zA-Z0-9_]+?@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
	
	var form=document.insert;
	var name=form.name.value;
	var phone=form.phone.value;
	var email=form.email.value;
	
	if(!regExpName.test(name)){
		alert("이름은 한글만 입력이 가능합니다.");
		form.name.select();
		return;
	}
	if(!regExpPhone.test(phone)){
		alert("전화번호 입력을 확인해 주세요.");
		form.phone.select();
		return;
	}
	if(!regExpEmail.test(email)){
		alert("이메일 입력을 확인해 주세요.");
		form.phone.select();
		return;
	}
	form.submit();
}
</script>
</head>
<body>
<div align="center">
<h3>주소록 입력</h3>
<form name="insert" action="write">
<table>
<tr>
<td>이름: </td>
<td><input type="text" name="name"></td>
</tr>
<tr>
<td>전화번호: </td>
<td><input type="text" name="phone"></td>
</tr>
<tr>
<td>주소: </td>
<td><input type="text" name="address"></td>
</tr>
<tr>
<td>이메일: </td>
<td><input type="text" name="email"></td>
</tr>
<tr>
<td>관계: </td>
<td><input type="text" name="relationship"></td>
</tr>
	<tr>
		<td colspan="2"><input type="button" value="등록" onclick="valuecheck()">&nbsp;&nbsp;&nbsp;&nbsp;<a href="list">목록보기</a></td>
	</tr>
</table>
</form>
</div>
</body>
</html>