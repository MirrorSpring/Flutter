<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 주소록</title>
</head>
<body>
<div align="center" style="height:50%">
<div align="center" style="background-color:#e7e7e7;width:50%">
	<h1>Spring 주소록</h1>
	<form action="search" name="search" method="post">
		검색 선택: 
		<select name="condition">
			<option value="address">주소</option>
			<option value="name">이름</option>
			<option value="phone">전화번호</option>
		</select>
		<input type="text" name="query" placeholder="검색어를 입력하세요" value="${query}">
		<input type="submit" value="검색">
	</form>
	
	총 ${size}건
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>이메일</th>
			<th>관계</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><a href="detail_view?id=${dto.id}">${dto.id}</a></td>
				<td>${dto.name}</td>
				<td>${dto.phone}</td>
				<td>${dto.address}</td>
				<td>${dto.email}</td>
				<td>${dto.relationship}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="center"><a href="write_address">등록</a></td>
		</tr>
	</table>
</div>
</div>
</body>
</html>