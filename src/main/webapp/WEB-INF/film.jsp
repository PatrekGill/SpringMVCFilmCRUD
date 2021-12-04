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
				<h3>Film ID: ${film.id }</h3>

				<form action="" id="filmDetails">
					
					<label for="title">Title</label>
					<input type="text" name="title" value="${film.title }" size="50"/>
					<br>
					
					<label for="description">Description</label>
					<textarea form="filmDetails" name="description" rows="4" cols="35">
						${film.description }
					</textarea>
					<%--<input type="text" name="description" value="${film.description }"/>--%>
					<br>
					
					<label for="release_year">Release Year</label>
					<input type="text" name="release_year" value="${film.releaseYear }"/>
					<br>

					<label for="language_id">Language ID:</label>
					<input type="text" name="language_id" value="${film.languageId }"/>
					<br>

					<label for="language">Language:</label>
					<input type="text" name="language" value="${film.language }"/>
					<br>
					
					<label for="rental_duration">Rental Duration:</label>
					<input type="text" name="rental_duration" value="${film.rentalDuration }"/>
					<br>
					
					<label for="rental_rate">Rental Rate:</label>
					<input type="text" name="rental_rate" value="${film.rentalRate }"/>
					<br>
					
					<label for="length">Film Length:</label>
					<input type="text" name="length" value="${film.length }"/>
					<br>
					
					<label for="replacement_cost">Replacement Cost:</label>
					<input type="text" name="replacement_cost" value="${film.replacementCost }"/>
					<br>
					
					<label for="rating">Rating:</label>
					<input type="text" name="rating" value="${film.rating }"/>
					<br>
					
					
					<input type="submit"/>
				</form>
				
			</c:when>
			<c:otherwise>
				<h1>Sorry, film couldn't be located</h1>
				<br>
				<a href="home.do">Home</a>
			</c:otherwise>
		</c:choose>
	</body>
</html>