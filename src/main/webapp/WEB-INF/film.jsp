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
		<a href="home.do">Home</a>
		<br>
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
								<input type="text" name="title" value="${film.title }" size="50"/> 
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="description">Description</label>
							</td>
							<td>
							 	<textarea name="description" rows="5" cols="35">
									<c:out value = "${film.description }"/>
								</textarea>
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="releaseYear">Release Year</label>
							</td>
							<td>
								<input type="text" name="releaseYear" value="${film.releaseYear }"/>							 	
							</td>
						</tr>

						<tr>
							<td>
								<label for="languageId">Language ID:</label>
							</td>
							<td>
								<input type="text" name="languageId" value="${film.languageId }"/>
								(${film.language })							 	
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="rentalDuration">Rental Duration:</label>
							</td>
							<td>							 	
								<input type="text" name="rentalDuration" value="${film.rentalDuration }"/>
								(Days)
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="rentalRate">Rental Rate:</label>
							</td>
							<td>
								<input type="text" name="rentalRate" value="${film.rentalRate }"/>
								$
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="length">Film Length:</label>
							</td>
							<td>
								<input type="text" name="length" value="${film.length }"/>
								(Minutes)
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="replacementCost">Replacement Cost:</label>
							</td>
							<td>
								<input type="text" name="replacementCost" value="${film.replacementCost }"/>
								$							 	
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="rating">Rating:</label>
							</td>
							<td>
								<input type="text" name="rating" value = "${film.rating}"/>
							</td>
						</tr>
					</table>			
					
					<input type="submit" value="Save"/>
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