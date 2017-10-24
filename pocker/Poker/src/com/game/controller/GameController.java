package com.game.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;


import org.apache.log4j.Logger;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.game.domain.Game;
import com.game.domain.User;
import com.game.impl.dao.GameDaoImpl;
import com.game.impl.service.GameServiceImpl;


@Controller
@EnableWebMvc
public class GameController {
	
	private static final Logger logger = Logger.getLogger(GameController.class);

	@Autowired
	GameDaoImpl gameDao;
	
	@Autowired
	GameServiceImpl gameSrv;
	
	@RequestMapping(value="/")	
	   public String getSignUpPage(ModelMap map, 
			   HttpSession session)  {
	       return "SignUp";
	   }
	

	@RequestMapping(value="/Online-Games")	
	   public String getOnlineGames(ModelMap map, 
			   HttpSession session)  {
		
		List<Game> glist = gameDao.getGames();
		map.addAttribute("glist", glist);
		map.addAttribute("gname", glist.get(0).getGname());
		map.addAttribute("minUsers", glist.get(0).getMinUsers());
		map.addAttribute("maxUsers", glist.get(0).getMaxUsers());
		
	       return "OnlineGames";
	   }

	@ResponseBody
  	 @RequestMapping(value="/RegisterGame")	
	 public String getmappingdata(ModelMap map, 
				  @RequestParam("gname") String gname,
				  @RequestParam("gmin") Integer gmin,
				  @RequestParam("gmax") Integer gmax,
				  @RequestParam("gcards") Integer gcards,
			   HttpSession session)  {
  		 
  		 if(gmin == null) {
  			 gmin = 2;
  		 }
  		 
  		 if(gmax == null) {
  			 gmax = 5;
  		 }
  		 boolean ret = gameDao.updateGame(gname, gmin.intValue(), gmax.intValue(), gcards);
  		 if(!ret) {
  			 return "failure";
  		 }
  		 return "success";
     }
	
	@RequestMapping(value="/GameDetails")	
	   public String getGameDetails(ModelMap map, 
			   @RequestParam("gname") String gname,
			   HttpSession session)  {
		
		   Game game = gameDao.getGameDetails(gname);
		   map.addAttribute("minUsers", game.getMinUsers());
		   map.addAttribute("maxUsers", game.getMaxUsers());
	       return "OnlineGameBackend";
	   }
	

	@RequestMapping(value="/{gname}/Summary")	
	   public String updateUserPoints(ModelMap map, 
			   @PathVariable("gname") String gname,
			   @RequestParam("uname") String uname,
			   HttpSession session)  {
	
		   List<User> ulist = gameSrv.updateUserGamedetails(gname.replaceAll("-", " "), uname);
		   map.addAttribute("ulist", ulist);
		   map.addAttribute("gname", gname.replaceAll("-", " "));
		   map.addAttribute("uname", uname);
	       return "Summary";
	   }
	
	@RequestMapping(value="/{gname}/getPlayers")	
	   public String getPlayers(ModelMap map, 
			   @PathVariable("gname") String gname,
			   @RequestParam("pcount") Integer pcnt,
			   @RequestParam("player1") String player1,
			   @RequestParam("player2") String player2,
			   @RequestParam(value="player3", required=false) String player3,
			   @RequestParam(value="player4", required=false) String player4,
			   @RequestParam(value="player5", required=false) String player5,
			   @RequestParam(value="player6", required=false) String player6,
			   @RequestParam(value="player7", required=false) String player7,
			   @RequestParam(value="player8", required=false) String player8,
			   @RequestParam(value="player9", required=false) String player9,
			   @RequestParam(value="player10", required=false) String player10,
			   HttpSession session)  {
		
		   List<String> plist = new ArrayList<String>();
		   int noOfCards = gameDao.getGameDetails(gname.replaceAll("-", " ")).getNoOfCards();
		   
		   if (pcnt != null) {
			   
			   for(int i = 1; i <= pcnt.intValue(); i++) {
				   switch (i) {
				   case 1: plist.add(player1);break;
				   case 2: plist.add(player2);break;
				   case 3: plist.add(player3);break;
				   case 4: plist.add(player4);break;
				   case 5: plist.add(player5);break;
				   case 6: plist.add(player6);break;
				   case 7: plist.add(player7);break;
				   case 8: plist.add(player8);break;
				   case 9: plist.add(player9);break;
				   case 10: plist.add(player10);break;
				   }
			   }
		   }
		   HashMap<String, List<String>> playerMap = gameSrv.getPlayerCards(pcnt, noOfCards, plist);
		   map.addAttribute("plist", plist);
		   map.addAttribute("pcnt", pcnt);
		   map.addAttribute("gname", gname.replaceAll("-", " "));
		   map.addAttribute("gname1", gname);
		   map.addAttribute("playCards", playerMap);
		   map.addAttribute("winner", gameSrv.findWinner(pcnt, noOfCards, playerMap));
	       return "GamePlayers";
	   }
	
	
}
