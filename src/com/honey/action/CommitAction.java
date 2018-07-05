package com.honey.action;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.honey.dao.CustomerDao;
import com.honey.dao.HoneyDao;
import com.honey.dao.CommitDao;
import com.honey.model.*;
import com.opensymphony.xwork2.ActionSupport;

@Controller @Scope("prototype")
public class CommitAction extends ActionSupport{
	
	 /*涓氬姟灞傚璞*/
    @Resource CommitDao commitDao;
    @Resource CustomerDao customerDao;
    @Resource HoneyDao honeyDao;
    
    private Commit commit;
    private List<Commit> commitlist;
    private Customer customer;
    private Honey honey;
    private String massage;
	public String getMassage() {
		return massage;
	}

	public void setMassage(String massage) {
		this.massage = massage;
	}

	public Commit getCommit() {
		return commit;
	}

	public void setCommit(Commit commit) {
		this.commit = commit;
	}
	
	public List<Commit> getCommitlist() {
		return commitlist;
	}

	public void setCommitlist(List<Commit> commitlist) {
		this.commitlist = commitlist;
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
	
	/*娣诲姞Commit*/
	public String addCommit() throws Exception{
		customer = customerDao.QueryCustomerInfo(customer.getName()).get(0);
		Commit ord =new Commit();
		ord.setCustomer(customer);
		ord.setHoney(honey);
		//鍥犱负鏄�鏉ヤ竴浠解�锛屾墍浠ョ疆涓�
		//ord.setHoneynum(1);
		//ord.setTotal(honeyDao.getHoneyById(honey.getHoneyid()).getUnitprice()*1);
		ord.setCommit(massage);
		System.out.print(massage);
		commitDao.AddCommit(ord);
		return "commit_message";
		
	}
	
 
	/*鏄剧ず鎵�湁Commit*/
    public String showCommit() {
    	
        //灏嗙郴缁熻瀹氫负鐢ㄦ埛鍚嶄笉閲嶅锛屽洜姝ゅ湪绯荤粺涓煡璇㈠埌绗竴涓鍚嶇О鐢ㄦ埛鍗冲彲
    	System.out.println(customer.getName());
        Customer cus= customerDao.QueryCustomerInfo(customer.getName()).get(0);
        //娉ㄦ剰涓嶉渶瑕乫ood鐨勬煡璇㈡潯浠舵椂锛屼笅闈㈣鍙ョ殑鍐欐硶锛岀洿鎺ュ皢food鐨勬潯浠剁疆涓簄ull
        commitlist = commitDao.QueryCommitInfo(cus,null);
        return "show_view";
    }
    public String showaddC(){
    	honey=honeyDao.GetHoneyById(honey.getHoneyid());
    	return "commit";
    }
    public String showCommitt(){
    	Honey hon=honeyDao.GetHoneyById(honey.getHoneyid());
    	commitlist=commitDao.QueryCommitInfo(null, hon);
    	return "show_view";
    }
    /*鏄剧ず鏌愪竴Commit鐨勮缁嗕俊鎭�/
    public String showDetail() {
    	System.out.print(commit.getCommitid());
    	commit = commitDao.GetCommitById(commit.getCommitid());
        return "detail_view";
    }
    
    /*鏄剧ずCommit鐨勪慨鏀归」*/
    /*public String showEdit() throws Exception {
    	commit = commitDao.GetCommitById(commit.getCommitid());
        return "edit_view";
    }*/

    /*缂栬緫Commit*/
    /*public String editCommit() throws Exception {
    	commitDao.UpdateCommit(commit);
        return "edit_message";
    }*/
    
    /*鍒犻櫎Commit*/
    /*public String deleteCommit() throws Exception {
    	commitDao.DeleteCommit(food.getFoodid());
        return "delete_message";
    }*/
    
    /*鏌ヨCommit*/
    public String queryCommits() throws Exception {
    	commitlist = commitDao.QueryCommitInfo(customer,honey);
        return "show_view";
    }
}