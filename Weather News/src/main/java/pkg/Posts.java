package pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Posts
 */
@WebServlet("/Posts")
public class Posts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Posts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    String first_name = null;
    String last_name = null;
    String email = null;
    String location = null;
    String allColTemplate = "";
    String allRowTemplate = "";
    int post_status;

    
    String columnTemplate = "	<div class=\"col-lg-4\">\r\n"
    		+ "				      	<a href=\"Article?aid=!AID!\">\r\n"
    	    + "        				<div class=\"d-flex justify-content-between align-items-center\">\r\n"
    	    + "            				<p class=\"publish-time\">!TIME!</p></a>\r\n"
    	    + "							<span class=\"del-button\" onclick=\"sendPostRequest(!AID!, this.parentElement.parentElement)\"><i class=\"fa-solid fa-trash\"></i></span>\r\n"
    	    + "        				</div>\r\n"
    		+ "				      	<a href=\"Article?aid=!AID!\">\r\n"
    		+ "				         <div class=\"post-image-container\">\r\n"
    		+ "				         	<img src=\"!IMG!\" class=\"post-image\">\r\n"
    		+ "				         </div>\r\n"
    		+ "				  		 <h2 class=\"title\">!TITLE!</h2>\r\n"
    		+ "				  		 	<p class=\"publish-date\">!DATE!</p>\r\n"
    		+ "				  		 </a>\r\n"
    		+ "						<p id=\"deleted!AID!\" hidden></p>\r\n"
    		+ "				      </div>";
    
    String rowTemplate = "<div class=\"row\">!COL!\r\n</div>";
    
    void DB_Access(String user_id)
    {
    	try {
			Connection con;
			PreparedStatement pstm;
		    allRowTemplate = "";
			
			int uid = Integer.parseInt(user_id);
			System.out.println(uid*10);
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/news", "root", "abcd"); //DriverManager is a class 
			
			
			pstm = con.prepareStatement("select first_name, last_name, email, location from user where user_id = ?;");
	
			pstm.setString(1, user_id);
			
			ResultSet rs = pstm.executeQuery();
			
			if(rs.next())
			{
				first_name = rs.getString("first_name");
				last_name = rs.getString("last_name");
				email = rs.getString("email");
				location = rs.getString("location");
			}
			
			pstm = con.prepareStatement("select article_id, title, img, p_date from article where user_id = ?"
					+ " order by abs(timestampdiff(second, p_date, now()));");
			
			pstm.setString(1, user_id);
			
			rs = pstm.executeQuery();
			
			int rowCount = 0;
			allRowTemplate = ""; 

			while (rs.next()) {
			    if (rowCount % 3 == 0) {
			        allColTemplate = "";
			    }

			    SimpleDateFormat sdf = new SimpleDateFormat("EE, dd MMM, yyyy");
			    Date date = new Date(rs.getTimestamp("p_date").getTime());
			    String formattedDate = sdf.format(date);

			    LocalDateTime pDate = rs.getTimestamp("p_date").toLocalDateTime();
			    LocalDateTime now = LocalDateTime.now();

			    Duration duration = Duration.between(pDate, now);
			    String time;

			    if (duration.getSeconds() < 60) {
			        long seconds = duration.getSeconds();
			        time = seconds + " seconds ago";
			    } else if (duration.toMinutes() < 60) {
			        long minutes = duration.toMinutes();
			        time = minutes + " minutes ago";
			    } else if (duration.toHours() < 24) {
			        long hours = duration.toHours();
			        time = hours + " hours ago";
			    } else if (duration.toDays() < 30) {
			        long days = duration.toDays();
			        time = days + " days ago";
			    } else {
			        long years = duration.toDays() / 365;
			        time = years + " years ago";
			    }

			    String eachColTemplate = columnTemplate;

			    eachColTemplate = eachColTemplate.replaceAll("!AID!", String.valueOf(rs.getInt("article_id")));

			    eachColTemplate = eachColTemplate.replaceAll("!TIME!", time);

			    eachColTemplate = eachColTemplate.replaceAll("!IMG!", rs.getString("img"));

			    eachColTemplate = eachColTemplate.replaceAll("!TITLE!", rs.getString("title"));

			    eachColTemplate = eachColTemplate.replaceAll("!DATE!", formattedDate);

			    allColTemplate = allColTemplate.concat(eachColTemplate);

			    if ((rowCount + 1) % 3 == 0 || rs.isLast()) {
			        String eachRowTemplate = rowTemplate;
			        eachRowTemplate = eachRowTemplate.replaceAll("!COL!", allColTemplate);
			        allRowTemplate = allRowTemplate.concat(eachRowTemplate);
			    }

			    rowCount++;
			}

    	}catch(Exception e) {}
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get");
		
		
		Cookie ck[] = request.getCookies();
		String user_id = Utilities.GetUID(request);
		
		
		if(user_id == null)
		{
			request.getRequestDispatcher("Login").include(request, response);
		}
		else
		{
			System.out.println("From Cookies " + user_id);
			DB_Access(user_id);
		   	request.setAttribute("first_name", first_name);
		   	request.setAttribute("last_name", last_name);
		   	request.setAttribute("email", email);
		   	request.setAttribute("location", location);
			request.setAttribute("row", allRowTemplate);
		   	
	    	request.getRequestDispatcher("yourPosts.jsp").include(request, response);
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Cookie ck[] = request.getCookies();
		String user_id = Utilities.GetUID(request);
		
		
		if(user_id == null)
		{
			request.getRequestDispatcher("Login").include(request, response);
		}
		else
		{
			String job = request.getParameter("job");
			
			if (job.equals("delete"))
			{
				String aid = request.getParameter("aid");
				
				System.out.println("Post AID "+ aid);
				System.out.println("Post Job "+ job);

				try {
					Connection con;
					PreparedStatement pstm;
					
					int uid = Integer.parseInt(user_id);
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/news", "root", "abcd"); //DriverManager is a class 
					
					pstm = con.prepareStatement("delete from article where article_id = ?;");
					pstm.setString(1, aid);
					
					int rs = pstm.executeUpdate();
					System.out.println(aid + " was deleted");
					
					post_status = 200;
					
				}catch (Exception e){   post_status = 300;  }
				
				response.setStatus(post_status);
				response.setHeader("Content-Type", "text/html");
				
			}
		}
	}

}
