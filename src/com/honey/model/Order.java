package com.honey.model;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields

	private Integer orderid;
	private Customer customer;
	private Honey honey;
	private Integer honeynum;
	private Double total;

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(Honey honey) {
		this.honey = honey;
	}

	/** full constructor */
	public Order(Customer customer, Honey honey, Integer honeynum, Double total) {
		this.customer = customer;
		this.honey = honey;
		this.honeynum = honeynum;
		this.total = total;
	}

	// Property accessors

	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Honey getHoney() {
		return this.honey;
	}

	public void setHoney(Honey honey) {
		this.honey = honey;
	}

	public Integer getHoneynum() {
		return this.honeynum;
	}

	public void setHoneynum(Integer honeynum) {
		this.honeynum = honeynum;
	}

	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

}