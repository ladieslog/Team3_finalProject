package com.care.dare.join.controller ;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDTO {
   private String id;
   private String pwd;
   private String nickname;
   private String email;
   private String addr;

   public String getaddr() {
      return addr;
   }

   public void setaddr(String addr) {
      this.addr = addr;
   }

   public String getid() {
      return id;
   }

   public void setid(String id) {
      this.id = id;
   }

   public String getpwd() {
      return pwd;
   }

   public void setpwd(String pwd) {
      this.pwd = pwd;
   }

   public String getnickname() {
      return nickname;
   }

   public void setnickname(String nickname) {
      this.nickname = nickname;
   }

   public String getemail() {
      return email;
   }

   public void setemail(String email) {
      this.email = email;
   }

}


