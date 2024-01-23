<%@page import="java.util.Map"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<% String USERNAME = "root";
    String PASSWORD = "root";
    String HOST = "localhost";
    String PORT = "3306";
    String DATABASE = "gameplaystore";
    String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE + "?serverTimezone=UTC";

    Connection con = null;

    try {
        Class.forName(CLASSNAME);
        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        if (con != null) {
            out.println("conexión con éxito....");
        }
    } catch (ClassNotFoundException e) {
        System.err.println("Error 1: " + e);
    } catch (SQLException e) {
        System.err.println("Error 2: " + e);
    }


    String nombre_producto = request.getParameter("dato");
    
            
    File reportFile = new File(application.getRealPath("//reportes/reporte_producto/reporte_producto_nombre_desc.jasper"));
    
    Map parametros = new HashMap();
    
    parametros.put("Producto1", nombre_producto);

    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, con);
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);

    ServletOutputStream output = response.getOutputStream();
    response.getOutputStream();
    output.write(bytes, 0, bytes.length);
    output.flush();
    output.close();
%>

