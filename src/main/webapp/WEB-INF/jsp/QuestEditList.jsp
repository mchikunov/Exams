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
		<h1>Редактор вопросов</h1>
        <h2>
        	<a href="new">Добавить вопрос</a>
        	&nbsp;&nbsp;&nbsp;
        	<a href="question">Перейти в тест</a>
        	
        </h2>
	</center>
    <div align="center">
        <table border="1" cellpadding="5">

            <tr>

                <th>Номер вопроса</th>
                <th>Вопрос</th>
                <th>Ответ 1</th>
                <th>Ответ 2</th>
                <th>Ответ 3</th>
                <th>Ответ 4</th>
                <th>Номер верного ответа</th>
                <th>Действия</th>
            </tr>
            <c:forEach var="qwe" items="${listQuestions}">
                <tr>

                    <td><c:out value="${qwe.questNumber}" /></td>
                    <td><c:out value="${qwe.question}" /></td>
                    <td><c:out value="${qwe.answer1}" /></td>
                    <td><c:out value="${qwe.answer2}" /></td>
                    <td><c:out value="${qwe.answer3}" /></td>
                    <td><c:out value="${qwe.answer4}" /></td>
                    <td><c:out value="${qwe.rightAnswer}" /></td>
                    <td>
                        <a href="edit?id=<c:out value='${qwe.id}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="delete?id=<c:out value='${qwe.id}' />">Delete</a>
                    </td>

                </tr>
            </c:forEach>
        </table>
    </div>	
</body>
</html>
