<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13.09.2020
  Time: 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <c:choose>
        <c:when test="${empty user.name}">
            <title>Add</title>
        </c:when>
        <c:otherwise>
            <title>Edit</title>
        </c:otherwise>
    </c:choose>
</head>
<body>
<c:url value="/add" var="addUrl"/>
<c:url value="/edit" var="editUrl"/>
<form action="${empty user.name ? addUrl : editUrl}" name="user" method="POST">
    <c:choose>
        <c:when test="${!empty user.name}">
            <p>Edit user</p>
            <input type="hidden" name="id" value="${user.id}">
        </c:when>
        <c:otherwise>
            <p>Add new user</p>
        </c:otherwise>
    </c:choose>
    <p><input type="text" name="name" placeholder="name" value="${user.name}" required> </p>
    <p><input type="text" name="lastname" placeholder="lastname" value="${user.lastname}" required></p>
    <p><input type="number" name="age" placeholder="age" value="${user.age}" required></p>
    <p><input type="text" name="city" placeholder="city" value="${user.city}" required></p>
    <p>
        <c:set value="add" var="add"/>
        <c:set value="edit" var="edit"/>
        <input type="submit" value="${empty user.name ? add : edit}">
    </p>
</form>
</body>
</html>