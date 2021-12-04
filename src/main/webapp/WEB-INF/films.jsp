<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Films Filtered</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty films }">
			<c:forEach items="films" var="film" >
				<h1>${film.title}</h1>
				<br>
				<p>${film.description }</p>
				
			</c:forEach>
		</c:when>
		<c:otherwise>
			<h1>Sorry, film couldn't be located</h1>
			<br>
			<a href="home.do">Home</a>
		</c:otherwise>
	</c:choose>

</body>
</html>