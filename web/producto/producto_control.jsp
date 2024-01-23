<%@page import="Beans.Beans_producto"%>
<%@page import="Daos.Dao_producto"%>
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
        String recibe_producto = ""; //usa buscar - insertar -- eliminar
        recibe_producto = request.getParameter("txt_nombre_producto");
        List<Beans_categoria> lista_productos = new ArrayList<>();

        operacion = request.getParameter("txt_operacion");
        ///////////  PARA BUSCAR
        if (operacion.equals("BUSCAR") == true) {
            Dao_producto d_c = new Dao_producto();
            lista_productos = (List) d_c.producto_s_nombre_producto(recibe_producto);
            HttpSession sesion1 = request.getSession(true); //crear la sesión
            sesion1.setAttribute("lista_productos", lista_productos); // creamos la lista
            response.sendRedirect("producto_listar.jsp");
            //out.print(recibe_usuario);
        }
        
        if (operacion.equals("BUSCAR1") == true) {
            Dao_producto d_c = new Dao_producto();
            lista_productos = (List) d_c.producto_s_nombre_producto(recibe_producto);
            HttpSession sesion1 = request.getSession(true); //crear la sesión
            sesion1.setAttribute("lista_productos", lista_productos); // creamos la lista
            response.sendRedirect("../venta/venta_nuevo.jsp");
            //out.print(recibe_usuario);
        }

        /*if (operacion.equals("INSERTAR") == true) {

            int codigo_producto = 0;
            Dao_producto d_c1 = new Dao_producto();
            codigo_producto = d_c1.producto_s_contar_all() + 1;
            recibe_producto = request.getParameter("nombre_producto");
            Part part = request.getPart("imagen");
            String imagen = part.getSubmittedFileName();
            Part part1 = request.getPart("archivo");
            String archivo = part.getSubmittedFileName();
            String recibe_categoria = request.getParameter("select_categoria");
            Dao_categoria d = new Dao_categoria();
            List<Integer> recibe_codigos = new ArrayList<>();
            recibe_codigos = d.categoria_s_codigo_categoria(recibe_categoria);
            String recibe_fecha = request.getParameter("fecha_produccion");
            Double precio = Double.valueOf(request.getParameter("precio"));
            int stock = Integer.valueOf(request.getParameter("stock"));
            int inalambrico = Integer.valueOf(request.getParameter("inalambrico"));
            int usb = Integer.valueOf(request.getParameter("usb"));
            int usbc = Integer.valueOf(request.getParameter("usbc"));

            if(inalambrico!=0){
                inalambrico = 1;
            }
            if(usb!=0){
                usb = 1;
            }
            if(usbc!=0){
                usbc = 1;
            }
            
            int estado = 0;
            Beans_categoria b_c = new Beans_categoria();
            Beans_producto b_p = new Beans_producto();

            b_p.setCodigo_producto(codigo_producto);
            b_p.setNombre_producto(recibe_producto);
            b_p.setImagen(imagen);
            b_p.setArchivo(archivo);
            b_p.setCodigo_categoria(codigo_categoria);
            b_p.setCategoria(recibe_categoria);
            b_p.setFecha_produccion(recibe_fecha);
            b_p.setPrecio(precio);
            b_p.setStock(stock);
            b_p.setInalambrico(inalambrico);
            b_p.setUsb(usb);
            b_p.setUsbc(usbc);
            b_p.setEstado(estado);

            Dao_producto d_c2 = new Dao_producto();
            d_c2.producto_i(b_p);
            response.sendRedirect("producto_listar.jsp");
        }
        
        ///////////  PARA ACTUALIZAR
        /*if (operacion.equals("ACTUALIZAR") == true) {
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
        }*/
        ///////////  PARA ELIMINAR
        if (operacion.equals("ELIMINAR") == true) {
            //out.print(operacion);
            int codigo_producto = Integer.valueOf(request.getParameter("codigo_producto"));

            Dao_categoria d_c4 = new Dao_categoria();
            d_c4.categoria_d_eliminacion_logica(codigo_producto);
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