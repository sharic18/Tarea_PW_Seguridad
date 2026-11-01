<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar sesión</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f2f5; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .caja { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.2); width: 300px; }
        input { width: 100%; padding: 8px; margin: 8px 0; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background: #c8102e; color: white; border: none; cursor: pointer; }
        .error { color: red; }
        .ok { color: green; }
    </style>
</head>
<body>
    <div class="caja">
        <h2>Iniciar sesión</h2>

        <c:if test="${param.error != null}">
            <p class="error">Usuario o clave incorrectos</p>
        </c:if>
        <c:if test="${param.logout != null}">
            <p class="ok">Cerraste sesión correctamente</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <input type="text" name="username" placeholder="Usuario" required />
            <input type="password" name="password" placeholder="Clave" required />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button type="submit">Entrar</button>
        </form>
    </div>
</body>
</html>