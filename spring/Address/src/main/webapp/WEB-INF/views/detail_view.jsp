<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>주소록 입력</h3>
<form action="update">
<input type="hidden" name="id" value="${detail_view.id }">
<table>
<tr>
<td>이름: </td>
<td><input type="text" name="name" value="${detail_view.name}"></td>
</tr>
<tr>
<td>전화번호: </td>
<td><input type="text" name="phone" value="${detail_view.phone}"></td>
</tr>
<tr>
<td>주소: </td>
<td><input type="text" name="address" value="${detail_view.address}"></td>
</tr>
<tr>
<td>이메일: </td>
<td><input type="text" name="email" value="${detail_view.email}"></td>
</tr>
<tr>
<td>관계: </td>
<td><input type="text" name="relationship" value="${detail_view.relationship}"></td>
</tr>
	<tr>
		<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;&nbsp;&nbsp;<a href="list.do">목록보기</a>
		&nbsp;&nbsp;&nbsp;&nbsp;<a href="delete?id=${detail_view.id}">삭제</a></td>
	</tr>
</table>
</form>
</div>
</body>
</html>