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
	<a href="/dashboard"></a>
	<form:form action="/new/song" method="post" modelAttribute="songs">
		<p>
			<form:label path="title">Title</form:label>
			<form:errors path="title"/>
			<form:input path="title"/>
		</p>
		<p>
			<form:label path="artist">Artist</form:label>
			<form:errors path="artist"/>
			<form:input path="artist"/>
		</p>
		<p>
			<form:label path="rating">Rating(1-10)</form:label>
			<form:errors path="rating"/>
			<form:input type="number" path="rating"/>
		</p>
		<button>Add Song</button>
	</form:form>
</body>
</html>