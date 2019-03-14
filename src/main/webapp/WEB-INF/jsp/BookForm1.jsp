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
        	<a href="new">Add New User</a>
        	&nbsp;&nbsp;&nbsp;
        	<a href="admin">List All Users</a>
        	
        </h2>
	</center>
    <div align="center">
		<c:if test="${user != null}">
			<form action="update1">
        </c:if>
        <c:if test="${user == null}">
			<form action="insert1">
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
            	<h2>
            		<c:if test="${user != null}">
            			Edit User
            		</c:if>
            		<c:if test="${user == null}">
            			Add New User
            		</c:if>
            	</h2>
            </caption>

            <tr>
                <th>Name: </th>
                <td>
                	<input type="text" name="FName" size="45"
                			value="<c:out value='${user.FName}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th> Surname: </th>
                <td>
                	<input type="text" name="SName" size="45"
                			value="<c:out value='${user.SName}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Age: </th>
                <td>
                	<input type="text" name="age" size="5"
                			value="<c:out value='${user.age}' />"
                	/>
                </td>
            </tr>
			<tr>
				<th>Role: </th>
				<td>
					<input type="text" name="role" size="45"
						   value="<c:out value='${user.role}' />"
					/>
				</td>
			</tr>
            <tr>
            	<td colspan="2" align="center">
            		<input type="submit" value="Save" />
            	</td>
            </tr>

            <tr>
                <td><form:label path = "gender">Gender</form:label></td>
                <td>
                    <form:radiobutton path = "gender" name = "ss" value = "M" label = "${male}" /> <br>
                    <form:radiobutton path = "gender" name = "ss" value = "F" label = "Female" />
                </td>
            </tr>
            <tr>
                <td>
            <input type="radio" name="test" value="1" />
            <input type="radio" name="test" value="2"  />
            <input type="radio" name="test" value="3" />

                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Sav" />
                </td>
            </tr>
        </table>
        </form>
    </div>	
</body>
</html>
