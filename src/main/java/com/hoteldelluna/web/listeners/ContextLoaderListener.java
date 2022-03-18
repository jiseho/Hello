package com.hoteldelluna.web.listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;

@WebListener
public class ContextLoaderListener implements ServletContextListener{
	
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		
		
	}
}
