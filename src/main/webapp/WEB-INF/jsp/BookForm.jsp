<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <style type="text/css">

        body {
        font-family: Arial, sans-serif; /* Рубленый шрифт */
        }

        label {
            font-family: Georgia;
        }





        .letter {
            color: red; /* Красный цвет символов */
            font-size: 200%; /* Размер шрифта в процентах */
            font-family: serif; /* Шрифт с засечками */
            position: relative; /* Относительное позиционирование */
            top: 5px; /* Сдвиг сверху */
        }
        .letter1 {
            color: darkorange; /* Красный цвет символов */
            font-size: 90%; /* Размер шрифта в процентах */
            font-family: Arial Bold; /* Шрифт с засечками */

        }
        table {
            border-collapse: collapse; /* Отображать двойные линии как одинарные */
        }
        th {
            background: #ccc; /* Цвет фона */
            text-align: left; /* Выравнивание по левому краю */
        }
        tr, th, td {
            border: 0px #800; /* Параметры границы */
            padding: 4px; /* Поля в ячейках */
        }

    </style>
</head>
<body>

	<center>
		<h1>Тест</h1>

	</center>
    <div align="center">

			<form action="getResult">


                <strong>Выберите один из предложенных вариантов в каждом вопросе</strong> <br>
                <br>
                <br>
                <br>
                <table border="0" cellpadding="5">

                <c:forEach var="q" items="${listQuestions}">
                    <tr>
                        <th><p>${q.questNumber}. <span class="letter">${q.question.charAt(0)}</span>${q.question.substring(1)}</th>
                        <tr/>
                    <tr>
                        <td>
                            <br>
                            <span class="letter1">

                                <input type="radio" name="${q.questNumber}" value="1" /> ${q.answer1}<br>
                                <br/>
                                <input type="radio" name="${q.questNumber}" value="2" /> ${q.answer2}<br>
                                <br/>
                                <input type="radio" name="${q.questNumber}" value="3" /> ${q.answer3}<br>
                                <br/>
                                <input type="radio" name="${q.questNumber}" value="4" /> ${q.answer4}<br>



                                <br>
                                <br>
                                <br>
                                <br>

                                </span>
                        </td>
                    </tr>
                    </c:forEach>

                    <tr>
                    <td><input type="submit" value="Показать результат" /> </td>
                </tr>
            <table/>
        </form>
    </div>	
</body>
</html>
