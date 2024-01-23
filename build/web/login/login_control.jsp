
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Beans.Beans_usuario"%>
<%@page import="Daos.Dao_usuario"%>
<%
    String usuario = "";
    String clave = "";
    
    usuario = request.getParameter("usuario");
    clave = request.getParameter("clave");
    
    //out.print(usuario + "-" + clave);
    
    Dao_usuario b_usuario=new Dao_usuario();
    List <Beans_usuario> lista_recibe=new ArrayList<>();
    lista_recibe=b_usuario.usuario_s_usuario_clave(usuario, clave);
    
    int cantidad=0;
    cantidad=lista_recibe.size();
    
    if(cantidad==1){
        // CREAR LAS VARIABLES DE SESION
        HttpSession sesion1 =request.getSession(true); //crear la sesión
        sesion1.setAttribute("usuario", usuario); // creamos una variable
        sesion1.setAttribute("lista", lista_recibe);  //estoy pasando toda la lista
        response.sendRedirect("../menu/menu.jsp");
    }else{
        response.sendRedirect("login.jsp");
    }
%>
