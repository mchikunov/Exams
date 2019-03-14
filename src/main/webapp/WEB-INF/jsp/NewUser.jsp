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
		<h1>Регистрация нового пользователя</h1>

	</center>
    <div align="center">

			<form action="saveUser">

        <table border="0" cellpadding="5">


            <tr>
                <th>Имя пользователя: </th>

                <td>
                	<input type="text" name="userName" size="55"
                		/>
                </td>
            </tr>

            <tr>
                <th>Пароль: </th>
                <td>
                    <input type="password" maxlength="25" size="55" name="password">
                </td>
            </tr>

            <tr>
                <th>Фамилия: </th>
                <td>
                    <input type="text" name="SName" size="55"

                    />

                </td>
            </tr>

            <tr>
                <th>Имя: </th>
                <td>
                    <input type="text" name="FName" size="55"

                    />

                </td>
            </tr>
            <tr>
                <th>Е-мейл: </th>
                <td>
                    <input type="text" name="email" size="55"

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
