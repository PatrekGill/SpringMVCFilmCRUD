<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Film Details</title>
	</head>
	<body>
		<c:choose> 
			<c:when test="${not empty film }"> 
				<h1>${film.title }</h1>
				<br>
				<p>${film.description }</p>
			</c:when>
			<c:otherwise>
				<h1>Sorry, film couldn't be located</h1>
				<br>
				<a href="home.do">Home</a>
			</c:otherwise>
		</c:choose>
	</body>
</html>