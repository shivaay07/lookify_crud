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
	<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>rating</th>
				<th>actions</th>
			</tr>
		</thead>
		<tbody>
		<form:form action="/search/artist" method="post" modelAttribute="search">
			<form:input path="artist" name="artist"/>
			<button>Search Artist</button>
		</form:form>
			<c:forEach items="${allArtist}" var="oneArtist">
				<tr>
					
					<td><c:out value="${oneArtist.rating}"/></td>
					<td><c:out value="${oneArtist.title}"/></td>
					<td>
						<form action="/delete/${oneArtist.id}" method="post">
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