<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="margin: 10vw;">
<h1 style="color:#0000CD">Save Travels</h1>
<table class="table table-striped table-bordered" style="border:2px solid black;">
    <thead>
        <tr>
            <th class="text-center">Expense</th>
            <th class="text-center">Vendor</th>
            <th class="text-center">Amount</th>
            <th class="text-center">Actions</th>
        </tr>
    </thead>
    <tbody>
		<c:forEach var="expense" items="${expenses}">
			<tr>
				<td class="text-center"><a href="/expenses/<c:out value="${expense.id}"></c:out>"><c:out value="${expense.name}"></c:out></a></td>
				<td class="text-center"><c:out value="${expense.vendor}"></c:out></td>
				<td class="text-center">$<fmt:formatNumber type="number" minFractionDigits="2" value="${expense.amount}"/></td>
				<td class="text-center"><a style="color:green;" href="/expenses/edit/${expense.id}">edit</a> 
				<a style="background-color:red; color:white; border:1px solid black;" href="/expenses/delete/${expense.id}">delete</a></td>
			</tr>	
		</c:forEach>
    </tbody>
</table>
<br>
<div>
<h1 style="color:#0000CD">Add an expense:</h1>
<form:form action="/expenses" method="post" modelAttribute="expense">

	<div>
		<form:label path="name">Expense Name: </form:label><br />
		<form:errors path="name" class="text-danger"/>
		<form:input style="width:250px; border:2px solid black;" path="name"/>
	</div>

	<div>
		<form:label path="vendor">Vendor: </form:label><br />
		<form:errors path="vendor" class="text-danger"/>
		<form:input style="width:250px; border:2px solid black;" path="vendor"/>
	</div>
	
	<div>
		<form:label path="amount">Amount: </form:label><br />
		<form:errors path="amount" class="text-danger"/>
		<form:input style="width:250px; border:2px solid black;" type="number" step="0.01" min="0" path="amount"/>
	</div>
	
	<div>
		<form:label path="description">Description: </form:label><br />
		<form:errors path="description" class="text-danger"/>
		<form:textarea style="width:250px; border:2px solid black;" rows="3" path="description"/>
	</div>
	
	<div>
		<input type="submit" value="Submit" style="background-color:Chartreuse; color: white"/>
	</div>
	

</form:form>
</div>

</body>
</html>