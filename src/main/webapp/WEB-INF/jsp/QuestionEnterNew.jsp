<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<FName></FName>
</head>
<body>
<link href="<c:url value="/pages/css/bootstrap.css" />" rel="stylesheet">
	<center>
		<h1>Users Citadel</h1>
        <h2>
        	<a href="new">Add New Question</a>
        	&nbsp;&nbsp;&nbsp;
        	<a href="BookForm">List All Users</a>

        </h2>
	</center>
    <div align="center">
		<c:if test="${question != null}">
			<form action="insQ">
        </c:if>
        <c:if test="${question == null}">
			<form action="insQ">
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
            	<h2>
            		<c:if test="${question != null}">
            			Edit Question
            		</c:if>
            		<c:if test="${question == null}">
            			Add New Question
            		</c:if>
            	</h2>
            </caption>
            <c:if test="${question != null}">
                <input type="hidden" name="id" value="<c:out value='${question.id}' />" />
            </c:if>
            <tr>
                <th>Номер вопроса: </th>
                <td>
                	<input type="text" name="questNumber" size="5"
                			value="<c:out value='${question.questNumber}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th> Опишите вопрос: </th>
                <td>
                	<input type="text" name="question" size="45"
                			value="<c:out value='${question.question}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Ответ 1: </th>
                <td>
                	<input type="text" name="answer1" size="45"
                			value="<c:out value='${question.answer1}' />"
                	/>
                </td>
            </tr>

            <tr>
                <th>Ответ 2: </th>
                <td>
                    <input type="text" name="answer2" size="45"
                           value="<c:out value='${question.answer2}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Ответ 3: </th>
                <td>
                    <input type="text" name="answer3" size="45"
                           value="<c:out value='${question.answer3}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Ответ 4: </th>
                <td>
                    <input type="text" name="answer4" size="45"
                           value="<c:out value='${question.answer4}' />"
                    />
                </td>
            </tr>

			<tr>
				<th>Верный ответ номер: </th>
				<td>
					<input type="text" name="rightAnswer" size="5"
						   value="<c:out value='${question.rightAnswer}' />"
					/>
				</td>
			</tr>
            <tr>
            	<td colspan="2" align="center">
            		<input type="submit" value="Save" />
            	</td>
            </tr>

        </table>
        </form>
    </div>
</body>
</html>
