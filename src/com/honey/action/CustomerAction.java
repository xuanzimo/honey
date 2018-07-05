package com.honey.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;  
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.honey.dao.CustomerDao;
import com.honey.model.Customer;
import com.opensymphony.xwork2.ActionSupport;

@Controller @Scope("prototype")
public class CustomerAction extends ActionSupport implements SessionAware{
	


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private String name;
	public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}



	/*涓氬姟灞傚璞�*/
    @Resource CustomerDao customerDao;
    
    private Customer customer;
    
    //杩欎袱涓垚鍛樺彉閲忔槸鐢ㄦ潵鍋氱櫥褰曟嫤鎴殑锛岃寰楁坊鍔爏etter鍜実etter
    
	private Map<String,Object> session;

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	
	
	private String errMessage;
	
	public String getErrMessage() {
		return errMessage;
	}

	public void setErrMessage(String errMessage) {
		this.errMessage = errMessage;
	}
	
	/*
	public String reg() throws Exception{
		customerDao.AddCustomer(customer);
		session.put("curCustomer", customer);
		return "show_view";
		
	}*/
	public String editCustomer()throws Exception{
		customerDao.UpdateCustomer(customer);
		return "edit_view";
	}
    //娉ㄥ唽锛屽苟鍦╯ession涓姞鍏ョ敤鎴峰悕
	public String reg() throws Exception{
		customerDao.AddCustomer(customer);
		session.put("customer", customer);
		return "show_view";

	}
    public String findByName() throws IOException{
    	HttpServletRequest request=ServletActionContext.getRequest();
    	HttpServletResponse response= ServletActionContext.getResponse();
    	ArrayList<Customer> existcustomer=customerDao.QueryCustomerInfo(name);
    	response.setContentType("text/html;charset=UTF-8");
    	if(existcustomer.size()!=0){
    		System.out.print("1");
    		 response.getWriter().println("<font color='red'>用户名已经存在</font>");
    	}
    	else{
    		System.out.print("2");
    		response.getWriter().println("<font color='green'>用户名可以使用</font>");
    	}
    	return NONE;
    }
	/* 楠岃瘉鐢ㄦ埛鐧诲綍 */
	/*public String login() {
		Customer db_customer = (Customer)customerDao.QueryCustomerInfo(customer.getName()).get(0);
		if(db_customer == null) { 
			
			this.errMessage = " 璐﹀彿涓嶅瓨鍦�";
			System.out.print(this.errMessage);
			return INPUT;
			
		} else if( !db_customer.getPassword().equals(customer.getPassword())) {
			
			this.errMessage = " 瀵嗙爜涓嶆纭� ";
			System.out.print(this.errMessage);
			return INPUT;
			
		}else{
			return "show_view";
			
		}	*/	

	
		/* 楠岃瘉鐢ㄦ埛鐧诲綍 */
		public String login() {
			
			ArrayList<Customer> listCustomer = customerDao.QueryCustomerInfo(customer.getName());
			if(listCustomer.size()==0) { 
				
				this.errMessage = "用户名为空";
				System.out.print(this.errMessage);
				return "input";
				
			} 
			else{
				
			    Customer db_customer = listCustomer.get(0);
				if(!db_customer.getPassword().equals(customer.getPassword())) {
				
					this.errMessage = "密码错误";
					System.out.print(this.errMessage);
					return "input";
				
			    }else{
				
					session.put("customer", db_customer);
					return "show_view";
			    }
			}
		}


}
