package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/studreg")
public class Validationservlet implements Filter 
{
	
public void init(FilterConfig fConfig) throws ServletException {
	String value=fConfig.getInitParameter("key");
	System.out.println(value);
	}
	
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException 
	{
		PrintWriter out=resp.getWriter();
		resp.setContentType("text/html");
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String address=req.getParameter("address");
		
		if(name.equals("")){
			out.println("name is required");
		}
		if(email.equals("")){
			out.println("email is required");
			
		}
		if(address.equals("")){
			out.println("address is required");
		}
		else
		{
			out.println("<div style='border-color:red;border-style:dashed color:green;'>");	
			out.println("<pre>");
			chain.doFilter(req, resp);
			out.println("</pre>");
			out.println("</div>");
			
		}
			}
	
public void destroy() 
{
System.out.println("filter is destroyed");		
	}

}
