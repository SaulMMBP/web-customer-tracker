package com.saul.springdemo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saul.springdemo.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Customer> getCustomers() {

        Session currentSession = sessionFactory.getCurrentSession();

        Query<Customer> query = currentSession.createQuery("from Customer order by lastName", Customer.class);

        List<Customer> customers = query.getResultList();

        return customers;
    }

    @Override
    public void saveCustomer(Customer theCustomer) {

        Session currentSession = sessionFactory.getCurrentSession();

        currentSession.saveOrUpdate(theCustomer);
    }

    @Override
    public Customer getCustomer(int theId) {
        
        Session currentSession = sessionFactory.getCurrentSession();
        
        Customer theCustomer = currentSession.get(Customer.class, theId);
        
        
        return theCustomer;
    }

    @Override
    public void deleteCustomer(int theId) {
        
        Session currentSession = sessionFactory.getCurrentSession();
        
        Query<?> query = currentSession.createQuery("delete from Customer where id=:customerId");
        query.setParameter("customerId", theId);
        
        query.executeUpdate();
        
    }

    @Override
    public List<Customer> searchCustomers(String search) {
        
        Session currentSession = sessionFactory.getCurrentSession();

        Query<Customer> query = null;
        
        if(search != null && search.trim().length() > 0) {
            
            query = currentSession.createQuery("from Customer where lower(first_name) like :theName or lower(last_name) like :theName", Customer.class);
            
            query.setParameter("theName", "%" + search.toLowerCase() + "%");
            
        } else {
            
            query = currentSession.createQuery("from Customer order by lastName", Customer.class);
            
        }

        List<Customer> customers = query.getResultList();
        
        return customers;
    }

}
