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


@Service @Transactional
public class HoneyDao {
	@Resource SessionFactory factory;
	
	 /*添加Honey信息*/
    public void AddHoney(Honey honey) throws Exception {
    	Session s = factory.getCurrentSession();
    	s.save(honey);
    }
    
    /*删除Honey信息*/
    public void DeleteHoney (Integer honeyId) throws Exception {
        Session s = factory.getCurrentSession(); 
        Object honey = s.load(Honey.class, honeyId);
        s.delete(honey);
    }
    
    /*更新Honey信息*/
    public void UpdateHoney(Honey honey) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(honey);
    }
    
    /*查询所有Honey信息*/
    public ArrayList<Honey> QueryAllHoney() {
        Session s = factory.getCurrentSession();
        String hql = "From Honey";
        Query q = s.createQuery(hql);
        List honeyList = q.list();
        return (ArrayList<Honey>) honeyList;
    }

    /*根据主键获取对象*/
    public Honey GetHoneyById(Integer honeyid) {
        Session s = factory.getCurrentSession();
        Honey honey = (Honey)s.get(Honey.class, honeyid);
        return honey;
    }
    
    /*根据查询条件查询*/
    public ArrayList<Honey> QueryHoneyInfo(String honeyname) { 
    	Session s = factory.getCurrentSession();
    	String hql = "From Honey honey where 1=1";
    	if(!honeyname.equals("")) hql = hql + " and honey.honeyname like '%" + honeyname + "%'";
    	Query q = s.createQuery(hql);
    	List honeyList = q.list();
    	return (ArrayList<Honey>) honeyList;
    }

}
