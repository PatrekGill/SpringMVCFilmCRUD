<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang='en'>
	<head>
		<meta charset="UTF-8">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>