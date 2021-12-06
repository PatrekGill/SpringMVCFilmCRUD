 <jsp:useBean id="map" class="java.util.HashMap" scope="request"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Add Film</title>

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
								Add <b>Film</b>
							</h2>
						</div>
						<div class="col-xs-6">
							<a href="home.do" class="btn btn-primary">
								<i class="material-icons">&#xE88a;</i>
								<span>Home</span>
							</a>
						</div>
					</div>
				</div>

				<form action="addFilm.do" id="filmDetails" method="POST">
					<table class="table table-striped table-hover">
						<tbody>
							<tr>
								<td>
									<label for="title">Title:</label>
									<div class="input-group">
									    <span class="input-group-addon">
									    	<i class="glyphicon glyphicon-pencil"></i>
									    </span>
									    <input type="text" class="form-control" name="title" placeholder="Title" value="Title"/>
								  	</div>
								</td>
							</tr>

							<tr>
								<td>
									<label for="description">Description:</label>
									<div class="input-group">
									    <span class="input-group-addon">
									    	<i class="glyphicon glyphicon-pencil"></i>
									    </span>
									    <textarea class="form-control" name="description" placeholder="Description"></textarea>
								  	</div>
								</td>
							</tr>

							<tr>
								<td>
									<label for="releaseYear">Release Year:</label>
									<div class="input-group">
									    <span class="input-group-addon">
									    	<i class="glyphicon glyphicon-calendar"></i>
									    </span>
									    <input type="number" name="releaseYear" min="0" max="9999" step="1" value="0" class="form-control" placeholder="Release Year"/>
								  	</div>
								</td>
							</tr>

							<tr>
								<td>
									<c:set target="${requestScope.map}" property="1" value="English"/>
									<c:set target="${requestScope.map}" property="2" value="Italian"/>
									<c:set target="${requestScope.map}" property="3" value="Japanese"/>
									<c:set target="${requestScope.map}" property="4" value="Mandarin"/>
									<c:set target="${requestScope.map}" property="5" value="French"/>
									<c:set target="${requestScope.map}" property="6" value="German"/>

								  	<label for="languageId">Language ID:</label>
									<div class="input-group">
									  	<span class="input-group-addon">
									    	<i class="glyphicon glyphicon-globe"></i>
									    </span>

									  	<select class="form-control" id="languageId" name="languageId">

									    	<c:forEach items="${requestScope.map}" var="language">

									    	 	<c:choose>
												    <c:when test="${language.key == 1}">
														<option value="${language.key }" selected>${language.key } (${language.value })</option>
													</c:when>

													<c:otherwise>
														<option value="${language.key }">${language.key } (${language.value })</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>

									  	</select>
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<label for="rentalDuration">Rental Duration: (days)</label>
									<div class="input-group">
									    <span class="input-group-addon">
									    	<i class="glyphicon glyphicon-time"></i>
									    </span>
									    <input type="number" name="rentalDuration" min="0" max="255" step="1" value="3" class="form-control" placeholder="Rental Duration (days)"/>
								  	</div>
								</td>
							</tr>

							<tr>
								<td>
									<label for="rentalRate">Rental Rate: (USD)</label>
									<div class="input-group">
									    <span class="input-group-addon">
									    	<i class="glyphicon glyphicon-usd"></i>
									    </span>
									    <input type="number" name="rentalRate" min="0" max="99.99" step="0.01" value="4.99" class="form-control" placeholder="Rental Rate (USD)"/>
								  	</div>
								</td>
							</tr>

                            <tr>
								<td>
									<label for="length">Film Length: (minutes)</label>
									<div class="input-group">
									    <span class="input-group-addon">
									    	<i class="glyphicon glyphicon-time"></i>
									    </span>
									    <input type="number" name="length" min="0" max="32767" step="1" value="0" class="form-control" placeholder="Film Length (minutes)"/>
								  	</div>
								</td>
							</tr>

                            <tr>
								<td>
									<label for="replacementCost">Replacement Cost: (USD)</label>
									<div class="input-group">
									    <span class="input-group-addon">
									    	<i class="glyphicon glyphicon-usd"></i>
									    </span>
									    <input type="number" name="replacementCost" min="0" max="999.99" step="0.01" value="19.99" class="form-control" placeholder="Replacement Cost: (USD)"/>
								  	</div>
								</td>
							</tr>

                            <tr>
								<td>

								  	<label for="rating">Rating:</label>

									<div class="input-group">
									  	<span class="input-group-addon">
									    	<i class="glyphicon glyphicon-info-sign"></i>
									    </span>

									  	<select class="form-control" id="rating" name="rating">

                                            <c:forTokens items="G,PG,PG13,R,NC17" delims="," var="value">

                    							<c:choose>

                    								<c:when test="${value == 'G'}">
                                                        <option value="${value }" selected>${value }</option>
                    								</c:when>
                    								<c:otherwise>
                    									<option value="${value }">${value }</option>
                    								</c:otherwise>

                    							</c:choose>

                    						</c:forTokens>

									  	</select>
									</div>
								</td>
							</tr>

							<tr>
								<td>

                                    <div>
                                        <button type="submit" class="btn btn-success">
                                            <i class="material-icons" style="font-size:22px; vertical-align: middle;">&#xE147;</i>
                                            <span style="font-size:15px; vertical-align: middle;">Add Film</span>
                                        </button>
        							</div>

								</td>
							</tr>
						</tbody>
					</table>
				</form>
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
