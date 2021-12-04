<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Films Filtered</title>
	</head>
<body>
	<%@ include file="nav.jsp" %>
	<c:choose>
		<c:when test="${not empty films }">
			<table>
				
				<c:forEach items="${films}" var="film">
					<tr>
						<td>
							<h3>${film.title}</h3>
								<p>${film.description }</p>
								<c:if test="${not empty film.category }">
									<p>Category: ${film.category}</p>			
								</c:if>
								

							
						
							
							
							<span style="float:left;">
								<form action="deleteFilm.do" method="POST">
									<input type="hidden" name="filmId" value="${film.id }">
									<input type="submit" value="Delete Film">					
								</form>
							</span>
							
							<form action="EditFilm.do" method="GET">
								<input type="hidden" name="id" value="${film.id }">
								<input type="submit" value="Edit Film">					
							</form>					
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<h1>Sorry, film couldn't be located</h1>
			<br>
			
		</c:otherwise>
	</c:choose>

</body>
</html>