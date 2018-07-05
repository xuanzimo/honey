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
import com.honey.model.Honey;
import com.honey.model.Order;


@Service @Transactional
public class OrderDao {
	@Resource SessionFactory factory;
	
	 /*娣诲姞Order淇℃伅*/
    public void AddOrder(Order order) throws Exception {
    	Session s = factory.getCurrentSession();
    	s.save(order);
    }
    
    /*鍒犻櫎Order淇℃伅*/
    public void DeleteOrder (Integer orderId) throws Exception {
        Session s = factory.getCurrentSession(); 
        Object order = s.load(Order.class, orderId);
        s.delete(order);
    }
    
    /*鏇存柊Order淇℃伅*/
    public void UpdateOrder(Order order) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(order);
    }
    
    /*鏌ヨ鎵�湁Order淇℃伅*/
    public ArrayList<Order> QueryAllOrder() {
        Session s = factory.getCurrentSession();
        String hql = "From Order";
        Query q = s.createQuery(hql);
        List orderList = q.list();
        return (ArrayList<Order>) orderList;
    }

    /*鏍规嵁涓婚敭鑾峰彇瀵硅薄*/
    public Order GetOrderById(Integer orderid) {
        Session s = factory.getCurrentSession();
        Order order = (Order)s.get(Order.class, orderid);
        return order;
    }
    
    /*鏍规嵁鏌ヨ鏉′欢鏌ヨ锛屼竴鑸潵璇达紝璁㈠崟鏌ヨ鏃讹紝浼氭牴鎹敤鎴稩D鏌ュ搴旂殑璁㈠崟锛屾垨鏍规嵁缇庨鐨勫悕绉版煡瀵瑰簲鐨勮鍗�*/
    public ArrayList<Order> QueryOrderInfo(Customer customer, Honey honey) {
    	Session s = factory.getCurrentSession();
    	String hql = "From Order order where 1=1";
    	if(null != customer && customer.getCustomerid()!=0) 
    		hql = hql + " and order.customer.customerid like '%" + customer.getCustomerid() + "%'";
    	if(null != honey && null!=honey.getHoneyname()) 
    		hql = hql + " and order.honey.honeyname like '%" + honey.getHoneyname() + "%'";
    	Query q = s.createQuery(hql);
    	List orderList = q.list();
    	return (ArrayList<Order>) orderList;
    }

}
