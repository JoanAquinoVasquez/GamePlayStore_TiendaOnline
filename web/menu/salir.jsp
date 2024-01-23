<%
    if (session.getAttribute("usuario") != null ) {
        session.setAttribute("usuario", null);
        session.setAttribute("lista", null);
        response.sendRedirect("../login/login.jsp");
    }
%>
