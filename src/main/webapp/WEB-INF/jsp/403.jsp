<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Acceso denegado</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 100px; background: #fff5f5; }
        h1 { font-size: 80px; color: #c8102e; margin: 0; }
        a { color: #c8102e; }
    </style>
</head>
<body>
    <h1>403</h1>
    <h2>Acceso denegado</h2>
    <p>No tienes permiso para entrar a esta página con tu rol actual.</p>
    <a href="${pageContext.request.contextPath}/">Volver al inicio</a>
</body>
</html>