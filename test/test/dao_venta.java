/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import Beans.Beans_venta;
import Daos.Dao_venta;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author joanv
 */
public class dao_venta {

    public static void main(String[] args) throws SQLException {
        Dao_venta p = new Dao_venta();
        List<Beans_venta> l = new ArrayList<>();
        l = p.venta_s_codigoventa(2);
        System.out.println(l.get(0).getHora());
        
    }
}
