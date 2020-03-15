<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
   <title>Accounts list</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div class="container mt-3">
 <table class="table table-stripped">
     <caption style="caption-side: top"><h3>Account List</h3></caption>
     <thead class="thead-dark">
     <tr>
         <th scope="col">Id</th>
         <th scope="col">Balance</th>
         <th scope="col">User</th>
         <th></th>
         <th></th>
         <th></th>
         <th></th>
     </tr>
     </thead>
     <tbody>
     <c:forEach items="${accounts}" var="account">
     <tr>


               <td><c:out value="${account.accountId}"/></td>
               <td><c:out value="${account.accountBalance}"/></td>
               <td><c:out value="${account.user.userId}"/></td>
               <td>
                  <c:choose>
                      <c:when test="${transfer == true}">
                          <input type="button" class="btn btn-primary" onclick="location.href='deposit?accountId=${account.accountId}';" value="Deposit"/>
                      </c:when>
                      <c:otherwise>
                          <input type="button" onclick="location.href='deposit?accountId=${account.accountId}';" value="Deposit" disabled/>
                      </c:otherwise>
                  </c:choose>
               </td>
               <td>
                <c:choose>
                  <c:when test="${transfer == true}">
                      <input type="button" class="btn btn-info" onclick="location.href='withdraw?accountId=${account.accountId}';" value="Withdraw" />
                  </c:when>
                  <c:otherwise>
                      <input type="button" onclick="location.href='withdraw?accountId=${account.accountId}';" value="Withdraw" disabled/>
                  </c:otherwise>
                </c:choose>
               </td>
               <td>
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
                          <input type="button" class="btn btn-danger onclick="location.href='deleteAccount?accountId=${account.accountId}';" value="Delete account"/>
                    </sec:authorize>
               </td>
               <td>
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
                          <input type="button" class="btn btn-primary" onclick="location.href='addCardForm';" value="Add card"/>
                    </sec:authorize>
               </td>
               </tr>
       </c:forEach>

 </tbody>
 </table>
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')">
         <input type="button" class="btn btn-success" onclick="location.href='/users/addAccount?userId=${currentUserId}';" value="Add my account"/>
    </sec:authorize>
 </div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>