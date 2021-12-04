<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang='en'>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>Film Details</title>
	</head>
	<body>
		<%@ include file="nav.jsp" %>
		<c:if test="${not empty newlyCreated }">
			<h2>Creation of Film Succeeded!</h2>
		</c:if>
		<c:if test="${not empty error }">
			<h3>${error }</h3>
		</c:if>
		
		<c:choose> 
			<c:when test="${not empty film }"> 
				<h3>Film ID: ${film.id }</h3>

				<form action="GetFilmData.do" id="filmDetails" method="POST">
				 	<input type="hidden" name="id" value="${film.id }">
				 	
					<table>
						<tr>
							<td>
								<label for="title">Title</label> 
							</td>
							<td>
								${film.title}
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="description">Description</label>
							</td>
							<td>
							 	${film.description }
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="releaseYear">Release Year</label>
							</td>
							<td>
								${film.releaseYear }							 	
							</td>
						</tr>

						<tr>
							<td>
								<label for="languageId">Language ID:</label>
							</td>
							<td>
								${film.languageId }
								(${film.language })							 	
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="rentalDuration">Rental Duration:</label>
							</td>
							<td>
								${film.rentalDuration }
								(Days)
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="rentalRate">Rental Rate:</label>
							</td>
							<td>
								${film.rentalRate }
								$
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="length">Film Length:</label>
							</td>
							<td>
								${film.length }
								(Minutes)
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="replacementCost">Replacement Cost:</label>
							</td>
							<td>
								${film.replacementCost }
								$							 	
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="rating">Rating:</label>
							</td>
							<td>
								${film.rating }
								
							</td>
						</tr>
						
						<c:if test="${not empty film.category }">
							<tr>
								<td>
									<label for="category">Category:</label>
								</td>
								<td>
									${film.category }
									
								</td>
							</tr>			
						</c:if>
						
						<tr>
							<td>
								<label for="actors">Cast:</label>
							</td>
					</table>
							
						<ul>
							<c:forEach items="${film.actors}" var="actor">
								<li>ID: ${actor.id}</li>
								<li>Name: ${actor.firstName} ${actor.lastName }</li>
								<p>-----------------------------------------</p>
							</c:forEach>
						</ul>
								
					<br>
					
				</form>
				<span style="float:left;">
					<form action="deleteFilm.do" method="POST">
						<input type="hidden" name="filmId" value="${film.id }">
						<input type="submit" value="Delete Film">					
					</form>
				</span>
				<form action="EditFilm.do" method="GET">
					<input type="hidden" name="id" value="${film.id }">
					<input type="submit" value="Edit this film">
				</form>
				
			</c:when>
			<c:otherwise>
				<h1>Sorry, film couldn't be located</h1>				
			</c:otherwise>
		</c:choose>
		

		<c:if test="${not empty failureNotices }">

			<h3>Failures Occurred:</h3>

			<c:forEach items="${failureNotices}" var="failure">
				<p> <c:out value = "${failure}"/> </p>
			</c:forEach>

		</c:if>
		
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</body>
</html>