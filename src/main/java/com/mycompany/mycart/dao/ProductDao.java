package com.mycompany.mycart.dao;

import com.mycompany.mycart.entites.Product;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(product);

            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = true;
        }
        return f;
    }

//    gett all products
    public List<Product> getAllProducts() {
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product");
        List<Product> list = query.list();
        return list;

    }

}
