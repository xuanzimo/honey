package com.intermediary.model;



/**
 * Customeroder entity. @author MyEclipse Persistence Tools
 */

public class Customeroder  implements java.io.Serializable {


    // Fields    

     private Integer orderid;
     private Customer customer;
     private Message message;
     private Integer jobid;
     private Integer id;
     private String time;
     private String resume;
     private Integer fid;
     private String retime;
     private Integer percentage;


    // Constructors

    /** default constructor */
    public Customeroder() {
    }

    
    /** full constructor */
    public Customeroder(Customer customer, Message message, Integer jobid, Integer id, String time, String resume, Integer fid, String retime, Integer percentage) {
        this.customer = customer;
        this.message = message;
        this.jobid = jobid;
        this.id = id;
        this.time = time;
        this.resume = resume;
        this.fid = fid;
        this.retime = retime;
        this.percentage = percentage;
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

    public Message getMessage() {
        return this.message;
    }
    
    public void setMessage(Message message) {
        this.message = message;
    }

    public Integer getJobid() {
        return this.jobid;
    }
    
    public void setJobid(Integer jobid) {
        this.jobid = jobid;
    }

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getTime() {
        return this.time;
    }
    
    public void setTime(String time) {
        this.time = time;
    }

    public String getResume() {
        return this.resume;
    }
    
    public void setResume(String resume) {
        this.resume = resume;
    }

    public Integer getFid() {
        return this.fid;
    }
    
    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getRetime() {
        return this.retime;
    }
    
    public void setRetime(String retime) {
        this.retime = retime;
    }

    public Integer getPercentage() {
        return this.percentage;
    }
    
    public void setPercentage(Integer percentage) {
        this.percentage = percentage;
    }
   








}