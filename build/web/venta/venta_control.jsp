<%-- 
    Document   : venta_control
    Created on : 09-sep-2022, 13:06:58
    Author     : joanv
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.Calendar"%>
<%@page import="Beans.Beans_detalle_venta"%>
<%@page import="Daos.Dao_detalle_venta"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Beans.Beans_venta"%>
<%@page import="Daos.Dao_venta"%>
<%@page import="Beans.Beans_temp"%>
<%@page import="Daos.Dao_producto"%>
<%@page import="Daos.Dao_temp"%>
<%@page import="Beans.Beans_producto"%>
<%@page import="Beans.Beans_usuario"%>>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%

    // validación de usuario
    Calendar fecha = Calendar.getInstance();
    int mes = fecha.get(Calendar.MONTH) + 1;
    String dia = null;
    if (fecha.get(Calendar.DATE) <= 9) {
        dia = 0 + "" + fecha.get(Calendar.DATE);
    } else {
        dia = String.valueOf(fecha.get(Calendar.DATE));
    }
    
    String mes1 = null;
    if (fecha.get(Calendar.MONTH) <= 9) {
        mes1 = 0 + "" + mes;
    } else {
        mes1 = String.valueOf(mes);
    }
    
    String min = null;
    if (fecha.get(Calendar.MINUTE) <= 9) {
        min = 0 + "" + fecha.get(Calendar.MINUTE);
    } else {
        min = String.valueOf(fecha.get(Calendar.MINUTE));
    }
    
    String hora = null;
    if (fecha.get(Calendar.HOUR_OF_DAY) <= 9) {
        hora = 0 + "" + fecha.get(Calendar.HOUR_OF_DAY);
    } else {
        hora = String.valueOf(fecha.get(Calendar.HOUR_OF_DAY));
    }
    
    String segundos = null;
    if (fecha.get(Calendar.SECOND) <= 9) {
        segundos = 0 + "" + fecha.get(Calendar.SECOND);
    } else {
        segundos = String.valueOf(fecha.get(Calendar.SECOND));
    }
    
    String usuario = "";
    
    if (request.getSession().getAttribute("usuario") != null) {
        usuario = (String) request.getSession().getAttribute("usuario");
        //out.print(usuario);
        // recibir datos del form

        String operacion = "";
        operacion = request.getParameter("txt_operacion");
        List<Beans_venta> lista_ventas = new ArrayList<>();
        
        if (operacion.equals("BUSCAR") == true) {
            int recibe_codigoventa = 0;
            recibe_codigoventa = Integer.valueOf(request.getParameter("txt_codigoventa"));
            Dao_venta d_v = new Dao_venta();
            lista_ventas = (List) d_v.venta_s_codigoventa(recibe_codigoventa);
            HttpSession sesion1 = request.getSession(true); //crear la sesión
            sesion1.setAttribute("lista_ventas", lista_ventas); // creamos la lista
            response.sendRedirect("venta_buscar.jsp");
            //out.print(recibe_usuario);
        }
        
        if (operacion.equals("LISTAR") == true) {
            Dao_venta d_v1 = new Dao_venta();
            lista_ventas = (List) d_v1.venta_s_all();
            HttpSession sesion1 = request.getSession(true); //crear la sesión
            sesion1.setAttribute("lista_ventas", lista_ventas); // creamos la lista
            response.sendRedirect("venta_buscar.jsp");
            //out.print(recibe_usuario);
        }
        
        if (operacion.equals("Agregar") == true) {
            int recibe_producto = 0; //usa buscar - insertar -- eliminar
            recibe_producto = Integer.valueOf(request.getParameter("codigoproducto"));
            int codigo_correlativo = 0;
            
            Dao_temp t = new Dao_temp();
            List<Beans_temp> l1 = new ArrayList<>();
            l1 = t.temp_s_all();
            if(l1.size()!=0){
            List<Integer> l2 = new ArrayList<>();
            for(int i =0; i<l1.size();i++){
                l2.add(l1.get(i).getCodigocorrelativo());
            }
            
            int mayor = Integer.valueOf(Collections.max(l2));
            codigo_correlativo = mayor+1;
            }else{
                codigo_correlativo = l1.size()+1;
            }
            
            Dao_producto p = new Dao_producto();
            List<Beans_producto> bp = new ArrayList<>();
            bp = (List) p.producto_s_codigo_producto(recibe_producto);
            
            int cantidad = Integer.valueOf(request.getParameter("cantidad"));
            
            if (bp.get(0).getStock() >= cantidad) {
                
                Beans_temp t1 = new Beans_temp();
                t1.setCodigocorrelativo(codigo_correlativo);
                t1.setCodigoproducto(recibe_producto);
                t1.setNombre(bp.get(0).getNombre_producto());
                t1.setCantidad(cantidad);
                t1.setPrecio(bp.get(0).getPrecio());
                t1.setTotal(cantidad * bp.get(0).getPrecio());
                t1.setUsuario(usuario);
                int cant_actual = bp.get(0).getStock() - cantidad;
                Dao_producto dp8 = new Dao_producto();
                dp8.producto_u_codigo_producto_stock(recibe_producto, cant_actual);
                Dao_temp d_c3 = new Dao_temp();
                d_c3.temp_i(t1);
                response.sendRedirect("venta_nuevo.jsp");
            } else {
                response.sendRedirect("venta_nuevo.jsp");
            }
        }
        
        if (operacion.equals("eliminartempcodigo")) {
            int recibe_correlativo = 0;
            recibe_correlativo = Integer.valueOf(request.getParameter("codigocorrelativo"));
            Dao_temp temp1 = new Dao_temp();
            temp1.temp_d_codigocorrelativo(recibe_correlativo);
            response.sendRedirect("venta_nuevo.jsp");
        }
        if (operacion.equals("Restablecer")) {
            
            int recibe_producto = 0; //usa buscar - insertar -- eliminar
            int cantidad = 0;
            Dao_temp t11 = new Dao_temp();
            List<Beans_temp> t12 = new ArrayList<>();
            t12 = t11.temp_s_usuario(usuario);
            
            for (int z = 0; z < t12.size(); z++) {
                
                recibe_producto = t12.get(z).getCodigoproducto();
                cantidad = t12.get(z).getCantidad();
                
                List<Beans_producto> bp1 = null;
                bp1 = new ArrayList<>();
                Dao_producto dp1 = null;
                dp1 = new Dao_producto();
                bp1 = (List) dp1.producto_s_codigo_producto(recibe_producto);
                int cant_actual = bp1.get(0).getStock() + cantidad;
                Dao_producto dp9 = null;
                dp9 = new Dao_producto();
                dp9.producto_u_codigo_producto_stock(recibe_producto, cant_actual);
            }
            Dao_temp d_c4 = new Dao_temp();
            d_c4.temp_d_usuario(usuario);
            response.sendRedirect("venta_nuevo.jsp");
        }
        
        if (operacion.equals("Generar Venta")) {
            
            int codigo_venta = 0;
            Dao_venta v = new Dao_venta();
            codigo_venta = v.venta_s_all().size() + 1;
            
            double subtotal = Double.valueOf(request.getParameter("subtotal").replace(",", "."));
            double igv = Double.valueOf(request.getParameter("igv").replace(",", "."));
            double total = Double.valueOf(request.getParameter("total").replace(",", "."));
            
            String fecha_completa = dia + "/" + mes + "/" + fecha.get(java.util.Calendar.YEAR);
            String hora_completa = hora + ":" + min + ":" + segundos;
            
            Beans_venta bv = new Beans_venta();
            bv.setCodigoventa(codigo_venta);
            bv.setFecha(fecha_completa);
            bv.setHora(hora_completa);
            bv.setSubtotal(subtotal);
            bv.setIgv(igv);
            bv.setTotal(total);
            
            Dao_venta v1 = new Dao_venta();
            v1.venta_i(bv);
            
            List<Beans_temp> lt = new ArrayList<>();
            Dao_temp dp = new Dao_temp();
            lt = dp.temp_s_usuario(usuario);
            
            for (int x = 0; x < lt.size(); x++) {
                Dao_detalle_venta ddv = null;
                ddv = new Dao_detalle_venta();
                int j = ddv.detalle_venta_s_all().size();
                
                Beans_detalle_venta bdv = null;
                bdv = new Beans_detalle_venta();
                
                bdv.setCodigoDV(j + 1);
                bdv.setCodigoventa(codigo_venta);
                bdv.setCodigoproducto(lt.get(x).getCodigoproducto());
                bdv.setCantidad(lt.get(x).getCantidad());
                bdv.setPrecio(lt.get(x).getPrecio());
                bdv.setTotal(lt.get(x).getTotal());
                Dao_detalle_venta dv1 = null;
                dv1 = new Dao_detalle_venta();
                dv1.detalle_venta_i(bdv);
            }
            
            Dao_temp d_c5 = new Dao_temp();
            d_c5.temp_d_usuario(usuario);
            response.sendRedirect("venta_nuevo.jsp");
            
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
