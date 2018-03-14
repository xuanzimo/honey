package com.honey.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * Honey entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_honey", catalog = "honey")
public class Honey implements java.io.Serializable {

	// Fields

	private Integer honeyid;
	private String honeyname;
	private Double unitprice;
	private Set<Order> orders = new HashSet<Order>(0);

	// Constructors

	/** default constructor */
	public Honey() {
	}

	/** full constructor */
	public Honey(String honeyname, Double unitprice, Set<Order> orders) {
		this.honeyname = honeyname;
		this.unitprice = unitprice;
		this.orders = orders;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "honeyid", unique = true, nullable = false)
	public Integer getHoneyid() {
		return this.honeyid;
	}

	public void setHoneyid(Integer honeyid) {
		this.honeyid = honeyid;
	}

	@Column(name = "honeyname", length = 40)
	public String getHoneyname() {
		return this.honeyname;
	}

	public void setHoneyname(String honeyname) {
		this.honeyname = honeyname;
	}

	@Column(name = "unitprice", precision = 22, scale = 0)
	public Double getUnitprice() {
		return this.unitprice;
	}

	public void setUnitprice(Double unitprice) {
		this.unitprice = unitprice;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "honey")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

}