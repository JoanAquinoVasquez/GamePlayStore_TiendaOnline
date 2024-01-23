/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Beans_temp;
import Beans.Beans_venta;
import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author joanv
 */
public class Dao_venta {

    Conexion cn;
    Connection con;
    private PreparedStatement pst;
    private ResultSet rs;
    Beans_venta venta;

    public Dao_venta() throws SQLException {
        this.cn = new Conexion();
    }

    public List venta_s_all() throws SQLException { //no tiene parametros
        String sql = "call venta_s_all()"; // si no tiene no hay ?
        try {
            con = cn.getConexion(); //lo recibo en forma de conexion
            pst = con.prepareStatement(sql); // espacio en donde se va a ejecutar la consulta.
            rs = pst.executeQuery();

            List<Beans_venta> lista = new ArrayList<>();

            //Lista<----b <--- rs en cada uno
            while (rs.next()) {
                venta = new Beans_venta(); //termina de crearse
                // b <--- 
                venta.setCodigoventa(rs.getInt("codigoventa"));
                venta.setFecha(rs.getString("fecha"));
                venta.setHora(rs.getString("hora"));
                venta.setSubtotal(rs.getDouble("subtotal"));
                venta.setIgv(rs.getDouble("igv"));
                venta.setTotal(rs.getDouble("total"));
                //lista <--- b
                lista.add(venta);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;

        } catch (SQLException e) {
            throw e;
        }
    }

    public List venta_s_codigoventa(int codigoventa) throws SQLException { //no tiene parametros
        String sql = "call venta_s_codigoventa(?)"; // si no tiene no hay ?
        try {
            con = cn.getConexion(); //lo recibo en forma de conexion
            pst = con.prepareStatement(sql); // espacio en donde se va a ejecutar la consulta.
            pst.setInt(1, codigoventa);
            rs = pst.executeQuery();

            List<Beans_venta> lista = new ArrayList<>();

            //Lista<----b <--- rs en cada uno
            while (rs.next()) {
                venta = new Beans_venta(); //termina de crearse
                // b <--- 
                venta.setCodigoventa(rs.getInt("codigoventa"));
                venta.setFecha(rs.getString("fecha"));
                venta.setHora(rs.getString("hora"));
                venta.setSubtotal(rs.getDouble("subtotal"));
                venta.setIgv(rs.getDouble("igv"));
                venta.setTotal(rs.getDouble("total"));
                //lista <--- b
                lista.add(venta);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;

        } catch (SQLException e) {
            throw e;
        }
    }

//    public void temp_d() throws SQLException {
//        String sql = "call temp_d()";
//
//        try {
//            con = cn.getConexion();
//            pst = con.prepareStatement(sql);
//            rs = pst.executeQuery();
//            pst.close();
//            rs.close();
//            con.close();
//        } catch (SQLException e) {
//            throw e;
//        }
//    }
//
//    public void categoria_u_codigo_categoria(Beans_categoria beans_c) throws SQLException {
//        String sql = "call categoria_u_codigo_categoria(?,?,?)";
//        try {
//            con = cn.getConexion();
//            pst = con.prepareStatement(sql);
//            pst.setInt(1, beans_c.getCodigo_categoria());
//            pst.setString(2, beans_c.getNombre_categoria());
//            pst.setInt(3, beans_c.getEstado());
//
//            pst.executeUpdate();
//            pst.close();
//            con.close();
//        } catch (SQLException e) {
//            throw e;
//        }
//    }
    public void venta_i(Beans_venta venta) throws SQLException {
        try {
            String sql = "call venta_i(?,?,?,?,?,?)";
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setInt(1, venta.getCodigoventa());
            pst.setString(2, venta.getFecha());
            pst.setString(3, venta.getHora());
            pst.setDouble(4, venta.getSubtotal());
            pst.setDouble(5, venta.getIgv());
            pst.setDouble(6, venta.getTotal());
            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

}
