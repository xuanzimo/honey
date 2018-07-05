package com.honey.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.honey.dao.HoneyDao;
import com.honey.model.*;
import com.opensymphony.xwork2.ActionSupport;

@Controller @Scope("prototype")
public class HoneyAction extends ActionSupport{
	
	 /*涓氬姟灞傚璞�*/
    @Resource HoneyDao honeyDao;
    
    public File getHoneyPhoto() {
		return honeyPhoto;
	}

	public void setHoneyPhoto(File honeyPhoto) {
		this.honeyPhoto = honeyPhoto;
	}

	public String getHoneyPhotoFileName() {
		return honeyPhotoFileName;
	}

	public void setHoneyPhotoFileName(String honeyPhotoFileName) {
		this.honeyPhotoFileName = honeyPhotoFileName;
	}

	public String getHoneyPhotoContentType() {
		return honeyPhotoContentType;
	}

	public void setHoneyPhotoContentType(String honeyPhotoContentType) {
		this.honeyPhotoContentType = honeyPhotoContentType;
	}

	private File honeyPhoto;
    private String honeyPhotoFileName;
    private String honeyPhotoContentType;
    private Honey honey;

	public Honey getHoney() {
		return honey;
	}

	public void setHoney(Honey honey) {
		this.honey = honey;
	}
	
	private List<Honey> honeyList;
	
	public List<Honey> getHoneyList() {
		return honeyList;
	}

	public void setHoneyList(List<Honey> honeyList) {
		this.honeyList = honeyList;
	}
	
	private String keyWords;
	
	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}
	
	private Customer customer;
	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	
	
	/*娣诲姞Honey*/
	public String addHoney() throws Exception{
		  System.out.println("sss");
		  
		String path=ServletActionContext.getServletContext().getRealPath("/images");
		String honeyPhotoFileName="";
		if(honeyPhoto!=null){
			InputStream is=new FileInputStream(honeyPhoto);
			String fileContentType=this.getHoneyPhotoContentType();
			System.out.println(fileContentType);
			if(fileContentType.equals("image/jpeg")||fileContentType.equals("image/pjpeg"))
				honeyPhotoFileName=UUID.randomUUID().toString()+ ".jpg";
			else if(fileContentType.equals("image/gif"))
				honeyPhotoFileName=UUID.randomUUID().toString()+ ".gif";
			else if(fileContentType.equals("image/png"))
				honeyPhotoFileName=UUID.randomUUID().toString()+".png";
			File file=new File(path,honeyPhotoFileName);
			OutputStream os=new FileOutputStream(file);
			byte[]b=new byte [1024];
			int bs=0;
			while((bs=is.read(b))>0){
				os.write(b,0,bs);
			}
			is.close();
			os.close();
			if(honeyPhoto!=null)
				honey.setFilepath("images/"+honeyPhotoFileName);
			else
				 honey.setFilepath("images/NoImage.jpg");
		}
		honeyDao.AddHoney(honey);
		return "message";
		
	}
	
	/*鏄剧ず鎵�湁Honey*/
    public String showHoney() {
        
        honeyList = honeyDao.QueryAllHoney();
        return "show_view";
    }

    /*鏄剧ず鏌愪竴Honey鐨勮缁嗕俊鎭�*/
    public String showDetail() {
    	honey = honeyDao.GetHoneyById(honey.getHoneyid());
        return "detail_view";
    }
    
    /*鏄剧ずhoney鐨勪慨鏀归」*/
    public String showEdit() throws Exception {
    	honey = honeyDao.GetHoneyById(honey.getHoneyid());
        return "edit_view";
    }

    /*缂栬緫honey*/
    public String editHoney() throws Exception {
        String path = ServletActionContext.getServletContext().getRealPath("/images"); 
          /*处理图片上传*/
        String honeyPhotoFileName = ""; 
     	 	if(honeyPhoto!= null) {
     	 		InputStream is = new FileInputStream(honeyPhoto);
     			String fileContentType = this.getHoneyPhotoContentType();
     			System.out.println(fileContentType);
     			if(fileContentType.equals("image/jpeg")  || fileContentType.equals("image/pjpeg"))
     				honeyPhotoFileName = UUID.randomUUID().toString() +  ".jpg";
     			else if(fileContentType.equals("image/gif"))
     				honeyPhotoFileName = UUID.randomUUID().toString() +  ".gif";
     			else if(fileContentType.equals("image/png"))
     				honeyPhotoFileName = UUID.randomUUID().toString() +  ".png";

     			File file = new File(path, honeyPhotoFileName);
     			OutputStream os = new FileOutputStream(file);
     			byte[] b = new byte[1024];
     			int bs = 0;
     			while ((bs = is.read(b)) > 0) {
     				os.write(b, 0, bs);
     			}
     			is.close();
     			os.close();
     	 	}
          if(honeyPhoto != null)
          	honey.setFilepath("images/" + honeyPhotoFileName);
          else
          	honey.setFilepath("images/NoImage.jpg");
          
      	honeyDao.UpdateHoney(honey);
          return "edit_message";
      }
      
    /*鍒犻櫎Honey*/
    public String deleteHoney() throws Exception {
    	honeyDao.DeleteHoney(honey.getHoneyid());
        return "delete_message";
    }
    
    /*鏌ヨHoney*/
    public String queryhoneys() throws Exception {
    	honeyList = honeyDao.QueryHoneyInfo(keyWords);
        return "show_view";
    }
    public String queryhoneys1() throws Exception {
    	honeyList = honeyDao.QueryAllHoney();
        return "show_view";
    }

}
