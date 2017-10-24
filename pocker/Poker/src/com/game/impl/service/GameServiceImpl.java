package com.game.impl.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.game.constants.GameConstant;
import com.game.domain.User;
import com.game.impl.dao.GameDaoImpl;


@Repository
public class GameServiceImpl {

	private static final Logger logger = Logger.getLogger(GameServiceImpl.class);

	@Autowired
	GameDaoImpl gameDao;
	
	
	public List<User> getUserDetails(String gname) {
		return gameDao.getUserGameDetails(gname);
	}
	
	public List<User> updateUserGamedetails(String gname, String uname) {
		// update user record for respective game
		gameDao.updateUserGamedetails(uname, gname);
		List<User> ulist = gameDao.getUsersByGame(gname);
		return ulist;
	}
	
	
	public HashMap<String, List<String>> getPlayerCards(int nPlayers, int nCards, List<String> playerList) {
		HashMap<String, List<String>> playerMap = new HashMap<String, List<String>>();
		for(int i = 0; i < nPlayers; i++) {
			playerMap.put(playerList.get(i), getRandomCards(nCards));
		}
	    return playerMap;	
	}
	public String findWinner(int nPlayers, int nCards, HashMap<String, List<String>> playerMap) {
		int cardSum = 0, maxSum = 0;
		String maxDupPlayer = null;

		List<Integer> numList = new ArrayList<Integer>();
		for( Map.Entry<String, List<String>> player : playerMap.entrySet()) {
			numList = new ArrayList<Integer>();
			for(int i = 0; i < player.getValue().size(); i++) {
				numList.add(getIntValue(player.getValue().get(i)));
			}
			cardSum = getSumOfCards(numList);
			if(maxSum < cardSum ) {
				maxSum = cardSum;
				maxDupPlayer = player.getKey();
			}
		}
		
			
		return maxDupPlayer;
	}
	
	private List<String> getRandomCards(int noOfCards) {
		List<String> cardsList = new ArrayList<String>();
		List<String> alphaList = getAlphaList();
		List<String> numList = getNumberList();
		
		for(int i = 0; i < noOfCards; i++) {
			String alpha = getRandomCard(alphaList);
			String num = getRandomCard(numList);
			cardsList.add(alpha + num + GameConstant.BMP);
		}
		return cardsList;
	}
	
	
	private List<String> getNumberList() {
		List<String> numList = new ArrayList<String>();
		numList.add("1");
		numList.add("2");
		numList.add("3");
		numList.add("4");
		numList.add("5");
		numList.add("6");
		numList.add("7");
		numList.add("8");
		numList.add("9");
		numList.add("10");
		numList.add("11");
		numList.add("12");

		return numList;
	}
	
	private List<String> getAlphaList() {
		List<String> alphaList  = new ArrayList<String>();
		alphaList.add("c");
		alphaList.add("d");
		alphaList.add("h");
		alphaList.add("s");
		return alphaList;
	}
	
	private String getRandomCard(List<String> cardList) {
		Random r = new Random();
		String idx = cardList.get(r.nextInt(cardList.size()));
		return idx;
	}
	
	private int getIntValue(String str) {
		int ret = 0 ;
		Pattern p = Pattern.compile("(\\d+)");
		Matcher m = p.matcher(str);
		while(m.find())
		{
		    ret =  Integer.valueOf(m.group(1));
		}
		
		return ret;
	}
	
	private int getSumOfCards(List<Integer> nList) {
		int sum = 0;
		for (Integer i : nList) {
			sum += i;		
		}
		
		return sum;
	}
	
}
