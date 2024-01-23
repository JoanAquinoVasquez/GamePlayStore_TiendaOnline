
<%@page import="Beans.Beans_producto"%>
<%@page import="Daos.Dao_producto"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Beans.Beans_categoria"%>
<%@page import="Daos.Dao_categoria"%>
<%@page import="Beans.Beans_usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>



<%
    // validación de usuario
    String usuario = "";
    List<Beans_usuario> lista_recibe = new ArrayList<>();

    if (request.getSession().getAttribute("usuario") != null) {
        usuario = (String) request.getSession().getAttribute("usuario");
        lista_recibe = (List) request.getSession().getAttribute("lista");

    } else {
        response.sendRedirect("login.jsp");
    }
    List<Beans_categoria> lista_categorias = new ArrayList<>();
    Dao_categoria c = new Dao_categoria();
    lista_categorias = (List) c.categoria_s_all();

%>

<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!--para el caché
        <meta http-equiv="Expires" content="0"> -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Nuevo Producto | GamePlayStore</title>
        <link rel="icon" href="../images/logo1.png">
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">

        <!-- Theme style -->
        <link rel="stylesheet" href="../dist/css/adminlte.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Tempusdominus Bootstrap 4 -->
        <link rel="stylesheet" href="../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- JQVMap -->
        <link rel="stylesheet" href="../plugins/jqvmap/jqvmap.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="../plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
        <!-- daterange picker -->
        <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
        <!-- Bootstrap Color Picker -->
        <link rel="stylesheet" href="../plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
        <!-- Tempusdominus Bootstrap 4 -->
        <link rel="stylesheet" href="../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
        <!-- Select2 -->
        <link rel="stylesheet" href="../plugins/select2/css/select2.min.css">
        <!-- Bootstrap4 Duallistbox -->
        <link rel="stylesheet" href="../plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">


        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
        <link href="../css/listar.css" rel="stylesheet" type="text/css"/>

    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">

            <!-- Preloader -->
            <div class="preloader flex-column justify-content-center align-items-center">
                <img class="animation__shake" src="../images/logo1.png" alt="GamePlayStore" height="60" width="60">
            </div>

            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="../menu/menu.jsp" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="#" class="nav-link">Contact</a>
                    </li>
                </ul>

                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">
                    <!-- Navbar Search -->
                    <li class="nav-item">
                        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                            <i class="fas fa-search"></i>
                        </a>
                        <div class="navbar-search-block">
                            <form class="form-inline">
                                <div class="input-group input-group-sm">
                                    <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                                    <div class="input-group-append">
                                        <button class="btn btn-navbar" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                        <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Messages Dropdown Menu -->
                    <li class="nav-item dropdown">
                        <a class="nav-link" data-toggle="dropdown" href="#">
                            <i class="far fa-comments"></i>
                            <span class="badge badge-danger navbar-badge">3</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                            <a href="#" class="dropdown-item">
                                <!-- Message Start -->
                                <div class="media">
                                    <img src="../images/logo1.png" alt="User Avatar" class="img-size-50 mr-3 img-circle">
                                    <div class="media-body">
                                        <h3 class="dropdown-item-title">
                                            Brad Diesel
                                            <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                                        </h3>
                                        <p class="text-sm">Call me whenever you can...</p>
                                        <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                                    </div>
                                </div>
                                <!-- Message End -->
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item">
                                <!-- Message Start -->
                                <div class="media">
                                    <img src="../images/logo1.png" alt="User Avatar" class="img-size-50 img-circle mr-3">
                                    <div class="media-body">
                                        <h3 class="dropdown-item-title">
                                            John Pierce
                                            <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                                        </h3>
                                        <p class="text-sm">I got your message bro</p>
                                        <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                                    </div>
                                </div>
                                <!-- Message End -->
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item">
                                <!-- Message Start -->
                                <div class="media">
                                    <img src="../images/logo1.png" alt="User Avatar" class="img-size-50 img-circle mr-3">
                                    <div class="media-body">
                                        <h3 class="dropdown-item-title">
                                            Nora Silvester
                                            <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                                        </h3>
                                        <p class="text-sm">The subject goes here</p>
                                        <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                                    </div>
                                </div>
                                <!-- Message End -->
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
                        </div>
                    </li>
                    <!-- Notifications Dropdown Menu -->
                    <li class="nav-item dropdown">
                        <a class="nav-link" data-toggle="dropdown" href="#">
                            <i class="far fa-bell"></i>
                            <span class="badge badge-warning navbar-badge">15</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                            <span class="dropdown-item dropdown-header">15 Notifications</span>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item">
                                <i class="fas fa-envelope mr-2"></i> 4 new messages
                                <span class="float-right text-muted text-sm">3 mins</span>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item">
                                <i class="fas fa-users mr-2"></i> 8 friend requests
                                <span class="float-right text-muted text-sm">12 hours</span>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item">
                                <i class="fas fa-file mr-2"></i> 3 new reports
                                <span class="float-right text-muted text-sm">2 days</span>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                            <i class="fas fa-expand-arrows-alt"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-widget="control-sidebar" data-controlsidebar-slide="true" href="#" role="button">
                            <i class="fas fa-th-large"></i>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="../menu/menu.jsp" class="brand-link">
                    <img src="../images/logo1.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                    <span class="brand-text font-weight-light">GamePlayStore</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar" >
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="../images/avatar5.png" class="img-circle elevation-2" alt="User Image">
                        </div>
                        <div class="info">
                            <a href="#" class="d-block"><%                                out.print("Hola " + usuario.toUpperCase());
                                %></a>
                        </div>
                    </div>

                    <!-- SidebarSearch Form -->
                    <div class="form-inline">
                        <div class="input-group" data-widget="sidebar-search">
                            <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-sidebar">
                                    <i class="fas fa-search fa-fw"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
                                 with font-awesome or any other icon font library -->
                            <li class="nav-item">
                                <a href="../menu/menu.jsp" class="nav-link">
                                    <i class="nav-icon fas fa-home"></i>
                                    <p>
                                        Inicio

                                    </p>
                                </a>
                            </li>

                            <li class="nav-item menu-open">
                                <a href="#" class="nav-link active">
                                    <i class="nav-icon fas fa-wrench"></i>
                                    <p>
                                        Mantenimiento
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="../categoria/categoria_listar.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>
                                                Categoria
                                                <i class="fas fa-angle-left right"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="../categoria/categoria_listar.jsp" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>Buscar Categoria</p>
                                                </a>
                                            </li>
                                        </ul>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="../categoria/categoria_nuevo.jsp" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>Nueva Categoria</p>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item menu-open">
                                        <a href="../producto/producto_listar.jsp" class="nav-link active">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>
                                                Producto
                                                <i class="fas fa-angle-left right"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="../producto/producto_listar.jsp" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>Buscar Producto</p>
                                                </a>
                                            </li>
                                        </ul>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="../producto/producto_nuevo.jsp" class="nav-link active">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>Nuevo Producto</p>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-money-check-alt"></i>
                                    <p>
                                        Operaciones
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>
                                                Venta
                                                <i class="fas fa-angle-left right"></i>
                                            </p>
                                        </a>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="../venta/venta_buscar.jsp" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>Buscar Venta</p>
                                                </a>
                                            </li>
                                        </ul>
                                        <ul class="nav nav-treeview">
                                            <li class="nav-item">
                                                <a href="../venta/venta_nuevo.jsp" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p>Nueva Venta</p>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-receipt"></i>
                                    <p>
                                        Reportes
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="../reportes/reporte_categoria/reporte_categorias_vista.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Reporte de Categorias</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../reportes/reporte_producto/reporte_producto_vista.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Reporte de Productos</p>
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="../reportes/reporte_venta/reporte_venta_vista.jsp" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Reporte de Ventas</p>
                                        </a>
                                    </li>
                                </ul>
                            <li class="nav-item">
                                <a href="salir.jsp" class="nav-link">
                                    <i class="nav-icon fas fa-sign-out-alt"></i>
                                    <p>
                                        Salir

                                    </p>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>

            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1> Nuevo <b>Producto</b></h1>
                            </div><!-- /.col -->    
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item" ><a href="../menu/menu.jsp">Menu Principal</a></li>
                                    <li class="breadcrumb-item"><a>Mantenimiento</a></li>
                                    <li class="breadcrumb-item"><a href="producto_listar.jsp">Producto</a></li>
                                    <li class="breadcrumb-item active"><a href="producto_nuevo.jsp">Nuevo Producto</a></li>
                                </ol>
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </section>

                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Agregar Producto</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <!-- form start -->
                                    <form id="form1" action="" method="post" enctype="multipart/form-data">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label class="col-1">Nombre</label>
                                                <input type="text" name="nombre" id="nombre">

                                            </div>
                                            <div class="form-group">
                                                <label class="col-1">Categoria</label>
                                                <select class="form-control col-2 select2" name="select_categoria">
                                                    <%  int i = 0;
                                                        while (i < lista_categorias.size()) {      //Bucle para listar categoria
                                                            if (lista_categorias.get(i).getEstado() == 0) { //Lista 1 vigente

                                                    %>

                                                    <option value="<%= lista_categorias.get(i).getNombre_categoria()%>"><%= lista_categorias.get(i).getNombre_categoria()%></option>

                                                    <%
                                                            }
                                                            i = i + 1;
                                                        }
                                                    %>
                                                </select>
                                                <div class="form-group">
                                                    <label class="col-1">Archivo</label>
                                                    <input type="file"  name="fichero" id="fichero" size="40" >
                                                    <div  id="file-preview-zone"></div>

                                                </div>
                                                <div class="form-group">
                                                    <label>Imagen</label>
                                                    <input  type="file" name="fichero1" id="fichero1" accept="image/*" size="40">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-1"></label>
                                                <label class="col-2">Fecha Producción</label>
                                                <input type="date" name="fecha_produccion" data-date="" data-date-format="DD MMMM YYYY">
                                            </div>

                                            <div class="form-group">
                                                <label class="col-1">Precio</label>
                                                <input class="col-1" name="precio" type="number" min="0" step="0.10" >
                                                <label class="col-3"></label>
                                                <label class="col-1">Stock</label>
                                                <input class="col-1" name="stock" type="number" min="0" >
                                            </div>
                                            <div class="form-group clearfix">
                                                <label  class="col-1">Conexión</label>
                                                <div class="icheck-primary d-inline">

                                                    <input type="checkbox" name="checkbox"  value="0" id="inalambrico"  >
                                                    <label for="inalambrico">Inalambrico
                                                    </label>
                                                </div>
                                                <div class="icheck-danger d-inline">

                                                    <input  type="checkbox"  name="checkbox" value="0" id="usb">
                                                    <label for="usb">Tipo USB
                                                    </label>
                                                </div>
                                                <div class="icheck-success d-inline">

                                                    <input type="checkbox" name="checkbox" value="0" id="usbc">
                                                    <label for="usbc">Tipo USB-C
                                                    </label>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <input type="reset" class="btn btn-danger" value="Cancelar">
                                                <input type="submit" class="btn btn-success" name="btn1" id="btn1" value="Agregar" onClick="cf1()">
                                                <a class="btn btn-dark" href="producto_listar.jsp">Regresar</a>
                                            </div>

                                        </div>
                                    </form>


                                    <form action="" method="post" hidden >
                                        <input type="submit" name="btnCambiar" id="btnCambiar" value="Cambiar"> 
                                        <input type="text" name="txtnombre" id="txtnombre">
                                        <input type="text" name="txtFichero1" id="txtFichero1">
                                        <input type="text" name="txtFichero2" id="txtFichero2">

                                    </form>

                                    <script>
                                        function cc() {
                                            document.getElementById('f11').value = document.getElementById('c1').value;
                                        }
                                        function cf1() {
                                            document.getElementById('txtFichero1').value = document.getElementById('fichero').value;
                                            document.getElementById('txtFichero2').value = document.getElementById('fichero1').value;
                                            document.getElementById('txtnombre').value = document.getElementById('nombre').value;
                                            //document.getElementById('btn1').click();
                                        }
                                    </script>

                                    <script>
                                        function readFile(input) {
                                            if (input.files && input.files[0]) {
                                                var reader = new FileReader();
                                                reader.onload = function (e) {
                                                    var filePreview = document.createElement('img');
                                                    filePreview.id = 'file-preview';
                                                    //e.target.result contents the base64 data from the image uploaded
                                                    filePreview.src = e.target.result;
                                                    filePreview.width = 100;
                                                    filePreview.height = 100;
                                                    console.log(e.target.result);

                                                    var previewZone = document.getElementById('file-preview-zone');

                                                    previewZone.appendChild(filePreview);
                                                }
                                                reader.readAsDataURL(input.files[0]);
                                            }
                                        }

                                        var fileUpload = document.getElementById('fichero1');
                                        fileUpload.onchange = function (e) {
                                            readFile(e.srcElement);
                                        }
                                    </script>


                                    <!-- codigo para subir el fichero al servidor-->
                                    <%
                                        File destino = new File("C:\\Users\\joanv\\Documents\\NetBeansProjects5toCiclo\\GamePlayStore\\web\\servidor");

                                        ServletRequestContext src = new ServletRequestContext(request);
                                        int contar = 0, contar1 = 0;
                                        String f1 = "", f2 = "", nombre1 = "";
                                        String categoria1 = "";
                                        List<Integer> recibe_codigos = new ArrayList<>();

                                        String fecha_produccion2 = null;
                                        String fecha_produccion3 = null;
                                        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
                                        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
                                        Dao_categoria p;
                                        Double precio = null;
                                        int stock = 0;
                                        f1 = null;
                                        f2 = null;
                                        nombre1 = null;
                                        int codigo_categoria = 0;
                                        //String c1 = "1";
                                        //String c2 = "1";
                                        //String c3 = "1";

                                        if (ServletFileUpload.isMultipartContent(src)) {
                                            DiskFileItemFactory factory = new DiskFileItemFactory((1024 * 1024), destino);
                                            ServletFileUpload upload = new ServletFileUpload(factory);

                                            java.util.List lista = upload.parseRequest(src);
                                            File file = null;
                                            java.util.Iterator it = lista.iterator();

                                            while (it.hasNext()) {
                                                FileItem item = (FileItem) it.next();
                                                if (item.isFormField()) {

                                                    contar1 = contar1 + 1;
                                                    if (contar1 == 1) {
                                                        nombre1 = item.getString();
                                                    }

                                                    if (contar1 == 2) {
                                                        categoria1 = item.getString();
                                                        p = new Dao_categoria();
                                                        
                                                        recibe_codigos = p.categoria_s_codigo_categoria(categoria1);
                                                        codigo_categoria = recibe_codigos.get(0);
                                                    }

                                                    if (contar1 == 3) {
                                                        Date result = formater.parse(item.getString());
                                                        fecha_produccion2 = formato.format(result);
                                                        fecha_produccion3 = fecha_produccion2.replace("-", "/");

                                                    }

                                                    if (contar1 == 4) {
                                                        precio = Double.parseDouble(item.getString());

                                                    }

                                                    if (contar1 == 5) {
                                                        stock = Integer.valueOf(item.getString());

                                                    }

                                                    /*if (contar1 == 6) {
                                                        c1 = "0";

                                                    }

                                                    if (contar1 == 7) {
                                                        c2 = "0";

                                                    }

                                                    if (contar1 == 8) {
                                                        c3 = "0";
                                                    }*/
                                                } else {
                                                    contar++;
                                                    file = new File(item.getName());
                                                    item.write(new File(destino, file.getName()));

                                                    if (contar == 1) {
                                                        f1 = item.getName().toString();
                                                    }
                                                    if (contar == 2) {
                                                        f2 = item.getName().toString();
                                                    }
                                                } // end if
                                            } // end while
                                            it.remove();
                                        } // end if

                                        int tama = 0, pos = 0;
                                        char valorcaracter[];
                                        if (contar > 0) {
                                            tama = f1.length();
                                        }
                                        pos = tama - 1;
                                        while (pos > 0) {
                                            valorcaracter = f1.toCharArray();

                                            if ((int) valorcaracter[pos] == 92) {

                                                f1 = f1.substring(pos + 1, tama);
                                                pos = 0;
                                            }
                                            pos = pos - 1;
                                        }
                                        tama = 0;
                                        pos = 0;
                                        if (contar > 0) {
                                            tama = f2.length();
                                        }
                                        pos = tama - 1;
                                        while (pos > 0) {
                                            valorcaracter = f2.toCharArray();

                                            if ((int) valorcaracter[pos] == 92) {

                                                f2 = f2.substring(pos + 1, tama);
                                                pos = 0;
                                            }
                                            pos = pos - 1;
                                        }

                                        if (f1 != null && f2 != null && nombre1 != null) {
                                            Dao_producto d_a1 = new Dao_producto();
                                            int codigo_archivo = d_a1.producto_s_contar_all() + 1;
                                            // int oc1 = Integer.valueOf(c1);
                                            // int oc2 = Integer.valueOf(c2);
                                            //int oc3 = Integer.valueOf(c3);

                                            /*int check1= checks.get(0);
                                            int check2 = checks.get(1);
                                            int check3 = checks.get(2);*/
                                            Beans_producto b_a = new Beans_producto();
                                            b_a.setCodigo_producto(codigo_archivo);
                                            b_a.setNombre_producto(nombre1);
                                            b_a.setArchivo(f1);
                                            b_a.setImagen(f2);
                                            b_a.setCodigo_categoria(codigo_categoria);
                                            b_a.setCategoria(categoria1);
                                            b_a.setFecha_produccion(fecha_produccion3);
                                            b_a.setEstado(0);
                                            b_a.setInalambrico(0);
                                            b_a.setPrecio(precio);
                                            b_a.setStock(stock);
                                            b_a.setUsb(1);
                                            b_a.setUsbc(1);
                                            Dao_producto d_a2 = new Dao_producto();
                                            d_a2.producto_i(b_a);
                                        } else {
                                            out.print("");
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <footer class="main-footer">
                <div class="float-right d-none d-sm-block">
                    <b>Version</b> 3.2.0
                </div>
                <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
        </div>


        <!-- Fecha formato DD-MM-YYYY -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.3/moment.min.js"></script>
        <!-- jQuery -->
        <script src="../plugins/jquery/jquery.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="../plugins/jquery-ui/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
                                        $.widget.bridge('uibutton', $.ui.button)
        </script>
        <!-- Bootstrap 4 -->
        <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap4 Duallistbox -->
        <script src="../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
        <!-- Select2 -->
        <link rel="stylesheet" href="../plugins/select2/css/select2.min.css">
        <!-- Bootstrap4 Duallistbox -->
        <script src="../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
        <!-- InputMask -->
        <script src="../plugins/moment/moment.min.js"></script>
        <script src="../plugins/inputmask/jquery.inputmask.min.js"></script>
        <!-- date-range-picker -->
        <script src="../plugins/daterangepicker/daterangepicker.js"></script>
        <!-- bootstrap color picker -->
        <script src="../plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <!-- Tempusdominus Bootstrap 4 -->
        <script src="../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
        <!-- Bootstrap Switch -->
        <script src="../plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
        <!-- BS-Stepper -->
        <script src="../plugins/bs-stepper/js/bs-stepper.min.js"></script>
        <!-- dropzonejs -->
        <script src="../plugins/dropzone/min/dropzone.min.js"></script>
        <!-- ChartJS -->
        <script src="../plugins/chart.js/Chart.min.js"></script>
        <!-- Sparkline -->
        <script src="../plugins/sparklines/sparkline.js"></script>
        <!-- JQVMap -->
        <script src="../plugins/jqvmap/jquery.vmap.min.js"></script>
        <script src="../plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="../plugins/jquery-knob/jquery.knob.min.js"></script>
        <!-- daterangepicker -->
        <script src="../plugins/moment/moment.min.js"></script>
        <script src="../plugins/daterangepicker/daterangepicker.js"></script>
        <!-- Tempusdominus Bootstrap 4 -->
        <script src="../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
        <!-- Summernote -->
        <script src="../plugins/summernote/summernote-bs4.min.js"></script>
        <!-- overlayScrollbars -->
        <script src="../plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../dist/js/adminlte.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="../dist/js/pages/dashboard.js"></script>
        <!-- Select2 -->
        <script src="../plugins/select2/js/select2.full.min.js"></script>
        <!-- Page specific script -->
        <script>
                                        $(function () {
                                            //Initialize Select2 Elements
                                            $('.select2').select2()
                                        })
                                        // BS-Stepper Init
                                        document.addEventListener('DOMContentLoaded', function () {
                                            window.stepper = new Stepper(document.querySelector('.bs-stepper'))
                                        })
        </script>
        <!-- Add -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
</html>
