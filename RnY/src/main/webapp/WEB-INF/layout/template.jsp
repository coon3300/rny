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
