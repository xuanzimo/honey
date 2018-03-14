package com.honey.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.honey.dao.HoneyDao;
import com.honey.model.*;
import com.opensymphony.xwork2.ActionSupport;

@Controller @Scope("prototype")
public class HoneyAction extends ActionSupport{
	
	 /*业务层对象*/
    @Resource HoneyDao honeyDao;
    
    
    private Honey honey;

	public Honey getHoney() {
		return honey;
	}

	public void setHoney(Honey honey) {
		this.honey = honey;
	}
	
	private List<Honey> honeyList;
	
	public List<Honey> getHoneyList() {
		return honeyList;
	}

	public void setHoneyList(List<Honey> honeyList) {
		this.honeyList = honeyList;
	}
	
	private String keyWords;
	
	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}
	
	private Customer customer;
	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	
	
	/*添加Honey*/
	public String addHoney() throws Exception{
		
		System.out.println(honey.getHoneyname());
		honeyDao.AddHoney(honey);
		return "message";
		
	}
	
	/*显示所有Honey*/
    public String showHoney() {
        
        honeyList = honeyDao.QueryAllHoney();
        return "show_view";
    }

    /*显示某一Honey的详细信息*/
    public String showDetail() {
    	honey = honeyDao.GetHoneyById(honey.getHoneyid());
        return "detail_view";
    }
    
    /*显示honey的修改项*/
    public String showEdit() throws Exception {
    	honey = honeyDao.GetHoneyById(honey.getHoneyid());
        return "edit_view";
    }

    /*编辑honey*/
    public String editHoney() throws Exception {
    	honeyDao.UpdateHoney(honey);
        return "edit_message";
    }
    
    /*删除Honey*/
    public String deleteHoney() throws Exception {
    	honeyDao.DeleteHoney(honey.getHoneyid());
        return "delete_message";
    }
    
    /*查询Honey*/
    public String queryhoneys() throws Exception {
    	honeyList = honeyDao.QueryHoneyInfo(keyWords);
        return "show_view";
    }




}
