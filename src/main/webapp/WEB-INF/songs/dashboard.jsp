<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form action="/search/artist" method="post" modelAttribute="search">
		<form:input path="artist" name="artist"/>
		<button>Search Artist</button>
	</form:form>
	<a href="/songs/new">Add New</a>
	<a href="/search/topTen">Top Ten</a>
	<a>Top Songs</a>
	<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>Rating</th>
				<th>actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${songs}" var = "oneSong">
			<tr>
				<td><a href="/songs/${oneSong.id}"><c:out value="${oneSong.title}"/></a></td>
				<td><c:out value="${oneSong.rating}"/></td>
				<td>
					<form action="/delete/${oneSong.id}" method="post">
			    		<input type="hidden" name="_method" value="delete">
			    		<input type="submit" value="Delete">
					</form>
				</td>
			</tr>	
			</c:forEach>
		</tbody>
	</table>
</body>
</html>