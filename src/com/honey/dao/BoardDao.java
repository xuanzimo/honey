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
import com.honey.model.Board;


@Service @Transactional
public class BoardDao {
	@Resource SessionFactory factory;
	
	 /*���Board��Ϣ*/
    public void AddBoard(Board board) throws Exception {
    	Session s = factory.getCurrentSession();
    	s.save(board);
    }
    
    /*ɾ��Board��Ϣ*/
    public void DeleteBoard (Integer boardId) throws Exception {
        Session s = factory.getCurrentSession(); 
        Object board = s.load(Board.class, boardId);
        s.delete(board);
    }
    
    /*����Board��Ϣ*/
    public void UpdateBoard(Board board) throws Exception {
        Session s = factory.getCurrentSession();
        s.update(board);
    }
    
    /*��ѯ����Board��Ϣ*/
    public ArrayList<Board> QueryAllBoard() {
        Session s = factory.getCurrentSession();
        String hql = "From Board";
        Query q = s.createQuery(hql);
        List boardList = q.list();
        return (ArrayList<Board>) boardList;
    }

    /*��������ȡ����*/
    public Board GetBoardById(Integer boardid) {
        Session s = factory.getCurrentSession();
        Board board = (Board)s.get(Board.class, boardid);
        return board;
    }
    
    /*��ݲ�ѯ������ѯ���*/
    public ArrayList<Board> QueryBoardInfo(Customer customer) {
    	Session s = factory.getCurrentSession();
    	String hql = "From Board board where 1=1";
    	if(null != customer && customer.getCustomerid()!=0) 
    		hql = hql + " and board.customer.customerid like '%" + customer.getCustomerid() + "%'";
    	//if(null != honey && null!=honey.getHoneyname()) 
    		//hql = hql + " and board.honey.honeyname like '%" +honey.getHoneyname() + "%'";
    	Query q = s.createQuery(hql);
    	List boardList = q.list();
    	return (ArrayList<Board>) boardList;
    }

}
