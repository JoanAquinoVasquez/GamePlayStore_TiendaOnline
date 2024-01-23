/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Beans.Beans_categoria;
import Beans.Beans_usuario;
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
public class Dao_categoria {

    Conexion cn;
    Connection con;
    private PreparedStatement pst;
    private ResultSet rs;
    Beans_categoria b_categoria;

    public Dao_categoria() throws SQLException {
        this.cn = new Conexion();
    }

    public List categoria_s_all() throws SQLException { //no tiene parametros
        String sql = "call categoria_s_all()"; // si no tiene no hay ?
        try {
            con = cn.getConexion(); //lo recibo en forma de conexion
            pst = con.prepareStatement(sql); // espacio en donde se va a ejecutar la consulta.
            rs = pst.executeQuery();

            List<Beans_categoria> lista = new ArrayList<>();

            //Lista<----b <--- rs en cada uno
            while (rs.next()) {
                b_categoria = new Beans_categoria(); //termina de crearse
                // b <--- 
                b_categoria.setCodigo_categoria(rs.getInt("codigo_categoria"));
                b_categoria.setNombre_categoria(rs.getString("nombre_categoria"));
                b_categoria.setEstado(rs.getInt("estado"));
                //lista <--- b
                lista.add(b_categoria);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;

        } catch (SQLException e) {
            throw e;
        }
    }

    public int categoria_s_contar_all() throws SQLException { //me va a retornar un ENTERO
        String sql = "call categoria_s_contar_all()"; // si no tiene no hay ?
        int cantidad = 0;
        try {
            con = cn.getConexion(); //lo recibo en forma de conexion
            pst = con.prepareStatement(sql); // espacio en donde se va a ejecutar la consulta.
            rs = pst.executeQuery();

            //Lista<----b <--- rs en cada uno
            while (rs.next()) {
                cantidad = rs.getInt("t"); //el campo de t lo asigno a cantidad
            }
            pst.close();
            rs.close();
            con.close();
            return cantidad;

        } catch (SQLException e) {
            throw e;
        }
    }

    public List categoria_s_nombre(String nombre_categoria) throws SQLException {
        String sql = "call categoria_s_nombre(?)";
        try {
            con = cn.getConexion();  //lo recibo en un tipo Connection
            pst = con.prepareStatement(sql);
            pst.setString(1, nombre_categoria);
            rs = pst.executeQuery();

            List<Beans_categoria> lista = new ArrayList<>();

            //  b  <--  rs en cada uno
            while (rs.next()) {
                b_categoria = new Beans_categoria();
                b_categoria.setCodigo_categoria(rs.getInt("codigo_categoria"));
                b_categoria.setNombre_categoria(rs.getString("nombre_categoria"));
                b_categoria.setEstado(rs.getInt("estado"));
                lista.add(b_categoria);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;
        } catch (SQLException e) {
            throw e;
        }

    }

    public void categoria_d_eliminacion_logica(int codigo_categoria) throws SQLException {
        String sql = "call categoria_d_eliminacion_logica(?)";

        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setInt(1, codigo_categoria);

            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public void categoria_u_codigo_categoria(Beans_categoria beans_c) throws SQLException {
        String sql = "call categoria_u_codigo_categoria(?,?,?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setInt(1, beans_c.getCodigo_categoria());
            pst.setString(2, beans_c.getNombre_categoria());
            pst.setInt(3, beans_c.getEstado());

            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public void categoria_i(Beans_categoria beans_c) throws SQLException {
        try {
            String sql = "call categoria_i(?,?,?)";
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setInt(1, beans_c.getCodigo_categoria());
            pst.setString(2, beans_c.getNombre_categoria());
            pst.setInt(3, beans_c.getEstado());
            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public List categoria_s_codigo_categoria(String nombre_categoria) throws SQLException {
        String sql = "call categoria_s_codigo_categoria(?)";
        int codigo_categoria = 0;
        try {
            con = cn.getConexion();  //lo recibo en un tipo Connection
            pst = con.prepareStatement(sql);
            pst.setString(1, nombre_categoria);
            rs = pst.executeQuery();
            List<Integer> l = new ArrayList<>();
            //  b  <--  rs en cada uno
            while (rs.next()) {
                codigo_categoria = rs.getInt("codigo_categoria");
                l.add(codigo_categoria);
            }
            pst.close();
            rs.close();
            con.close();
            return l;
        } catch (SQLException e) {
            throw e;
        }
    }
        

    public List categoria_s_codigo_categoria1(int codigo_categoria) throws SQLException {
        String sql = "call categoria_s_codigo_categoria1(?)";
        try {
            con = cn.getConexion();  //lo recibo en un tipo Connection
            pst = con.prepareStatement(sql);
            pst.setInt(1, codigo_categoria);
            rs = pst.executeQuery();

            List<Beans_categoria> lista = new ArrayList<>();

            //Lista<----b <--- rs en cada uno
            while (rs.next()) {
                b_categoria = new Beans_categoria(); //termina de crearse
                // b <--- 
                b_categoria.setCodigo_categoria(rs.getInt("codigo_categoria"));
                b_categoria.setNombre_categoria(rs.getString("nombre_categoria"));
                b_categoria.setEstado(rs.getInt("estado"));
                //lista <--- b
                lista.add(b_categoria);
            }
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }
}
