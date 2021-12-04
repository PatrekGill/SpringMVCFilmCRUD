<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring MVC Film Site</title>
</head>
<body>
<a href="addFilm.do">Add Film</a>
<h1>Films R Us!</h1>
<h2>Search for a film:</h2>

<form action="GetFilmData.do" method="GET">
	Film ID:
	<input type="text" name="filmId" />
	<input type="submit" name="Search Film by Id" />
	
</form>
<br>

<form action="GetFilms.do" method="GET">
	Search Film by keyword:
	<input type="text" name="keyword" />
	<input type="submit" name="Search Film by keyword" />


</form>

<c:if test="${not empty deletedFilmId }">
	<h3>Deleted film with ID: ${ deletedFilmId } from the database</h3>
</c:if>



</body>
</html>