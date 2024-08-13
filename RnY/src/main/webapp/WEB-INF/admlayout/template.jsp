<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- template 파일. -->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title><tiles:getAsString name="title"/></title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

/* Layout */
body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	background-color: #f8f8f8;
}

/* Sidebar */
.sidebar {
	width: 250px;
	background-color: #e6e6e6;
	padding: 20px;
	position: fixed;
	left: 0;
	top: 0;
	bottom: 0;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

/* Main Content */
.main-content {
	flex-grow: 1;
	margin-left: 250px; /* 사이드바의 너비만큼 왼쪽 여백 */
	padding: 40px;
	background-color: #fff;
}

/* Table & Pagination */
.notice-title {
	text-align: center;
	font-size: 24px;
	color: #555;
	margin-bottom: 40px;
}

.notice-table {
	width: 100%;
	border-collapse: collapse;
}

.notice-table th, .notice-table td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.notice-table th {
	background-color: #f2f2f2;
	color: #333;
}

.notice-table tr:hover {
	background-color: #f9f9f9;
}

.notice-table tr td {
	color: #666;
}

.pagination {
	text-align: center;
	margin-top: 20px;
}

.pagination a {
	margin: 0 5px;
	text-decoration: none;
	color: #333;
	padding: 10px 15px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.pagination a:hover {
	background-color: #ddd;
}

.pagination .active {
	background-color: #33aaff;
	color: #fff;
	border: 1px solid #33aaff;
}

header, footer {
	display: none;
}

#footer-bottom {
	display: none;
}
</style>    
    </head>
    <body>
				<tiles:insertAttribute name="menu"/><!-- 메뉴부분. -->
				<tiles:insertAttribute name="body"/><!-- 바디부분. -->
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation--> 
                <!-- Page content-->
                <div class="container-fluid">
                </div>
            </div>
        </div>
				<tiles:insertAttribute name="footer"/><!-- 푸터부분. -->
    </body>
</html>
