package com.honey.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.honey.model.Customer;


@Service @Transactional
public class CustomerDao {
	@Resource SessionFactory factory;
	
	 /*濞ｈ濮濩ustomer娣団剝浼�*/
    public void AddCustomer(Customer customer) throws Exception {
    	Session s = factory.getCurrentSession();
    	s.save(customer);
    }
    
    /*閸掔娀娅嶤ustomer娣団剝浼�*/
    public void DeleteCustomer (Integer customerId) throws Exception {
        Session s = factory.getCurrentSession(); 
        Object customer = s.load(Customer.class, customerId);
        s.delete(customer);
    }
    
    /*閺囧瓨鏌奀ustomer娣団剝浼�*/
    public void UpdateCustomer(Customer customer) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(customer);
    }
    /*閺屻儴顕楅幍锟芥箒Customer娣団剝浼�*/
    public ArrayList<Customer> QueryAllCustomer() {
        Session s = factory.getCurrentSession();
        String hql = "From Customer";
        Query q = s.createQuery(hql);
        List customerList = q.list();
        return (ArrayList<Customer>) customerList;
    }

    /*閺嶈宓佹稉濠氭暛閼惧嘲褰囩�纭呰杽*/
    public Customer GetCustomerById(Integer customerid) {
        Session s = factory.getCurrentSession();
        Customer customer = (Customer)s.get(Customer.class, customerid);
        return customer;
    }
    
    /*閺嶈宓侀弻銉嚄閺夆�娆㈤弻銉嚄*/
    public ArrayList<Customer> QueryCustomerInfo(String name) {
    	
    	Session s = factory.getCurrentSession();
    	List customerList;
    	String hql = "From Customer customer where 1=1";
    	if(!name.equals("")){ 
    		
    		hql = hql + " and customer.name like '%" + name + "%'";
	    	Query q = s.createQuery(hql);
	    	customerList = q.list();
	    	
    	}else{
    		
    	    customerList =null;	
    	
    	}
    	return (ArrayList<Customer>) customerList;
    }

}

