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
	<h3>Top Ten Songs</h3>
	<c:forEach items="${topSongs}" var="song">
		<p><c:out value="${song.rating}"/><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></p>
	</c:forEach>
</body>
</html>