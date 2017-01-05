package listner;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class Sessionlistner implements HttpSessionListener {

       public void sessionCreated(HttpSessionEvent se)  
       { 
       System.out.println("on session cresion"); 
   
       }

    public void sessionDestroyed(HttpSessionEvent se)  
    { 
         System.out.println("on session destroyed");
    }
	
}
