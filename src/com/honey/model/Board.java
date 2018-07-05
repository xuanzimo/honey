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
 * Board entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_board", catalog = "honey")
public class Board implements java.io.Serializable {

	// Fields

	private Integer boardid;
	private Customer customer;
	private Integer niming;
	private String message;
	private String email;

	// Constructors

	/** default constructor */
	public Board() {
	}

	/** full constructor */
	public Board(Customer customer, Integer niming, String message, String email) {
		this.customer = customer;
		this.niming = niming;
		this.message = message;
		this.email = email;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "boardid", unique = true, nullable = false)
	public Integer getBoardid() {
		return this.boardid;
	}

	public void setBoardid(Integer boardid) {
		this.boardid = boardid;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer", nullable = false)
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Column(name = "niming", nullable = false)
	public Integer getNiming() {
		return this.niming;
	}

	public void setNiming(Integer niming) {
		this.niming = niming;
	}

	@Column(name = "message", nullable = false, length = 20000)
	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Column(name = "email", nullable = false, length = 20)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}