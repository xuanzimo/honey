package com.intermediary.model;

import java.util.HashSet;
import java.util.Set;


/**
 * Message entity. @author MyEclipse Persistence Tools
 */

public class Message  implements java.io.Serializable {


    // Fields    

     private Integer jobid;
     private String companyname;
     private String companyaddress;
     private Integer salary;
     private Integer available;
     private String companycontact;
     private String companyphoto;
     private String jobname;
     private String demand;
     private Integer fid;
     private Set customeroders = new HashSet(0);


    // Constructors

    /** default constructor */
    public Message() {
    }

    
    /** full constructor */
    public Message(String companyname, String companyaddress, Integer salary, Integer available, String companycontact, String companyphoto, String jobname, String demand, Integer fid, Set customeroders) {
        this.companyname = companyname;
        this.companyaddress = companyaddress;
        this.salary = salary;
        this.available = available;
        this.companycontact = companycontact;
        this.companyphoto = companyphoto;
        this.jobname = jobname;
        this.demand = demand;
        this.fid = fid;
        this.customeroders = customeroders;
    }

   
    // Property accessors

    public Integer getJobid() {
        return this.jobid;
    }
    
    public void setJobid(Integer jobid) {
        this.jobid = jobid;
    }

    public String getCompanyname() {
        return this.companyname;
    }
    
    public void setCompanyname(String companyname) {
        this.companyname = companyname;
    }

    public String getCompanyaddress() {
        return this.companyaddress;
    }
    
    public void setCompanyaddress(String companyaddress) {
        this.companyaddress = companyaddress;
    }

    public Integer getSalary() {
        return this.salary;
    }
    
    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public Integer getAvailable() {
        return this.available;
    }
    
    public void setAvailable(Integer available) {
        this.available = available;
    }

    public String getCompanycontact() {
        return this.companycontact;
    }
    
    public void setCompanycontact(String companycontact) {
        this.companycontact = companycontact;
    }

    public String getCompanyphoto() {
        return this.companyphoto;
    }
    
    public void setCompanyphoto(String companyphoto) {
        this.companyphoto = companyphoto;
    }

    public String getJobname() {
        return this.jobname;
    }
    
    public void setJobname(String jobname) {
        this.jobname = jobname;
    }

    public String getDemand() {
        return this.demand;
    }
    
    public void setDemand(String demand) {
        this.demand = demand;
    }

    public Integer getFid() {
        return this.fid;
    }
    
    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Set getCustomeroders() {
        return this.customeroders;
    }
    
    public void setCustomeroders(Set customeroders) {
        this.customeroders = customeroders;
    }
   








}