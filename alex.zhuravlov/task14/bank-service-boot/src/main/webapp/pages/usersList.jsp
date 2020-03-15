<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>

<head>
    <title>Users list</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>

<jsp:include page="navbar.jsp"/>

<div class="container mt-3">
    <table class="table table-striped">
    <caption style="caption-side: top"><h3>Users List</h3></caption>
        <thead class="thead-dark">
        <tr>
            <th scope="col">Id</th>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Roles</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
        <tr>
         <td><c:out value="${user.userId}"/></td>
         <td><c:out value="${user.firstName}"/></td>
         <td><c:out value="${user.lastName}"/></td>
         <td>
         <c:forEach items="${user.roles}" var="role">
         <c:out value="${role.name}"/>
         </c:forEach>
         </td>
         <td>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
            <input type="button" class="btn btn-warning" onclick="location.href='edit?userId=${user.userId}';" value="Edit user"/>
            </sec:authorize>
         </td>
         <td>
             <sec:authorize access="hasRole('ROLE_ADMIN')">
             <input type="button" class="btn btn-danger" onclick="location.href='deleteUser?userId=${user.userId}';" value="Delete user"/>
             </sec:authorize>
         </td>
         <td>
             <input type="button" class="btn btn-primary" onclick="location.href='addAccount?userId=${user.userId}';" value="Add account"/>
          </td>
          </tr>
 </c:forEach>
 </tbody>
 </table>
 <input type="button" class="btn btn-success" onclick="location.href='add';" value="Add new user"/>
 </div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>