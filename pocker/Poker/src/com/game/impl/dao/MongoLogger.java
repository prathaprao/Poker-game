package com.game.impl.dao;
import javax.annotation.PostConstruct;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;

@Repository
public class MongoLogger {

	@PostConstruct
	public void setLogLevel() {
		final Logger root = (Logger) LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME);
	    root.setLevel(Level.ERROR);
	}

}
