package com.mycompany.mycart.helper;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    
    private static SessionFactory factory;

    public static SessionFactory getFactory() {
        if (factory == null) {
            try {
                // Create Configuration object
                Configuration configuration = new Configuration();

                // Load Hibernate configuration from hibernate.cfg.xml
                configuration.configure("hibernate.cfg.xml");

                // Build SessionFactory
                factory = configuration.buildSessionFactory();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return factory;
    }
}
