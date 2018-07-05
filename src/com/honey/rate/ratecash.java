package com.honey.rate;

public class ratecash extends ratefactory{
private double rate;
public ratecash(double rate){
	this.rate=rate;
}
  @Override
public double total(double money) {
	// TODO Auto-generated method stub
	return money*rate;
}
  
}
