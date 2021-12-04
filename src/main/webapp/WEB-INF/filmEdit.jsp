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
							 	<textarea name="description" rows="5" cols="35"><c:out value = "${film.description }"/></textarea>
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="releaseYear">Release Year</label>
							</td>
							<td>
								<input type="number" name="releaseYear" min="0" max="9999" step="1" value="${film.releaseYear }"/>							 	
							</td>
						</tr>

						<tr>
							<td>
								<label for="languageId">Language ID:</label>
							</td>
							<td>
								<input type="number" name="languageId" min="1" max="6" step="1" value="${film.languageId }"/>
								(${film.language })							 	
							</td>
						</tr>
					
						<tr>
							<td>
							</td>
							<td>
								<input type="number" name="rentalDuration" min="0" max="255" step="1" value="${film.rentalDuration }"/>
								(Days)
								<label for="rentalDuration">Rental Duration:</label>
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="rentalRate">Rental Rate:</label>
							</td>
							<td>
								<input type="number" name="rentalRate" min="0" max="99.99" step="0.01" value="${film.rentalRate }"/>
								$
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="length">Film Length:</label>
							</td>
							<td>
								<input type="number" name="length" min="0" max="32767" step="1" value="${film.length }"/>
								(Minutes)
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="replacementCost">Replacement Cost:</label>
							</td>
							<td>
								<input type="number" name="replacementCost" min="0" max="999.99" step="0.01" value="${film.replacementCost }"/>
								$							 	
							</td>
						</tr>
					
						<tr>
							<td>
								<label for="rating">Rating:</label>
							</td>
							<td>
								<c:forTokens items="G,PG,PG13,R,NC17" delims="," var="value">
								
									<c:choose>
									
										<c:when test="${value == film.rating}">
											<input id="${value }" name="rating" type="radio" value="${value }" checked="checked"/>				
										</c:when>
										<c:otherwise>
											<input id="${value }" name="rating" type="radio" value="${value }"/>				
										</c:otherwise>
										
									</c:choose>
   									<label for="${value }">${value }</label>
								
								</c:forTokens>
								
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