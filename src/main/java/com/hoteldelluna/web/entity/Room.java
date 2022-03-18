package com.hoteldelluna.web.entity;

public class Room {
   private int r_no;
   private String r_branch;
   private int r_star;
   private String r_img;
   private String r_roomtype;
   private String r_bedtype;
   private int r_occupancy;
   private String r_price;
   
   public Room() {
	
   }
   
   public int getR_no() {
      return r_no;
   }
   public void setR_no(int r_no) {
      this.r_no = r_no;
   }
   public String getR_branch() {
      return r_branch;
   }
   public void setR_branch(String r_branch) {
      this.r_branch = r_branch;
   }
   public int getR_star() {
      return r_star;
   }
   public void setR_star(int r_star) {
      this.r_star = r_star;
   }
   public String getR_img() {
      return r_img;
   }
   public void setR_img(String r_img) {
      this.r_img = r_img;
   }
   public String getR_roomtype() {
      return r_roomtype;
   }
   public void setR_roomtype(String r_roomtype) {
      this.r_roomtype = r_roomtype;
   }
   public String getR_bedtype() {
      return r_bedtype;
   }
   public void setR_bedtype(String r_bedtype) {
      this.r_bedtype = r_bedtype;
   }
   public int getR_occupancy() {
      return r_occupancy;
   }
   public void setR_occupancy(int r_occupancy) {
      this.r_occupancy = r_occupancy;
   }
   public String getR_price() {
      return r_price;
   }
   public void setR_price(String r_price) {
      this.r_price = r_price;
   }
   
   @Override
   public String toString() {
      return "RoomTO [r_no=" + r_no + ", r_branch=" + r_branch + ", r_star=" + r_star + ", r_img=" + r_img
            + ", r_roomtype=" + r_roomtype + ", r_bedtype=" + r_bedtype + ", r_occupancy=" + r_occupancy
            + ", r_price=" + r_price + "]";
   }
}
