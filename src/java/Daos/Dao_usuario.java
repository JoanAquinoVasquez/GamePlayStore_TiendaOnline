/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

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
public class Dao_usuario {

    Conexion cn;
    Connection con;
    private PreparedStatement pst;
    private ResultSet rs;
    Beans_usuario b_usuario;

    public Dao_usuario() throws SQLException {
        this.cn = new Conexion();
    }

    public List<Beans_usuario> usuario_s_usuario_clave(String usuario, String clave) throws SQLException {
        String sql = "call usuario_s_usuario_clave(?,?)"; //tengo que decirle que van dos epsacios con el ?
        try {
            con = cn.getConexion(); //lo recibo en forma de conexion
            pst = con.prepareStatement(sql); // espacio en donde se va a ejecutar la consulta.
            pst.setString(1, usuario);
            pst.setString(2, clave); //tengo que tener cuidado del tipo en este caso es string los 2, no hay problem
            rs = pst.executeQuery();

            List<Beans_usuario> lista = new ArrayList<>();

            //Lista<----b <--- rs en cada uno
            while (rs.next()) {
                b_usuario = new Beans_usuario(); //termina de crearse
                // b <--- 
                b_usuario.setCodigo_usuario(rs.getInt("codigo_usuario"));
                b_usuario.setUsuario(rs.getString("usuario"));
                b_usuario.setClave(rs.getString("clave"));
                b_usuario.setEstado(rs.getInt("estado"));
                //lista <--- b
                lista.add(b_usuario);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;

        } catch (SQLException e) {
            throw e;
        }
    }

    public List usuario_s_all() throws SQLException { //no tiene parametros
        String sql = "call usuario_s_all"; // si no tiene no hay ?
        try {
            con = cn.getConexion(); //lo recibo en forma de conexion
            pst = con.prepareStatement(sql); // espacio en donde se va a ejecutar la consulta.
            rs = pst.executeQuery();

            List<Beans_usuario> lista = new ArrayList<>();

            //Lista<----b <--- rs en cada uno
            while (rs.next()) {
                b_usuario = new Beans_usuario(); //termina de crearse
                // b <--- 
                b_usuario.setCodigo_usuario(rs.getInt("codigo_usuario"));
                b_usuario.setUsuario(rs.getString("usuario"));
                b_usuario.setClave(rs.getString("clave"));
                b_usuario.setEstado(rs.getInt("estado"));
                //lista <--- b
                lista.add(b_usuario);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;

        } catch (SQLException e) {
            throw e;
        }
    }
//    
//    public List<Beans_Usuario> usuario_s_codigo_usuario(int codigo_usuario) throws SQLException{
//        String sql = "call usuario_s_codigo_usuario(?)";
//        try{
//            con = cn.getConexion();
//            pst = con.prepareStatement(sql);
//            pst.setInt(1, codigo_usuario);
//            rs = pst.executeQuery();
//            
//            List<Beans_Usuario> lista = new ArrayList<>();
//            while (rs.next()) {
//                b_usuario = new Beans_Usuario();
//                b_usuario.setCodigo_usuario(rs.getInt("codigo_usuario"));
//                b_usuario.setClave(rs.getString("clave"));
//                b_usuario.setEstado(rs.getInt("estado"));
//                b_usuario.setUsuario(rs.getString("usuario"));
//                lista.add(b_usuario);
//            }
//            pst.close();
//            rs.close();
//            con.close();
//            return lista;
//        }catch (SQLException e) {
//            throw e;
//        }
//                    
//    }
//    
    public int usuario_s_contar_all() throws SQLException { //me va a retornar un ENTERO
        String sql = "call usuario_s_contar_all"; // si no tiene no hay ?
        int cantidad = 0;
        try {
            con = cn.getConexion(); //lo recibo en forma de conexion
            pst = con.prepareStatement(sql); // espacio en donde se va a ejecutar la consulta.
            rs = pst.executeQuery();

            //Lista<----b <--- rs en cada uno
            while (rs.next()) {
                cantidad=rs.getInt("t"); //el campo de t lo asigno a cantidad
            }
            pst.close();
            rs.close();
            con.close();
            return cantidad;

        } catch (SQLException e) {
            throw e;
        }
    }
//    
    public List<Beans_usuario> usuario_s_nombre (String usuario) throws SQLException {
        String sql = "call usuario_s_nombre(?)"; //tengo que decirle que van dos epsacios con el ?
        try {
            con = cn.getConexion(); //lo recibo en forma de conexion
            pst = con.prepareStatement(sql); // espacio en donde se va a ejecutar la consulta.
            pst.setString(1, usuario);
            rs = pst.executeQuery();

            List<Beans_usuario> lista = new ArrayList<>();

            //Lista<----b <--- rs en cada uno
            while (rs.next()) {
                b_usuario = new Beans_usuario(); //termina de crearse
                // b <--- 
                b_usuario.setCodigo_usuario(rs.getInt("codigo_usuario"));
                b_usuario.setUsuario(rs.getString("usuario"));
                b_usuario.setClave(rs.getString("clave"));
                b_usuario.setEstado(rs.getInt("estado"));
                //lista <--- b
                lista.add(b_usuario);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;

        } catch (SQLException e) {
            throw e;
        }
    }
//        
    public void usuario_i(Beans_usuario beans_u) throws SQLException{
        try{
            String sql="call usuario_i(?,?,?,?)";
            con=cn.getConexion();
            pst=con.prepareStatement(sql);
            pst.setInt(1, beans_u.getCodigo_usuario());
            pst.setString(2, beans_u.getUsuario());
            pst.setString(3, beans_u.getClave());
            pst.setInt(4, beans_u.getEstado());
            pst.executeUpdate();
            pst.close();
            con.close();
        }catch(SQLException e){
            throw e;     
         }
        
    }
//    
//    public void usuario_d_eliminacion_logica(int codigo_usuario) throws SQLException {
//        String sql="call usuario_d_eliminacion_logica(?)";
//        
//        try{
//            con=cn.getConexion();
//            pst=con.prepareStatement(sql);            
//            pst.setInt(1,codigo_usuario);
//            pst.executeUpdate(); 
//            pst.close();
//            con.close(); 
//         }catch(SQLException e){
//            throw e;     
//        }
//    }
//     public void usuario_u_codigo(Beans_Usuario beans_u) throws SQLException {
//        String sql="call usuario_u_codigo(?,?,?,?)";
//        
//        try{
//            con=cn.getConexion();
//            pst=con.prepareStatement(sql);            
//            pst.setInt(1,beans_u.getCodigo_usuario());
//            pst.setString(2,beans_u.getUsuario());
//            pst.setString(3, beans_u.getClave());
//            pst.setInt(4, beans_u.getEstado());
//
//            pst.executeUpdate(); 
//            pst.close();
//            con.close(); 
//         }catch(SQLException e){
//            throw e;     
//        }
//    }
}
