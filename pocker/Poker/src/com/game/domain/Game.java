package com.game.domain;

public class Game {
   private int gid;
   private String gname;
   private int minUsers;
   private int maxUsers;
   private int noOfcards;
   
   
public int getNoOfCards() {
	return noOfcards;
}
public void setNoOfCards(int noOfCards) {
	this.noOfcards = noOfCards;
}
public int getGid() {
	return gid;
}
public void setGid(int gid) {
	this.gid = gid;
}
public String getGname() {
	return gname;
}
public void setGname(String gname) {
	this.gname = gname;
}
public int getMinUsers() {
	return minUsers;
}
public void setMinUsers(int minUsers) {
	this.minUsers = minUsers;
}
public int getMaxUsers() {
	return maxUsers;
}
public void setMaxUsers(int maxUsers) {
	this.maxUsers = maxUsers;
}
   
   

}
