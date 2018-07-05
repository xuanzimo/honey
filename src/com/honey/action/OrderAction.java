package com.honey.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.honey.dao.CustomerDao;
import com.honey.dao.HoneyDao;
import com.honey.dao.OrderDao;
import com.honey.model.*;
import com.honey.rate.cash;
import com.honey.rate.ratefactory;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller @Scope("prototype")
public class OrderAction extends ActionSupport{
	
	 /*涓氬姟灞傚璞�*/
    @Resource OrderDao orderDao;
    @Resource CustomerDao customerDao;
    @Resource HoneyDao honeyDao;
    
    private Order order;
    private List<Order> orderList;
    private Customer customer;
    private Honey honey;
    public double getZhekou() {
		return zhekou;
	}

	public void setZhekou(double zhekou) {
		this.zhekou = zhekou;
	}

	public double getNumber() {
		return Number;
	}

	public void setNumber(double number) {
		Number = number;
	}

	private double zhekou;
	private double Number;

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Honey getHoney() {
		return honey;
	}

	public void setHoney(Honey honey) {
		this.honey = honey;
	}
	private Map<String,Object> session=ActionContext.getContext().getSession();
	
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	/*娣诲姞Order*/
	public String addOrder() throws Exception{
		System.out.println("addOrder");
		System.out.println(customer.getName());
		customer = customerDao.QueryCustomerInfo(customer.getName()).get(0);
		cash cash=new cash(customer);
		 int n= customerDao.GetCustomerById(customer.getCustomerid()).getViplevel();
		 System.out.println(1);
		ratefactory ra=cash.creatfactory(n);
		Order ord =new Order();
		ord.setCustomer(customer);
		ord.setHoney(honey);
		ord.setHoneynum((int)Number);
	//	ord.setPrice(ra.total(honeyDao.GetHoneyById(honey.getHoneyid()).getUnitprice()));
		//ord.setGetscore(honeyDao.GetHoneyById(honey.getHoneyid()).getScore()*(int)Number);
		ord.setTotal(ra.total(honeyDao.GetHoneyById(honey.getHoneyid()).getUnitprice())*Number);
		orderDao.AddOrder(ord);
		System.out.println(2);
		customer.setScore(customerDao.GetCustomerById(customer.getCustomerid()).getScore()+honeyDao.GetHoneyById(honey.getHoneyid()).getScore()*(int)Number);
		System.out.println(3);
		if(customerDao.GetCustomerById(customer.getCustomerid()).getScore()>=10
				&&customerDao.GetCustomerById(customer.getCustomerid()).getScore()<50){
			System.out.println(4);
			 customer.setViplevel(1);
			 }
		if(customerDao.GetCustomerById(customer.getCustomerid()).getScore()>=50){
			System.out.println(5);
			 customer.setViplevel(2);}
		customerDao.UpdateCustomer(customer);
		//session.remove("customer");
		session.put("customer", customer);
		return "order_message";
		
	}
	
	/*鏄剧ず鎵�湁Order*/
    public String showOrder() {
    	
        //灏嗙郴缁熻瀹氫负鐢ㄦ埛鍚嶄笉閲嶅锛屽洜姝ゅ湪绯荤粺涓煡璇㈠埌绗竴涓鍚嶇О鐢ㄦ埛鍗冲彲
    	System.out.println(customer.getName());
        Customer cus= customerDao.QueryCustomerInfo(customer.getName()).get(0);
        //娉ㄦ剰涓嶉渶瑕乭oney鐨勬煡璇㈡潯浠舵椂锛屼笅闈㈣鍙ョ殑鍐欐硶锛岀洿鎺ュ皢honey鐨勬潯浠剁疆涓簄ull
        orderList = orderDao.QueryOrderInfo(cus,null);

        return "show_view";
    }

    /*鏄剧ず鏌愪竴Order鐨勮缁嗕俊鎭�*/
    public String showDetail() {
    	System.out.print(order.getOrderid());
    	order = orderDao.GetOrderById(order.getOrderid());
        return "detail_view";
    }
    
    /*鏄剧ずOrder鐨勪慨鏀归」*/
    /*public String showEdit() throws Exception {
    	order = orderDao.GetOrderById(order.getOrderid());
        return "edit_view";
    }*/

    /*缂栬緫Order*/
    /*public String editOrder() throws Exception {
    	orderDao.UpdateOrder(order);
        return "edit_message";
    }*/
    
    /*鍒犻櫎Order*/
    /*public String deleteOrder() throws Exception {
    	orderDao.DeleteOrder(honey.getHoneyid());
        return "delete_message";
    }*/
    
    /*鏌ヨOrder*/
    public String queryOrders() throws Exception {
    	orderList = orderDao.QueryOrderInfo(customer,honey);
        return "show_view";
    }


}
