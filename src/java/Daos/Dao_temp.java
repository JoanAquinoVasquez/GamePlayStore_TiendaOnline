/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Beans_temp;
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
public class Dao_temp {

    Conexion cn;
    Connection con;
    private PreparedStatement pst;
    private ResultSet rs;
    Beans_temp temp;

    public Dao_temp() throws SQLException {
        this.cn = new Conexion();
    }

    public List temp_s_all() throws SQLException { //no tiene parametros
        String sql = "call temp_s_all()"; // si no tiene no hay ?
        try {
            con = cn.getConexion(); //lo recibo en forma de conexion
            pst = con.prepareStatement(sql); // espacio en donde se va a ejecutar la consulta.
            rs = pst.executeQuery();

            List<Beans_temp> lista = new ArrayList<>();

            //Lista<----b <--- rs en cada uno
            while (rs.next()) {
                temp = new Beans_temp(); //termina de crearse
                // b <--- 
                temp.setCodigocorrelativo(rs.getInt("codigocorrelativo"));
                temp.setCodigoproducto(rs.getInt("codigoproducto"));
                temp.setNombre(rs.getString("nombre"));
                temp.setCantidad(rs.getInt("cantidad"));
                temp.setPrecio(rs.getDouble("precio"));
                temp.setTotal(rs.getDouble("total"));
                //lista <--- b
                lista.add(temp);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;

        } catch (SQLException e) {
            throw e;
        }
    }

    public void temp_d() throws SQLException {
        String sql = "call temp_d()";

        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            pst.close();
            rs.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }
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

    public void temp_i(Beans_temp temp) throws SQLException {
        try {
            String sql = "call temp_i(?,?,?,?,?,?,?)";
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setInt(1, temp.getCodigocorrelativo());
            pst.setInt(2, temp.getCodigoproducto());
            pst.setString(3, temp.getNombre());
            pst.setInt(4, temp.getCantidad());
            pst.setDouble(5, temp.getPrecio());
            pst.setDouble(6, temp.getTotal());
            pst.setString(7, temp.getUsuario());
            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public void temp_d_codigocorrelativo(int codigocorrelativo) throws SQLException {
        try {
            String sql = "call temp_d_codigocorrelativo(?)";
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setInt(1, codigocorrelativo);
            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public List temp_s_usuario(String usuario) throws SQLException {
        String sql = "call temp_s_usuario(?)";
        try {
            con = cn.getConexion(); //lo recibo en forma de conexion

            pst = con.prepareStatement(sql); // espacio en donde se va a ejecutar la consulta.
            pst.setString(1, usuario);
            rs = pst.executeQuery();

            List<Beans_temp> lista = new ArrayList<>();

            //Lista<----b <--- rs en cada uno
            while (rs.next()) {
                temp = new Beans_temp(); //termina de crearse
                // b <--- 
                temp.setCodigocorrelativo(rs.getInt("codigocorrelativo"));
                temp.setCodigoproducto(rs.getInt("codigoproducto"));
                temp.setNombre(rs.getString("nombre"));
                temp.setCantidad(rs.getInt("cantidad"));
                temp.setPrecio(rs.getDouble("precio"));
                temp.setTotal(rs.getDouble("total"));
                temp.setUsuario(rs.getString("usuario"));
                //lista <--- b
                lista.add(temp);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }
    public void temp_d_usuario(String usuario) throws SQLException {
        String sql = "call temp_d_usuario(?)";
        try {
            con = cn.getConexion(); //lo recibo en forma de conexion

            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, usuario);
            pst.executeUpdate();
            pst.close();
            con.close();


        } catch (SQLException e) {
            throw e;
        }
    }

//    public List categoria_s_codigo_categoria(String nombre_categoria) throws SQLException {
//        String sql = "call categoria_s_codigo_categoria(?)";
//        int codigo_categoria = 0;
//        try {
//            con = cn.getConexion();  //lo recibo en un tipo Connection
//            pst = con.prepareStatement(sql);
//            pst.setString(1, nombre_categoria);
//            rs = pst.executeQuery();
//            List<Integer> l = new ArrayList<>();
//            //  b  <--  rs en cada uno
//            while (rs.next()) {
//                codigo_categoria = rs.getInt("codigo_categoria");
//                l.add(codigo_categoria);
//            }
//            pst.close();
//            rs.close();
//            con.close();
//            return l;
//        } catch (SQLException e) {
//            throw e;
//        }
//    }
//
//    public List categoria_s_codigo_categoria1(int codigo_categoria) throws SQLException {
//        String sql = "call categoria_s_codigo_categoria1(?)";
//        try {
//            con = cn.getConexion();  //lo recibo en un tipo Connection
//            pst = con.prepareStatement(sql);
//            pst.setInt(1, codigo_categoria);
//            rs = pst.executeQuery();
//
//            List<Beans_categoria> lista = new ArrayList<>();
//
//            //Lista<----b <--- rs en cada uno
//            while (rs.next()) {
//                b_categoria = new Beans_categoria(); //termina de crearse
//                // b <--- 
//                b_categoria.setCodigo_categoria(rs.getInt("codigo_categoria"));
//                b_categoria.setNombre_categoria(rs.getString("nombre_categoria"));
//                b_categoria.setEstado(rs.getInt("estado"));
//                //lista <--- b
//                lista.add(b_categoria);
//            }
//            return lista;
//        } catch (SQLException e) {
//            throw e;
//        }
//    }
}
