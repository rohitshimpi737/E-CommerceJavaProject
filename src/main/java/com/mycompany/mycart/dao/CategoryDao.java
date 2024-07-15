package com.mycompany.mycart.dao;

import com.mycompany.mycart.entites.Category;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDao {

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    public int saveCategory(Category category) {

        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId = (int) session.save(category);
        tx.commit();
        session.close();
        return catId;

    }
    public List<Category> getCategories() 
    {
        Session session = this.factory.openSession();
        Query query=session.createQuery("from Category");
        List<Category> list = query.list();
        return list;

    }
     
    public Category getCategoryById(int cId){
        Category cat=null;
        try{
            
            Session session = this.factory.openSession();
           cat=session.get(Category.class, cId);
           session.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return cat;
        
    }
}
