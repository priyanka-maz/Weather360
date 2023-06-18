package pkg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Utilities")
public class Utilities{
	
	//This is not a SERVLET!!!
	//Class only for Utils
	private static final long serialVersionUID = 1L;
       
   
    public Utilities() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected static String GetUID(HttpServletRequest request)
    {
		Cookie ck[] = request.getCookies();

    	String user_id = null;
		if(ck != null)
		{
			for(Cookie cookie: ck)
			{
				if(cookie.getName().equals("UID"))
				{
					user_id = cookie.getValue();
					System.out.println(user_id);
	
				}
			}
		}
		return user_id;
    }
    
    protected static String LikeString(String s)
    {
    	String temp = "%";
    	temp = temp.concat(s);
    	temp = temp.concat("%");
    	
    	return temp;
    }
    

}
