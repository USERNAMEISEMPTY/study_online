<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <title>Study Online login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="css/login/reset.css">
    <link rel="stylesheet" href="css/login/supersized.css">
    <link rel="stylesheet" href="css/login/style.css">
    <style>
    input{
        font-size: 20px;
    }
    input::input-placeholder{
    	color:red;
    }
</style>   
</head>
<body>
    <p>${requestScope["register_message"]}</p>
    <a href="index.html" style="float: left;margin-top: -20px;margin-left:-30px" ><img src="images/1.png" alt="首页"></a>
    <div style="height: 40px"></div>
    <div class="page-container">
        <h1 style="color: #585454">Login</h1>
        <form action="/Study_online/LoginServlet" method="post">
            <input type="text" name="userid" class="username" placeholder="UserID">
            <input type="password" name="password" class="password" placeholder="Password">
            <button type="submit">Sign me in</button>
            <div class="error"><span>+</span></div>
        </form>
    </div>
    <script src="js/login/jquery-1.8.2.min.js"></script>
    <script src="js/login/supersized.3.2.7.min.js"></script>
    <script src="js/login/supersized-init.js"></script>
    <script src="js/login/scripts.js"></script>
</body>
</html>
