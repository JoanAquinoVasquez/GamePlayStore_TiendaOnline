/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import Beans.Beans_categoria;
import Beans.Beans_producto;
import Daos.Dao_categoria;
import Daos.Dao_producto;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author joanv
 */
public class dao {

    public static void main(String[] args) throws SQLException {
        List<Beans_categoria> lista = new ArrayList<>();
        Beans_producto b = new Beans_producto();
        Dao_producto c = new Dao_producto();
        
        c.producto_u_codigo_producto_stock(1, 20);
        
//        b.setCodigo_producto(1);
//        b.setUsbc(0);
//        b.setUsb(0);
//        b.setCodigo_categoria(1);
//        b.setEstado(0);
//        b.setStock(0);
//        b.setPrecio(12.4);
//        b.setInalambrico(1);
//        
//        c.producto_u_codigo_producto(b);
        
       
//        List<Integer> l = new ArrayList<>();
//        l = d.categoria_s_codigo_categoria("leche");
//        System.out.println(l.get(1));
//        System.out.println(l.get(0));
//        Dao_categoria c = new Dao_categoria();
//        lista = c.categoria_s_all();
//        System.out.println(lista.get(0).getNombre_categoria());

//        b.setArchivo("Archivo");
//        b.setCategoria("Nola");
//        b.setCodigo_categoria(2);
//        b.setCategoria("ola");
//        b.setEstado(0);
//        b.setUsb(0);
//        b.setUsbc(0);
//        b.setInalambrico(0);
//        b.setNombre_producto("prueba");
//        b.setFecha_produccion("prueba");
//        b.setCodigo_producto(4);
//        b.setPrecio(99.00);
//        Dao_producto d = new Dao_producto();
//        d.producto_d_eliminacion_logica(2);
//        lista = (List) d.producto_i(beans_p));
//        System.out.println(lista.get(0).getPrecio());
//        for (int i = 0; i < lista.size(); i++) {
//            System.out.println(lista.get(i).getNombre_producto());
//        }
    }
}
