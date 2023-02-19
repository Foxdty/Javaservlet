<%--
  Created by IntelliJ IDEA.
  User: HạoThiên
  Date: 2/14/2023
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/common/taglib.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Đăng nhập</title>
</head>
<body>
<div class="container">
<%--  <h1 class="form-heading">login Form</h1>--%>

  <div class="login-form">

    <div class="main-div">
        <c:if test="${not empty message}">
        <div class="alert alert-${alert}">
            ${message}
        </div>
        </c:if>
<%--      <div class="panel">--%>
<%--        <h2>Admin Login</h2>--%>
<%--        <p>Please enter your email and password</p>--%>
<%--      </div>--%>
      <form action="<c:url value="/dang-nhap"/>" id="formSubmit" method="POST">

        <div class="form-group">


          <input type="text" class="form-control" id="inputEmail" placeholder="Tên tài khoản" name="userName">

        </div>

        <div class="form-group">

          <input type="password" class="form-control" id="inputPassword" placeholder="Mật khẩu" name="password">

        </div>
<%--        <div class="forgot">--%>
<%--          <a href="reset.html">Forgot password?</a>--%>
<%--        </div>--%>
        <button type="submit" class="btn btn-primary">Đăng nhập</button>
          <input type="hidden" value="login" name="action">

      </form>
    </div>
<%--    <p class="botto-text"> Designed by Sunil Rajput</p>--%>
  </div></div>

</body>
</html>
