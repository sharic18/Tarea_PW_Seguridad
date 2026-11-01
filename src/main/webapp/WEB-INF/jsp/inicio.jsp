<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inicio</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        a { margin-right: 10px; }
        .rol { background: #eee; padding: 8px; border-radius: 4px; display: inline-block; }
    </style>
</head>
<body>
    <h1>Bienvenido, <sec:authentication property="name" /></h1>
    <p class="rol">Tus roles: <sec:authentication property="authorities" /></p>

    <h3>Opciones disponibles para ti</h3>

    <sec:authorize access="hasAnyAuthority('ADMIN','DOCENTE')">
        <a href="${pageContext.request.contextPath}/new">Nuevo</a>
        <a href="${pageContext.request.contextPath}/edit/1">Editar</a>
    </sec:authorize>

    <sec:authorize access="hasAuthority('ADMIN')">
        <a href="${pageContext.request.contextPath}/delete/1">Eliminar</a>
    </sec:authorize>

    <sec:authorize access="hasAnyAuthority('ESTUDIANTE','GRADUADO') and !hasAnyAuthority('ADMIN','DOCENTE')">
        <p>Solo tienes acceso de consulta.</p>
    </sec:authorize>

    <br><br>
    <h3>Probar acceso por URL</h3>
    <a href="${pageContext.request.contextPath}/new">/new</a>
    <a href="${pageContext.request.contextPath}/edit/1">/edit/1</a>
    <a href="${pageContext.request.contextPath}/delete/1">/delete/1</a>

    <br><br>
    <form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit">Cerrar sesión</button>
    </form>
</body>
</html>