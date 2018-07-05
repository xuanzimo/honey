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
 * Commit entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_commit", catalog = "honey")
public class Commit implements java.io.Serializable {

	// Fields

	private Integer commitid;
	private Customer customer;
	private Honey honey;
	private String commit;

	// Constructors

	/** default constructor */
	public Commit() {
	}

	/** full constructor */
	public Commit(Customer customer, Honey honey, String commit) {
		this.customer = customer;
		this.honey = honey;
		this.commit = commit;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "commitid", unique = true, nullable = false)
	public Integer getCommitid() {
		return this.commitid;
	}

	public void setCommitid(Integer commitid) {
		this.commitid = commitid;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer", nullable = false)
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

	@Column(name = "commit", nullable = false, length = 20000)
	public String getCommit() {
		return this.commit;
	}

	public void setCommit(String commit) {
		this.commit = commit;
	}

}