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
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    String allColTemplate = "";
    String allRowTemplate = "";
    int post_status;

    
    String columnTemplate = "	<div class=\"col-lg-4\">\r\n"
    		+ "				      	<a href=\"Article?aid=!AID!\">\r\n"
    	    + "        				<div class=\"d-flex justify-content-between align-items-center\">\r\n"
    	    + "            				<p class=\"publish-time\">!TIME!</p>\r\n"
    	    + "        				</div>\r\n"
    		+ "				         <div class=\"post-image-container\">\r\n"
    		+ "				         	<img src=\"!IMG!\" class=\"post-image\">\r\n"
    		+ "				         </div>\r\n"
    		+ "				  		 <h2 class=\"title\">!TITLE!</h2>\r\n"
    		+ "				  		 	<p class=\"publish-date\">!DATE!</p>\r\n"
    		+ "				  		 </a>\r\n"
    		+ "						 <p class=\"body-text\">!BODY!</p>"
    		+ "				      </div>";
    
    String rowTemplate = "<div class=\"row\">!COL!\r\n</div>";
    
    void DB_Access()
    {
    	try {
			Connection con;
			PreparedStatement pstm;
		    allRowTemplate = "";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/news", "root", "abcd"); //DriverManager is a class 

			
			pstm = con.prepareStatement("select article_id, title, img, p_date, body from article"
					+ " order by abs(timestampdiff(second, p_date, now())) limit 6;");
						
			ResultSet rs = pstm.executeQuery();
			
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
			    
			    
			    String body = rs.getString("body");
			    String[] words = body.split("\\s+");

			    int numWords = Math.min(words.length, 50);
			    String limitedBody = String.join(" ", Arrays.copyOfRange(words, 0, numWords)) + "...";
			    
			    String eachColTemplate = columnTemplate;

			    eachColTemplate = eachColTemplate.replaceAll("!AID!", String.valueOf(rs.getInt("article_id")));

			    eachColTemplate = eachColTemplate.replaceAll("!TIME!", time);

			    eachColTemplate = eachColTemplate.replaceAll("!IMG!", rs.getString("img"));

			    eachColTemplate = eachColTemplate.replaceAll("!TITLE!", rs.getString("title"));

			    eachColTemplate = eachColTemplate.replaceAll("!DATE!", formattedDate);

			    eachColTemplate = eachColTemplate.replace("!BODY!", limitedBody);

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
		DB_Access();

		request.setAttribute("row", allRowTemplate);
    	request.getRequestDispatcher("index.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
