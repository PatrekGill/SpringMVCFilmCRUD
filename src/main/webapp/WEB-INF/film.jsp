<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Edit Film</title>

    <link rel="stylesheet"
       href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <link rel="stylesheet"
       href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">

    <link rel="stylesheet"
       href="https://fonts.googleapis.com/icon?family=Material+Icons">


    <style>
        body {
           color: #566787;
           background: #f5f5f5;
           font-family: 'Varela Round', sans-serif;
           font-size: 13px;
        }

        .table-responsive {
           margin: 30px 0;
        }

        .table-wrapper {
           min-width: 1000px;
           background: #fff;
           padding: 20px 25px;
           border-radius: 3px;
           box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
           padding-bottom: 15px;
           background: #435d7d;
           color: #fff;
           padding: 16px 30px;
           margin: -20px -25px 10px;
           border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
           margin: 5px 0 0;
           font-size: 24px;
        }

        .table-title .btn-group {
           float: right;
        }

        .table-title .btn {
           color: #fff;
           float: right;
           font-size: 13px;
           border: none;
           min-width: 50px;
           border-radius: 2px;
           border: none;
           outline: none !important;
           margin-left: 10px;
        }

        .table-title .btn i {
           float: left;
           font-size: 21px;
           margin-right: 5px;
        }

        .table-title .btn span {
           float: left;
           margin-top: 2px;
        }

        table.table tr th, table.table tr td {
           border-color: #e9e9e9;
           padding: 12px 15px;
           vertical-align: middle;
        }

        table.table tr th:first-child {
           width: 60px;
        }

        table.table tr th:last-child {
           width: 100px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
           background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
           background: #f5f5f5;
        }

        table.table th i {
           font-size: 13px;
           margin: 0 5px;
           cursor: pointer;
        }

        table.table td:last-child i {
           opacity: 0.9;
           font-size: 22px;
           margin: 0 5px;
        }

        table.table td a {
           font-weight: bold;
           color: #566787;
           display: inline-block;
           text-decoration: none;
           outline: none !important;
        }

        table.table td a:hover {
           color: #2196F3;
        }

        table.table td a.edit {
           color: #FFC107;
        }

        table.table td a.delete {
           color: #F44336;
        }

        table.table td i {
           font-size: 19px;
        }

        table.table .avatar {
           border-radius: 50%;
           vertical-align: middle;
           margin-right: 10px;
        }

        .hint-text {
           float: left;
           margin-top: 10px;
           font-size: 13px;
        }
    </style>

    <script>
       $(document).ready(function() {
           // Activate tooltip
           $('[data-toggle="tooltip"]').tooltip();
       });
    </script>
</head>
<body>
    <c:if test="${not empty failureNotices }">
        <c:forEach items="${failureNotices}" var="failure">
            <script>
                var message = "${failure}";
                alert(message);
            </script>
        </c:forEach>
    </c:if>

    <c:if test="${not empty newlyCreated }">
		<script>
			var message = "Creation of Film Succeeded!";
			alert(message);
		</script>
	</c:if>

    <c:if test="${not empty error }">
        <script>
            var message = "${error}";
            alert(message);
        </script>
	</c:if>

    <div class="container">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-xs-6">
							<h2>
								Manage <b>Films</b>
							</h2>
						</div>
						<div class="col-xs-6">
                            <a href="addFilm.do" class="btn btn-success">
                                <i class="material-icons">&#xE147;</i>
                                <span>Add New Film</span>
                            </a>
							<a href="home.do" class="btn btn-primary">
								<i class="material-icons">&#xE88a;</i>
								<span>Home</span>
							</a>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<tbody>
                        <c:choose>
                    		<c:when test="${not empty film }">
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

        						<tr>
        							<td>
        								<label for="category">Category:</label>
        							</td>
        							<td>
                                        <c:choose>
                                            <c:when test="${not empty film.category }">
                                                ${film.category }
                                            </c:when>
                                            <c:otherwise>
                                                None
                                            </c:otherwise>
                                        </c:choose>
        							</td>
        						</tr>
                                <tr>
                                    <td>
        								<label for="actors">Actors:</label>
        							</td>
                                    <td>
                                        <ul>
                    						<c:forEach items="${film.actors}" var="actor">
                    							<li>ID: ${actor.id} | Name: ${actor.firstName} ${actor.lastName }</li>
                    						</c:forEach>
                    					</ul>
                                    </td>
                                </tr>

                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td>Sorry, film couldn't be located</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
					</tbody>

				</table>
                <span style="float:left;">
                    <form action="EditFilm.do" method="GET">
                        <input type="hidden" name="id" value="${film.id }">
                        <button type="submit" class="btn btn-primary">
                            <i class="glyphicon glyphicon-edit" style="font-size:22px; vertical-align: middle;"></i>
                            <span style="font-size:15px; vertical-align: middle;">Edit Film</span>
                        </button>
                    </form>
                </span>
                <span style="float:right;">
                    <form action="deleteFilm.do" method="POST">
                        <input type="hidden" name="filmId" value="${film.id }">
                        <button type="submit" class="btn btn-danger">
                            <i class="glyphicon glyphicon-trash" style="font-size:22px; vertical-align: middle;"></i>
                            <span style="font-size:15px; vertical-align: middle;">Delete Film</span>
                        </button>
                    </form>
                </span>
			</div>
		</div>
	</div>

    <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
    </script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
    </script>
</body>
</html>
