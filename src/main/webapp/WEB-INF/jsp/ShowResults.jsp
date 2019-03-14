<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<FName></FName>
</head>
<body>
<link href="<c:url value="/pages/css/bootstrap.css" />" rel="stylesheet">
	<center>
		<h1>Результаты по Фамилиям</h1>
        <h2>
        	<a href="new">Добавить вопрос</a>
        	&nbsp;&nbsp;&nbsp;
        	<a href="question">Перейти в тест</a>
        	
        </h2>
	</center>
    <div align="center">
        <table border="1" cellpadding="5">

            <tr>

                <th>Фамилия</th>
                <c:forEach var="N" begin="1" end="${NQ}">
                <th>Вопрос <c:out value="${N}" /></th>
                </c:forEach>
            </tr>

            <c:forEach var="r" items="${listR}">
                <tr>
                <c:forEach var="inn" items="${r}">
                    <td><c:out value="${inn}" /></td>
            </c:forEach>
                </tr>

            </c:forEach>
        </table>
    </div>	
</body>
</html>
