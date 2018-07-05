package com.honey.rate;

import javax.annotation.Resource;

import com.honey.dao.CustomerDao;
import com.honey.model.Customer;

public class cash {
	@Resource CustomerDao customerDao;
  private Customer customer;
  public cash(Customer customer){
	  this.customer=customer;
  }
 public ratefactory creatfactory(int n){
	
	ratefactory ra = null;
	 switch(n){
	 case 0://正常收费
		 ra=new rateNormal();
		 break;
	 case 1://VIp1收费
		 ra=new ratecash(0.8);break;
	 case 2://vip2收费
		 ra=new ratecash(0.7);break;
	 }
	return ra; 
 }
}
