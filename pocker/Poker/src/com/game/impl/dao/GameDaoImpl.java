package com.game.impl.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.MongoDbFactory;
import org.springframework.stereotype.Repository;

import com.game.domain.Game;
import com.game.domain.User;
import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;

@Repository
public class GameDaoImpl {
	private static final Logger logger = LoggerFactory.getLogger(GameDaoImpl.class);
	
	@Autowired
	MongoDbFactory mongoConn;
	
	@Autowired
	Gson gson;
	
	public User getUser(String uname, int gid) {
		User user = null;
		DBCursor docs = null;		
		try {
//			Mongo mongo = new Mongo("localhost", 27017);
//			DB db1 = mongo.getDB("game");
			DB db1 = mongoConn.getDb();
			
			
			DBObject query = new BasicDBObject();
			query.put("uname", uname);
			query.put("gid", gid);

			docs = db1.getCollection("users").find(query);
			
			for(DBObject d: docs) {
				user = new User();
				user = gson.fromJson(d.toString(), User.class);
			}
	
		} catch(Exception e) {
			logger.error("exception ocuured while retreiving user details . user - " + uname, e);
		}
		finally{
			docs.close();
		}
		
		return user;
	}
	
	public List<Game> getGames(){
		List<Game> gList = new ArrayList<Game>();
		DBCursor docs = null;	
		try {
			DB db = mongoConn.getDb();
			
			docs = db.getCollection("game").find();
			
			for(DBObject d: docs) {
				Game game = new Game();
				game = gson.fromJson(d.toString(), Game.class);
				gList.add(game);
			}
			
		} catch (Exception e ) {
			logger.error("Exception caught while retreiving games!!" + e);
			e.printStackTrace();
		}
		
		finally {
			
		}
		return gList;
	}
	
	public Game getGameDetails(String gname){
		Game game = null;
		DBCursor docs = null;	
		try {
			DB db = mongoConn.getDb();
			DBObject query = new BasicDBObject();
			query.put("gname", gname);

			docs = db.getCollection("game").find(query);
			
			for(DBObject d: docs) {
				game = new Game();
				game = gson.fromJson(d.toString(), Game.class);
			}
			
		} catch (Exception e ) {
			logger.error("Exception caught while retreiving games!!" + e);
			e.printStackTrace();
		}
		
		finally {
			
		}
		return game;
	}
	
	public List<User> getUserHistory(String uname) {
		List<User> ulist = new ArrayList<User>();
		
		DBCursor docs = null;		
		try {
			DB db1 = mongoConn.getDb();
			DBObject query = new BasicDBObject();
			query.put("uname", uname);
			docs = db1.getCollection("users").find();
			
			for(DBObject d: docs) {
				User user = new User();
				user = gson.fromJson(d.toString(), User.class);
				ulist.add(user);
			}
	
		} catch(Exception e) {
			logger.error("exception ocuured while retreiving user histroy - " + uname, e);
		}
		finally{
			docs.close();
		}
		
		return ulist;
	}

	public boolean updateGame(String gname, int gmin, int gmax, int nUsers) {
		try {
			DB db1 = mongoConn.getDb();
			DBObject query = new BasicDBObject();
			DBObject update = new BasicDBObject();
			query.put("gname", gname);
			
			update.put("gname", gname);
			update.put("minUsers", gmin);
			update.put("maxUsers", gmax);
			update.put("gid", getNextSequence("gid"));
			update.put("noOfcards", nUsers);
			db1.getCollection("game").update(query, update, true, false);
			return true;
		} catch (Exception e) {
			logger.error("Error occured while updating game" + gname);
			return false;
		}
		
	}
	
	// getting sequence akue
	public  Object getNextSequence(String name) {
		DB db1 = mongoConn.getDb();
	    BasicDBObject searchQuery = new BasicDBObject("_id", name);
	    BasicDBObject increase = new BasicDBObject("seq", 1);
	    BasicDBObject updateQuery = new BasicDBObject("$inc", increase);
	    DBObject result = db1.getCollection("gamecounter").findAndModify(searchQuery, null, null,
	            false, updateQuery, true, false);

	    return result.get("seq");
	}
	
	public List<User> getUserGameDetails(String gname) {
		List<User> gulist = new ArrayList<User>();
		DBCursor docs = null;	
		
		try {
			DB db1 = mongoConn.getDb();
			DBObject query = new BasicDBObject();
			query.put("gname", gname);
			docs = db1.getCollection("users").find(query);
			
			for(DBObject d: docs) {
				User user = new User();
				user = gson.fromJson(d.toString(), User.class);
				gulist.add(user);
			}

		} catch (Exception e) {
			logger.error("Erro while retreing user game dertsil");
		}
		
		return gulist;
	}
	
	
	public void updateUserGamedetails(String uname, String gname) {
		DBObject docs = null;
		User user = null;
		int gpts = 100;
	      try {
				DB db1 = mongoConn.getDb();
				DBObject query = new BasicDBObject();
				query.put("uname", uname);
				query.put("gname", gname);
				
				DBObject update = new BasicDBObject();
				update.put("uname", uname);
				update.put("gname", gname);
				
				docs = db1.getCollection("users").findOne(query);
				if(docs != null) {
					user = gson.fromJson(docs.toString(), User.class);
					if(user !=  null) {
						gpts = user.getGpoints() + 100;
					} 
				} 
				
			   update.put("gpoints", gpts);
	    	   db1.getCollection("users").update(query, update, true,false);
	      } catch(Exception e) {
	    	  logger.error("Error while retriveing game user details");
	      }
	}
	
	public List<User> getUsersByGame(String gname) {
		List<User> ulist = new ArrayList<User>();
		
		DBCursor docs = null;		
		try {
			DB db1 = mongoConn.getDb();
			DBObject query = new BasicDBObject();
			query.put("gname", gname);
			docs = db1.getCollection("users").find(query);
			
			for(DBObject d: docs) {
				User user = new User();
				user = gson.fromJson(d.toString(), User.class);
				ulist.add(user);
			}
	
		} catch(Exception e) {
			logger.error("exception ocuured while retreiving user histroy by game - " + gname, e);
		}
		finally{
			docs.close();
		}
		
		return ulist;
	}
	
//	public static void main(String[] args) {
//		User isAuthenticated = getUser("ms2sm", "Ms2sm@7619");
//		
////		if(isAuthenticated) {
////			System.out.println("Authentication successful!!");
////		} else {
////			System.out.println("Authentication failure!!");
////		}
	}

