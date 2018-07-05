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
 * Customer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_customer", catalog = "honey")
public class Customer implements java.io.Serializable {

	// Fields

	private Integer customerid;
	private String name;
	private String address;
	private String password;
	private Integer score;
	private Integer viplevel;
	private Set<Commit> commits = new HashSet<Commit>(0);
	private Set<Board> boards = new HashSet<Board>(0);
	private Set<Board> boards_1 = new HashSet<Board>(0);
	private Set<Order> orders = new HashSet<Order>(0);
	private Set<Commit> commits_1 = new HashSet<Commit>(0);
	private Set<Order> orders_1 = new HashSet<Order>(0);

	// Constructors

	/** default constructor */
	public Customer() {
	}

	/** minimal constructor */
	public Customer(String name, String address, String password,
			Integer score, Integer viplevel) {
		this.name = name;
		this.address = address;
		this.password = password;
		this.score = score;
		this.viplevel = viplevel;
	}

	/** full constructor */
	public Customer(String name, String address, String password,
			Integer score, Integer viplevel, Set<Commit> commits,
			Set<Board> boards, Set<Board> boards_1, Set<Order> orders,
			Set<Commit> commits_1, Set<Order> orders_1) {
		this.name = name;
		this.address = address;
		this.password = password;
		this.score = score;
		this.viplevel = viplevel;
		this.commits = commits;
		this.boards = boards;
		this.boards_1 = boards_1;
		this.orders = orders;
		this.commits_1 = commits_1;
		this.orders_1 = orders_1;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "customerid", unique = true, nullable = false)
	public Integer getCustomerid() {
		return this.customerid;
	}

	public void setCustomerid(Integer customerid) {
		this.customerid = customerid;
	}

	@Column(name = "name", nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "address", nullable = false, length = 40)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "password", nullable = false, length = 16)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "score", nullable = false)
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Column(name = "VIPlevel", nullable = false)
	public Integer getViplevel() {
		return this.viplevel;
	}

	public void setViplevel(Integer viplevel) {
		this.viplevel = viplevel;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Commit> getCommits() {
		return this.commits;
	}

	public void setCommits(Set<Commit> commits) {
		this.commits = commits;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Board> getBoards() {
		return this.boards;
	}

	public void setBoards(Set<Board> boards) {
		this.boards = boards;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Board> getBoards_1() {
		return this.boards_1;
	}

	public void setBoards_1(Set<Board> boards_1) {
		this.boards_1 = boards_1;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Commit> getCommits_1() {
		return this.commits_1;
	}

	public void setCommits_1(Set<Commit> commits_1) {
		this.commits_1 = commits_1;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "customer")
	public Set<Order> getOrders_1() {
		return this.orders_1;
	}

	public void setOrders_1(Set<Order> orders_1) {
		this.orders_1 = orders_1;
	}

}