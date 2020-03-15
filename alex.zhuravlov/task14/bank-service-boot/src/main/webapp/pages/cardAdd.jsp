<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Simple library app</title>
      <link rel="stylesheet"
      		 href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container mt-3">
<form:form modelAttribute="bankCard" action="addCard" method="post">
   <table class="table table-stripped" style="width:600px">
        <tr>
            <td>
                <form:label path="accounts"/>Account:
            </td>
            <td>
                <form:select path="accounts" items="${accountsMap}"/>
            </td>
        </tr>
    </table>
    <input type="submit" class="btn btn-primary" value="Add card"/>
</form:form>
</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>