package com.honey.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_order", catalog = "honey")
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
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "orderid", unique = true, nullable = false)
	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer")
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "honey", nullable = false)
	public Honey getHoney() {
		return this.honey;
	}

	public void setHoney(Honey honey) {
		this.honey = honey;
	}

	@Column(name = "honeynum")
	public Integer getHoneynum() {
		return this.honeynum;
	}

	public void setHoneynum(Integer honeynum) {
		this.honeynum = honeynum;
	}

	@Column(name = "total", precision = 22, scale = 0)
	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

}