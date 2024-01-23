/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Beans_detalle_venta;
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
public class Dao_detalle_venta {
       Conexion cn;
    Connection con;
    private PreparedStatement pst;
    private ResultSet rs;
    Beans_detalle_venta detalle_venta;

    public Dao_detalle_venta() throws SQLException {
        this.cn = new Conexion();
    }

    public List detalle_venta_s_all() throws SQLException { //no tiene parametros
        String sql = "call detalle_venta_s_all()"; // si no tiene no hay ?
        try {
            con = cn.getConexion(); //lo recibo en forma de conexion
            pst = con.prepareStatement(sql); // espacio en donde se va a ejecutar la consulta.
            rs = pst.executeQuery();

            List<Beans_detalle_venta> lista = new ArrayList<>();

            //Lista<----b <--- rs en cada uno
            while (rs.next()) {
                detalle_venta = new Beans_detalle_venta(); //termina de crearse
                // b <--- 
                detalle_venta.setCodigoDV(rs.getInt("codigoDV"));
                detalle_venta.setCodigoventa(rs.getInt("codigoventa"));
                detalle_venta.setCodigoproducto(rs.getInt("codigoproducto"));
                detalle_venta.setCantidad(rs.getInt("cantidad"));
                detalle_venta.setPrecio(rs.getDouble("precio"));
                detalle_venta.setTotal(rs.getDouble("total"));
                //lista <--- b
                lista.add(detalle_venta);
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

    public void detalle_venta_i(Beans_detalle_venta detalle_venta) throws SQLException {
        try {
            String sql = "call detalle_venta_i(?,?,?,?,?,?)";
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setInt(1, detalle_venta.getCodigoDV());
            pst.setInt(2, detalle_venta.getCodigoventa());
            pst.setInt(3,detalle_venta.getCodigoproducto());
            pst.setDouble(4, detalle_venta.getCantidad());
            pst.setDouble(5, detalle_venta.getPrecio());
            pst.setDouble(6, detalle_venta.getTotal());
            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

}
