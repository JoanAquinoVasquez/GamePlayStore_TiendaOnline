/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import Beans.Beans_detalle_venta;
import Beans.Beans_temp;
import Daos.Dao_detalle_venta;
import Daos.Dao_temp;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author joanv
 */
public class detalle_venta {

    public static void main(String[] args) throws SQLException {
        
        Beans_detalle_venta b = new Beans_detalle_venta();
        Dao_detalle_venta d = new Dao_detalle_venta();
        List<Beans_detalle_venta> lista = new ArrayList<>();
//        lista = d.temp_s_all();
//        System.out.println(lista.get(2).getNombre());
        
        b.setCodigoDV(5);
        b.setCodigoproducto(4);
        b.setCodigoventa(2);
        b.setPrecio(21.4);
        b.setCantidad(2);
        b.setTotal(42.2);
        d.detalle_venta_i(b);
    }
}
