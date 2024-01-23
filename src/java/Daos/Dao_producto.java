/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Beans_producto;
import Config.Conexion;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author joanv
 */
@MultipartConfig
public class Dao_producto {

    Conexion cn;
    Connection con;

    private PreparedStatement pst;
    private ResultSet rs;

    Beans_producto b_producto;

    public Dao_producto() throws SQLException {
        this.cn = new Conexion();
    }

    public List producto_s_codigo_producto(int codigo_producto) throws SQLException {
        String sql = "call producto_s_codigo_producto(?)";
        try {
            con = cn.getConexion();  //lo recibo en un tipo Connection
            pst = con.prepareStatement(sql);
            pst.setInt(1, codigo_producto);
            rs = pst.executeQuery();

            List<Beans_producto> lista = new ArrayList<>();

            //  b  <--  rs en cada uno
            while (rs.next()) {
                b_producto = new Beans_producto();
                b_producto.setCodigo_producto(rs.getInt("codigo_producto"));
                b_producto.setNombre_producto(rs.getString("nombre_producto"));
                b_producto.setImagen(rs.getString("imagen"));
                b_producto.setArchivo(rs.getString("archivo"));
                b_producto.setCodigo_categoria(rs.getInt("codigo_categoria"));
                b_producto.setCategoria(rs.getString("categoria"));
                b_producto.setFecha_produccion(rs.getString("fecha_produccion"));
                b_producto.setPrecio(rs.getDouble("precio"));
                b_producto.setStock(rs.getInt("stock"));
                b_producto.setInalambrico(rs.getInt("inalambrico"));
                b_producto.setUsb(rs.getInt("usb"));
                b_producto.setUsbc(rs.getInt("usbc"));
                b_producto.setEstado(rs.getInt("estado"));
                lista.add(b_producto);
            }

            pst.close();
            rs.close();
            con.close();
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }

    public List producto_s_all() throws SQLException {
        String sql = "call producto_s_all()";
        try {
            con = cn.getConexion();  //lo recibo en un tipo Connection
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();

            List<Beans_producto> lista = new ArrayList<>();

            //  b  <--  rs en cada uno
            while (rs.next()) {
                b_producto = new Beans_producto();
                b_producto.setCodigo_producto(rs.getInt("codigo_producto"));
                b_producto.setNombre_producto(rs.getString("nombre_producto"));
                b_producto.setImagen(rs.getString("imagen"));
                b_producto.setArchivo(rs.getString("archivo"));
                b_producto.setCodigo_categoria(rs.getInt("codigo_categoria"));
                b_producto.setCategoria(rs.getString("categoria"));
                b_producto.setFecha_produccion(rs.getString("fecha_produccion"));
                b_producto.setPrecio(rs.getDouble("precio"));
                b_producto.setStock(rs.getInt("stock"));
                b_producto.setInalambrico(rs.getInt("inalambrico"));
                b_producto.setUsb(rs.getInt("usb"));
                b_producto.setUsbc(rs.getInt("usbc"));
                b_producto.setEstado(rs.getInt("estado"));
                lista.add(b_producto);
            }

            pst.close();
            rs.close();
            con.close();
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }

    public int producto_s_contar_all() throws SQLException {
        String sql = "call producto_s_contar_all()";
        int cantidad = 0;
        try {
            con = cn.getConexion();  //lo recibo en un tipo Connection
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();

            while (rs.next()) {
                cantidad = rs.getInt("t");
            }

            pst.close();
            rs.close();
            con.close();

            return cantidad;
        } catch (SQLException e) {
            throw e;
        }
    }

    public List producto_s_nombre_producto(String nombre_producto) throws SQLException {
        String sql = "call producto_s_nombre_producto(?)";
        try {
            con = cn.getConexion();  //lo recibo en un tipo Connection
            pst = con.prepareStatement(sql);
            pst.setString(1, nombre_producto);
            rs = pst.executeQuery();

            List<Beans_producto> lista = new ArrayList<>();

            //  b  <--  rs en cada uno
            while (rs.next()) {
                b_producto = new Beans_producto();
                b_producto.setCodigo_producto(rs.getInt("codigo_producto"));
                b_producto.setNombre_producto(rs.getString("nombre_producto"));
                b_producto.setImagen(rs.getString("imagen"));
                b_producto.setArchivo(rs.getString("archivo"));
                b_producto.setCodigo_categoria(rs.getInt("codigo_categoria"));
                b_producto.setCategoria(rs.getString("categoria"));
                b_producto.setFecha_produccion(rs.getString("fecha_produccion"));
                b_producto.setPrecio(rs.getDouble("precio"));
                b_producto.setStock(rs.getInt("stock"));
                b_producto.setInalambrico(rs.getInt("inalambrico"));
                b_producto.setUsb(rs.getInt("usb"));
                b_producto.setUsbc(rs.getInt("usbc"));
                b_producto.setEstado(rs.getInt("estado"));
                lista.add(b_producto);
            }

            pst.close();
            rs.close();
            con.close();
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }

    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    public void producto_i(Beans_producto beans_p) throws SQLException {
       
        String sql = "call producto_i(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {

            con = cn.getConexion();
            pst = con.prepareStatement(sql);

            pst.setInt(1, beans_p.getCodigo_producto());
            pst.setString(2, beans_p.getNombre_producto());
            pst.setString(3, beans_p.getImagen());
            pst.setString(4, beans_p.getArchivo());
            pst.setInt(5, beans_p.getCodigo_categoria());
            pst.setString(6, beans_p.getCategoria());
            pst.setString(7, beans_p.getFecha_produccion());
            pst.setDouble(8, beans_p.getPrecio());
            pst.setInt(9, beans_p.getStock());
            pst.setInt(10, beans_p.getInalambrico());
            pst.setInt(11, beans_p.getUsb());
            pst.setInt(12, beans_p.getUsbc());
            pst.setInt(13, beans_p.getEstado());

            pst.executeUpdate();
            pst.close();
            con.close();

        } catch (SQLException e) {
            throw e;
        }

    }
    
    
    

    public void producto_u_codigo_producto(Beans_producto beans_p) throws SQLException {
        String sql = "call producto_u_codigo_producto(?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);

            pst.setInt(1, beans_p.getCodigo_producto());
            pst.setString(2, beans_p.getNombre_producto());
            pst.setString(3, beans_p.getImagen());
            pst.setString(4, beans_p.getArchivo());
            pst.setInt(5, beans_p.getCodigo_categoria());
            pst.setString(6, beans_p.getCategoria());
            pst.setString(7, beans_p.getFecha_produccion());
            pst.setDouble(8, beans_p.getPrecio());
            pst.setInt(9, beans_p.getStock());
            pst.setInt(10, beans_p.getInalambrico());
            pst.setInt(11, beans_p.getUsb());
            pst.setInt(12, beans_p.getUsbc());
            pst.setInt(13, beans_p.getEstado());

            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }
    
    public void producto_u_codigo_producto_stock(int codigo_producto, int stock) throws SQLException {
        String sql = "call producto_u_codigo_producto_stock(?,?)";

        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);

            pst.setInt(1, codigo_producto);
            pst.setInt(2, stock);
         
            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public void producto_d_eliminacion_logica(int codigo_producto) throws SQLException {
        String sql = "call producto_d_eliminacion_logica(?)";

        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setInt(1, codigo_producto);
            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

}
