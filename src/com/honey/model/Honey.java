package com.honey.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Honey entity. @author MyEclipse Persistence Tools
 */

public class Honey implements java.io.Serializable {

	// Fields

	private Integer honeyid;
	private String honeyname;
	private Double unitprice;
	private Set orders = new HashSet(0);

	// Constructors

	/** default constructor */
	public Honey() {
	}

	/** full constructor */
	public Honey(String honeyname, Double unitprice, Set orders) {
		this.honeyname = honeyname;
		this.unitprice = unitprice;
		this.orders = orders;
	}

	// Property accessors

	public Integer getHoneyid() {
		return this.honeyid;
	}

	public void setHoneyid(Integer honeyid) {
		this.honeyid = honeyid;
	}

	public String getHoneyname() {
		return this.honeyname;
	}

	public void setHoneyname(String honeyname) {
		this.honeyname = honeyname;
	}

	public Double getUnitprice() {
		return this.unitprice;
	}

	public void setUnitprice(Double unitprice) {
		this.unitprice = unitprice;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

}