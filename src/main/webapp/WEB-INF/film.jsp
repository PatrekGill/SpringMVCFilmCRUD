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
					</table>
					<table>
						
						<tr>
							<td>
								<label for="actors">Cast:</label>
							</td>
							
							<c:forEach items="${actors}" var="actor">
								<tr>
									<td>
										<p> <c:out value="ID: ${actor.id}" /></p>
										<p> <c:out value="Name: ${actor.firstName} ${actor.lastName}" /></p>
									</td>
								</tr>
							</c:forEach>
						</tr>
					</table>
								
					<br>
					
				</form>
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
	</body>
</html>