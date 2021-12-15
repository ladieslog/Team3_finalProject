package com.care.dare.join.controller ;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class MemberDTO {
   private String mem_id;
   private String mem_pw;
   private String mem_name;
   private String mem_email;
   private String mem_address;
   private String mem_detailaddress;


   // private String mem_emailchk;
   // private String mem_address;

   public String getMem_address() {
      return mem_address;
   }

   public void setMem_address(String mem_address) {
      this.mem_address = mem_address;
   }

   public String getMem_detailaddress() {
      return mem_detailaddress;
   }

   public void setMem_detailaddress(String mem_detailaddress) {
      this.mem_detailaddress = mem_detailaddress;
   }

   public String getMem_id() {
      return mem_id;
   }

   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }

   public String getMem_pw() {
      return mem_pw;
   }

   public void setMem_pw(String mem_pw) {
      this.mem_pw = mem_pw;
   }

   public String getMem_name() {
      return mem_name;
   }

   public void setMem_name(String mem_name) {
      this.mem_name = mem_name;
   }

   public String getMem_email() {
      return mem_email;
   }

   public void setMem_email(String mem_email) {
      this.mem_email = mem_email;
   }

}


