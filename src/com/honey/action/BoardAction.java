package com.honey.action;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.honey.dao.CustomerDao;
import com.honey.dao.HoneyDao;
import com.honey.dao.BoardDao;
import com.honey.model.*;
import com.opensymphony.xwork2.ActionSupport;

@Controller @Scope("prototype")
public class BoardAction extends ActionSupport{
	
	 /*涓氬姟灞傚璞*/
    @Resource BoardDao boardDao;
    @Resource CustomerDao customerDao;
    @Resource HoneyDao honeyDao;
    
    private Board board;
    private List<Board> boardList;
    private Customer customer;
    private Honey honey;
    public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	private String message;
    public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	private String email;
    
	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}
	
	public List<Board> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<Board> boardList) {
		this.boardList = boardList;
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
	private int niming;
	
	public int getNiming() {
		return niming;
	}

	public void setNiming(int niming) {
		this.niming = niming;
	}

	/*娣诲姞Board*/
	public String addBoard() throws Exception{
		
		customer = customerDao.QueryCustomerInfo(customer.getName()).get(0);
		Board ord =new Board();
		ord.setCustomer(customer);
		ord.setEmail(email);
		ord.setMessage(message);
		ord.setNiming(niming);
		//ord.setHoney(honey);
		//鍥犱负鏄�鏉ヤ竴浠解�锛屾墍浠ョ疆涓�
		//ord.setHoneynum(1);
		//ord.setTotal(honeyDao.getHoneyById(honey.getHoneyid()).getUnitprice()*1);
		boardDao.AddBoard(ord);
		return "board_message";
		
	}
	
 
	/*鏄剧ず鎵�湁Board*/
    public String showBoard() {
    	
        //灏嗙郴缁熻瀹氫负鐢ㄦ埛鍚嶄笉閲嶅锛屽洜姝ゅ湪绯荤粺涓煡璇㈠埌绗竴涓鍚嶇О鐢ㄦ埛鍗冲彲
    	System.out.println(customer.getName());
        Customer cus= customerDao.QueryCustomerInfo(customer.getName()).get(0);
        //娉ㄦ剰涓嶉渶瑕乫ood鐨勬煡璇㈡潯浠舵椂锛屼笅闈㈣鍙ョ殑鍐欐硶锛岀洿鎺ュ皢food鐨勬潯浠剁疆涓簄ull
        boardList = boardDao.QueryBoardInfo(cus);

        return "board_main";
    }
    public String showBoardd() {
    	
        //灏嗙郴缁熻瀹氫负鐢ㄦ埛鍚嶄笉閲嶅锛屽洜姝ゅ湪绯荤粺涓煡璇㈠埌绗竴涓鍚嶇О鐢ㄦ埛鍗冲彲
        //娉ㄦ剰涓嶉渶瑕乫ood鐨勬煡璇㈡潯浠舵椂锛屼笅闈㈣鍙ョ殑鍐欐硶锛岀洿鎺ュ皢food鐨勬潯浠剁疆涓簄ull
        boardList = boardDao.QueryAllBoard();

        return "board_main";
    }
    /*鏄剧ず鏌愪竴Board鐨勮缁嗕俊鎭�*/
    public String showDetail() {
    	System.out.print(board.getBoardid());
    	board = boardDao.GetBoardById(board.getBoardid());
        return "detail_view";
    }
    public String showaddB(){
    	customer=customerDao.GetCustomerById(customer.getCustomerid());
    	return "liuyan";
    }
    /*鏄剧ずBoard鐨勪慨鏀归」*/
    /*public String showEdit() throws Exception {
    	board = boardDao.GetBoardById(board.getBoardid());
        return "edit_view";
    }*/

    /*缂栬緫Board*/
    /*public String editBoard() throws Exception {
    	boardDao.UpdateBoard(board);
        return "edit_message";
    }*/
    
    /*鍒犻櫎Board*/
    /*public String deleteBoard() throws Exception {
    	boardDao.DeleteBoard(food.getFoodid());
        return "delete_message";
    }*/
    
    /*鏌ヨBoard*/
    public String queryBoards() throws Exception {
    	boardList = boardDao.QueryBoardInfo(customer);
        return "show_view";
    }
}