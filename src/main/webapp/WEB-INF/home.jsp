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
	<c:if test="${not empty deletedFilmId }">
		<script>
			var message = "Deleted film with ID: ${deletedFilmId}";
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
						</div>
					</div>
				</div>



				<table class="table table-striped table-hover">
					<tbody>
						<tr>
							<td>
								<form action="GetFilms.do" method="GET">
									<div class="input-group">
									    <input type="text" class="form-control" name="keyword" placeholder="Search For Film By Keyword">

									    <div class="input-group-btn">
										    <button class="btn btn-default" type="submit">
									       		<i class="glyphicon glyphicon-search"></i>
										    </button>
									    </div>
								  	</div>

								</form>
							</td>
						</tr>
						<tr>
							<td>
								<form action="GetFilmData.do" method="GET">
									<div class="input-group">
									    <input type="number" class="form-control" name="filmId" placeholder="Search For Film By Id">

									    <div class="input-group-btn">
										    <button class="btn btn-default" type="submit">
									       		<i class="glyphicon glyphicon-search"></i>
										    </button>
									    </div>
								  	</div>

								</form>
							</td>
						</tr>
					</tbody>
				</table>
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
