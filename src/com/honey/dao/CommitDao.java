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
import com.honey.model.Commit;


@Service @Transactional
public class CommitDao {
	@Resource SessionFactory factory;
	
	 /*���Commit��Ϣ*/
    public void AddCommit(Commit commit) throws Exception {
    	Session s = factory.getCurrentSession();
    	s.save(commit);
    }
    
    /*ɾ��Commit��Ϣ*/
    public void DeleteCommit (Integer commitId) throws Exception {
        Session s = factory.getCurrentSession(); 
        Object commit = s.load(Commit.class, commitId);
        s.delete(commit);
    }
    
    /*����Commit��Ϣ*/
    public void UpdateCommit(Commit commit) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(commit);
    }
    
    /*��ѯ����Commit��Ϣ*/
    public ArrayList<Commit> QueryAllCommit() {
        Session s = factory.getCurrentSession();
        String hql = "From Commit";
        Query q = s.createQuery(hql);
        List commitList = q.list();
        return (ArrayList<Commit>) commitList;
    }

    /*��������ȡ����*/
    public Commit GetCommitById(Integer commitid) {
        Session s = factory.getCurrentSession();
        Commit commit = (Commit)s.get(Commit.class, commitid);
        return commit;
    }
    
    /*��ݲ�ѯ������ѯ��һ����˵��������*/
    public ArrayList<Commit> QueryCommitInfo(Customer customer, Honey honey) {
    	Session s = factory.getCurrentSession();
    	String hql = "From Commit commit where 1=1";
    	if(null != customer && customer.getCustomerid()!=0) 
    		hql = hql + " and commit.customer.customerid like '%" + customer.getCustomerid() + "%'";
    	if(null != honey && null!=honey.getHoneyname()) 
    		hql = hql + " and commit.honey.honeyname like '%" +honey.getHoneyname() + "%'";
    	Query q = s.createQuery(hql);
    	List commitList = q.list();
    	return (ArrayList<Commit>) commitList;
    }

}
