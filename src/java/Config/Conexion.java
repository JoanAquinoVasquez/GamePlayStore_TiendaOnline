/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author joanv
 */
public class Conexion {
     private String USERNAME = "root";
    private String PASSWORD = "root"; //la contraseña de la base de datos
    private String HOST = "localhost";
    private String PORT = "3306";
    private String DATABASE = "gameplaystore";
    private String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    private String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE + "?ServerTimeZone=UTC"; //para la fecha
    
    private Connection con;
    
    public Conexion() throws SQLException{
        try{
            Class.forName(CLASSNAME);
            con=DriverManager.getConnection(URL,USERNAME,PASSWORD);
        }catch(ClassNotFoundException e){
            System.out.println("Error 1: "+e);
        }catch(SQLException e){
            System.out.println("Error 2: "+e);
        }
    }
    
    public Connection getConexion(){ //para abrir la conexion
        return con;
    }
    
    public void close(){ //para cerrar la conexion
        con = null;
    }
    
    //para verificar la conexion
    public static Connection coon;
    private static Statement stm;
    private static ResultSet rs;
    
    
    public static void main(String[] args) throws SQLException { // para verificar la conexion
        Conexion c1 = new Conexion();
        Conexion.coon=c1.getConexion();
        if(coon!=null){
            System.out.println("Conexión exitosa");
            System.out.println("-----------------");
        }else
            System.out.println("No se pudo conectar");
    }
    
}
