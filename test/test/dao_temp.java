/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import Beans.Beans_temp;
import Daos.Dao_temp;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author joanv
 */
public class dao_temp {

    public static void main(String[] args) throws SQLException {
        Beans_temp b = new Beans_temp();
        List<Beans_temp> lista = new ArrayList<>();
//        lista = d.temp_s_all();
//        System.out.println(lista.get(2).getNombre());

    Dao_temp p = new Dao_temp();
    lista = p.temp_s_usuario("root");
        System.out.println(lista.get(0).getNombre());
    
    
    
            }
}
