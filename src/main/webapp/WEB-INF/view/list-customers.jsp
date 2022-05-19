<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="com.saul.springdemo.util.SortUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/style.css" />
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	<div id="container">
		<div id="content">

			<!-- Definición de enlaces de ordenamiento -->
			<!-- Orden por First Name -->
			<c:url var="sortLinkFirstName" value="/customer/list">
				<c:param name="sort" value="<%=Integer.toString(SortUtils.FIRST_NAME)%>"></c:param>
			</c:url>
			
			<!-- Orden por Last Name -->
			<c:url var="sortLinkLastName" value="/customer/list">
				<c:param name="sort" value="<%=Integer.toString(SortUtils.LAST_NAME)%>"></c:param>
			</c:url>

			<!-- Orden por Email -->
			<c:url var="sortLinkEmail" value="/customer/list">
				<c:param name="sort" value="<%=Integer.toString(SortUtils.EMAIL)%>"></c:param>
			</c:url>
			
			<!-- Botón para agregar Customer -->
			<input type="button" value="AddCustomer"
				onclick="window.location.href='showFormForAdd'; return false;"
				class="add-button" />

			<!-- Formulario de búsqueda -->
			<form:form action="search" method="GET">
				Search Customer: <input type="text" name="search" />
				<input type="submit" value="Search" class="search-button" />
			</form:form>
			
			<br>
			
			<table>
				<tr>
					<th><a href="${ sortLinkFirstName }">First Name</a></th>
					<th><a href="${ sortLinkLastName  }">Last Name</a></th>
					<th><a href="${ sortLinkEmail  }">Email</a></th>
					<th>Action</th>
				</tr>

				<!-- Información de Customers -->
				<c:forEach var="tempCustomer" items="${ customers }">

					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${ tempCustomer.id }" />
					</c:url>
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${ tempCustomer.id }" />
					</c:url>

					<tr>
						<td>${ tempCustomer.firstName }</td>
						<td>${ tempCustomer.lastName }</td>
						<td>${ tempCustomer.email }</td>
						<td><a href="${ updateLink }">Update</a> | <a
							href="${ deleteLink }"
							onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false;">Delete</a>
						</td>
					</tr>

				</c:forEach>

			</table>
		</div>
	</div>
</body>
</html>