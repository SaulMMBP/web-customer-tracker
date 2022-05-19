package com.saul.springdemo.dao;

import java.util.List;

import com.saul.springdemo.entity.Customer;

public interface CustomerDAO {

    public List<Customer> getCustomers(int sortField);

    public void saveCustomer(Customer theCustomer);

    public Customer getCustomer(int theId);

    public void deleteCustomer(int theId);

    public List<Customer> searchCustomers(String search);
}
