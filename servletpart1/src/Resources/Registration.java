package Resources;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Registration implements Servlet 
{
	
public  Registration()
{
	System.out.println(" Registration servlet object");
}
	@Override
	public void init(ServletConfig config) throws ServletException 
	{
	System.out.println("while after immediate creation of object");

	}
	
	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException 
	{
		System.out.println("at each user request");
	}
	@Override
	public void destroy() {
	System.out.println("at the undeployment or shutdown");
	}

	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null;
	}




	}


