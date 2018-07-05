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
	private String filepath;
	private String introduce;
	private Integer score;
	private Set<Commit> commits = new HashSet<Commit>(0);
	private Set<Order> orders = new HashSet<Order>(0);
	private Set<Order> orders_1 = new HashSet<Order>(0);
	private Set<Commit> commits_1 = new HashSet<Commit>(0);

	// Constructors

	/** default constructor */
	public Honey() {
	}

	/** minimal constructor */
	public Honey(Integer score) {
		this.score = score;
	}

	/** full constructor */
	public Honey(String honeyname, Double unitprice, String filepath,
			String introduce, Integer score, Set<Commit> commits,
			Set<Order> orders, Set<Order> orders_1, Set<Commit> commits_1) {
		this.honeyname = honeyname;
		this.unitprice = unitprice;
		this.filepath = filepath;
		this.introduce = introduce;
		this.score = score;
		this.commits = commits;
		this.orders = orders;
		this.orders_1 = orders_1;
		this.commits_1 = commits_1;
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

	@Column(name = "filepath", length = 100)
	public String getFilepath() {
		return this.filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	@Column(name = "introduce", length = 20000)
	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	@Column(name = "score", nullable = false)
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "honey")
	public Set<Commit> getCommits() {
		return this.commits;
	}

	public void setCommits(Set<Commit> commits) {
		this.commits = commits;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "honey")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "honey")
	public Set<Order> getOrders_1() {
		return this.orders_1;
	}

	public void setOrders_1(Set<Order> orders_1) {
		this.orders_1 = orders_1;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "honey")
	public Set<Commit> getCommits_1() {
		return this.commits_1;
	}

	public void setCommits_1(Set<Commit> commits_1) {
		this.commits_1 = commits_1;
	}

}