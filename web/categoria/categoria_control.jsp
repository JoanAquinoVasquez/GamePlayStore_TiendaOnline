<%@page import="Beans.Beans_categoria"%>
<%@page import="Daos.Dao_categoria"%>
<%@page import="Beans.Beans_usuario"%>>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%

    // validación de usuario
    String usuario = "";

    if (request.getSession().getAttribute("usuario") != null) {
        usuario = (String) request.getSession().getAttribute("usuario");
        //out.print(usuario);
        // recibir datos del form
        String operacion = ""; // usa buscar - insertar
        String recibe_categoria = ""; //usa buscar - insertar -- eliminar
        recibe_categoria = request.getParameter("txt_categoria");
        List<Beans_categoria> lista_categorias = new ArrayList<>();

        operacion = request.getParameter("txt_operacion");
        ///////////  PARA BUSCAR
        if (operacion.equals("BUSCAR") == true) {
            Dao_categoria d_c = new Dao_categoria();
            lista_categorias = (List) d_c.categoria_s_nombre(recibe_categoria);
            HttpSession sesion1 = request.getSession(true); //crear la sesión
            sesion1.setAttribute("lista_categorias", lista_categorias); // creamos la lista
            response.sendRedirect("categoria_listar.jsp");
            //out.print(recibe_usuario);
        }

        if (operacion.equals("INSERTAR") == true) {

            int codigo_categoria = 0;
            Dao_categoria d_c1 = new Dao_categoria();
            codigo_categoria = d_c1.categoria_s_contar_all() + 1;

            recibe_categoria = request.getParameter("txt_nombre_categoria");

            int estado = 0;
            Beans_categoria b_c = new Beans_categoria();

            b_c.setCodigo_categoria(codigo_categoria);
            b_c.setNombre_categoria(recibe_categoria);
            b_c.setEstado(estado);

            Dao_categoria d_c2 = new Dao_categoria();
            d_c2.categoria_i(b_c);
            response.sendRedirect("categoria_listar.jsp");
        }

        ///////////  PARA ACTUALIZAR
        if (operacion.equals("ACTUALIZAR") == true) {
            // codigo de usuario
            int codigo_categoria = 0;
            codigo_categoria = Integer.valueOf(request.getParameter("txt_nombre_categoria1"));
            out.print(codigo_categoria + "<br>");

            String categoria_actualizar = "";
            categoria_actualizar = request.getParameter("txt_nombre_categoria");
            out.print(categoria_actualizar + "<br>");

            String categoria_eliminado = "";
            categoria_eliminado = request.getParameter("select_eliminado");
            out.print(categoria_eliminado + "<br>");

            Beans_categoria b_c = new Beans_categoria();
            b_c.setCodigo_categoria(codigo_categoria);
            b_c.setNombre_categoria(categoria_actualizar);
            b_c.setEstado(Integer.parseInt(categoria_eliminado));

            Dao_categoria d_c3 = new Dao_categoria();
            d_c3.categoria_u_codigo_categoria(b_c);

            response.sendRedirect("categoria_listar.jsp");
        }

        ///////////  PARA ELIMINAR
        if (operacion.equals("ELIMINAR") == true) {
            //out.print(operacion);
            recibe_categoria = request.getParameter("txt_categoria");
            int recibe_categoria1 = 0;
            recibe_categoria1 = Integer.parseInt(recibe_categoria);

            Dao_categoria d_c4 = new Dao_categoria();
            d_c4.categoria_d_eliminacion_logica(recibe_categoria1);
            response.sendRedirect("categoria_listar.jsp");
        }

    } else {
        response.sendRedirect("../login.jsp");
    }


%>

<html>
    <head>

    </head>
    <body onload="cerrar_ventana()">
        <script>
            function cerrar_ventana() {
                window.close();
            }
        </script>

    </body>
</html>