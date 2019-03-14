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



        input[type=radio] {
            display: none;
        }

        input[type=radio] + label {
            background: url('https://lh3.googleusercontent.com/CSygHWUdWSpIIfoPv3gwc0PctzOTVFGSCcSel4lOtxBBofmpt1QJxOF8MwrXbi0lIxxnKw2Cj6btMFTJZIGxWpkNpHZL41cOa5sgeSgtlsmat7YjkQlrU2XbmhPrxZwElMf9hucSAfEgF0VRLQy58ATRdf1mQULv5VcfnWFyus03KF8Egtg_pwW1_LRnklFEAUUZ_TyzEqFM3cp6G_aDyQpNCKxNvoLWkrcV-tgxqxQGAqC45JAkWWNXSxKgXD8TINX_xO1oml6fh_qVC32SwSQZqkk8Mkhvi2V3DSME0BzcS7wlku5tUK9ijkksro3Wp9kS7Ng4kyPDpkhZAh0kaiKXe4vUXfpZhhXuVjMwaP04HmMFJ7tjKt7bKvIHo0LcKv1zbbQsJ5ZTbI9wRabnUk9dWZtKE0w9BwiNbHuw1JrJBzmSCon9aQZD2DCD72DZEgaUchpdWKi-jShqHvrhaUYUeOUQiImDmo9NBKocQIW76p69uns8tbm1XXohE6tc-PKj8Cx66YtZLm4oUsvppee7Sw92GBFNvMPP9BGZSvxZmpV6TV5rNga1JBJOCMKw76SuYRNob9jCPmjzVMYjmFN8GknmaqOti7kh-QP7IlTUleyq=w25-h24-no') left top no-repeat;
            display: block;
            min-height: 25px;
            padding-left: 35px;
        }

        input[type=radio]:checked + label {
            background: url('https://lh3.googleusercontent.com/QSVgoBuOonsWKUZm6m0NKwekEvkfMOWrPFfevisISZjzeu2uQkxMOY1MUh3QgorRu2qc1kwKX4So7-mGJ-hayMAitq15L63KQNBfsOcm1qmWDU657CNl4lauYhgVz7f59IMrZBg8FWdgh26VDCvGMwUqaK6CBVv13AdKbxDMeDqiZS73EgzF5kBW5smh1nxCY5Gqk8yCmDsYh4KixdZWKGW7BqXLZn7cB2fQV4-o0DePjN69GJLXmddJ6H32CBgiFKE4smBvb1ByWpREmRYpFEUaHuQdbhHiiebI4Kipz35I6OxsVxKC6HOIQC3Xk6JVePhgudB2_-8Nyq2M9rWqIap8kAhmN-FI8iRdSLXhTV4FEeTHqokQ0qEXEZ5N9dRKoXT3al1Alcwrson_OtaALHldR9O7BO6Iq5_BV7-ERpoSYD8wGGhCcWQbjKkz5qHTa8yWRAfZaCLnK8Dzs0DPJtgMjQirittz8cpQQxQM4fhzXvG2x_Dtev4Y1YcZbzsaU6FpamC188SkjEDGOjYnf6CTk0VVbPk1DXFPIEGbOmc7b1unsq7uHOOkuRkGnTQ_d8aLNNPpeDvxP4agpI-ycfdH2ciG4sRXSKcdeAXGIHhNaI9T=w25-h24-no') left top no-repeat;
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

                                <input type="radio" name="${q.questNumber}" value="1" id=${q.answer1} />
                                <label class="choice" for=${q.answer1}>${q.answer1}</label><br />
                                <input type="radio" name="${q.questNumber}" value="2" id = ${q.answer2}/>
                                <label class="choice" for=${q.answer2}>${q.answer2}</label><br /><br>


<div class="btn-group btn-group-toggle" data-toggle="buttons">
  <label class="btn btn-secondary active">
    <input type="radio" name="options" id="option1" autocomplete="off" checked> Active
  </label>
  <label class="btn btn-secondary">
    <input type="radio" name="options" id="option2" autocomplete="off"> Radio
  </label>
  <label class="btn btn-secondary">
    <input type="radio" name="options" id="option3" autocomplete="off"> Radio
  </label>
</div>
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
