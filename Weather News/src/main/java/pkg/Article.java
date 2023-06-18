package pkg;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Article
 */
@WebServlet("/Article")
public class Article extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Article() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    String articleTemplate = "<div class=\"article\">\r\n"
    		+ "						   <h1 class=\"heading\">!TITLE!</h1>\r\n"
    		+ "						   <div class=\"author\">\r\n"
    		+ "						      <p class=\"author-name\">!USERNAME!</p>\r\n"
    		+ "						      <span class=\"separator\"><i class=\"fa-solid fa-square-full\"></i></span>\r\n"
    		+ "						      <p class=\"publish-date\">!DATE!</p>\r\n"
    		+ "						   </div>\r\n"
    		+ "						   <img src=\"!IMAGE!\" class=\"article-image\" alt=\"Article Image\">\r\n"
    		+ "						   <div class=\"content\">"
    		+ "							<br>!BODY!\r\n"
    		+ "						   </div>\r\n"
    		+ " 					   <hr>"
    		+ " 					   <span class=\"tags\">Related Tags: !TAGS!</span>"								
    		+ "						</div>";
    
    String tagsTemplate = "<span class=\"tag\">#!TAG!</span>";								

    String title = null;
    String body = null;
    String username = null;
    Timestamp post_date = null;
    String img = null;
    String tags = null;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String articleIdStr = request.getParameter("aid");
        if (articleIdStr == null || articleIdStr.isEmpty()) {
            response.sendRedirect("error.html");
            return;
        }
        
        int articleId = 0;
        try {
            articleId = Integer.parseInt(articleIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("error.html");
        }
		
	    String allArticleTemplate = "";
	    String allTagsTemplate = "";

		PrintWriter pw = response.getWriter();
		
    	try {
			Connection con;
			PreparedStatement pstm, pstm1;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/news", "root", "abcd"); 
			
			pstm = con.prepareStatement("select title, body, user_id, p_date, img, tags from article where article_id = ?;");
	
			pstm.setInt(1, articleId);
			
			ResultSet rs = pstm.executeQuery();

			if(rs.next())
			{
				title = rs.getString("title");
				body = rs.getString("body");
				post_date = rs.getTimestamp("p_date");
				img = rs.getString("img");
				tags = rs.getString("tags");
				
				pstm1 = con.prepareStatement("select first_name, last_name from user where user_id = ?;");
				
				pstm1.setInt(1, rs.getInt("user_id"));
				
				ResultSet rs1 = pstm1.executeQuery();
				
				if (rs1.next()) {
					
					username = rs1.getString("first_name") + " " + rs1.getString("last_name");
				}
				
				else {
				    response.sendRedirect("error.html");
				    //return;
				}
				
				System.out.println(title);
				System.out.println(post_date);
				System.out.println(img);
				System.out.println(username);
				System.out.println(tags);
				
		        SimpleDateFormat sdf = new SimpleDateFormat("EEEE, dd MMM, yyyy");
		        Date date = new Date(post_date.getTime());
		        String formattedDate = sdf.format(date);
				
				String eachArticleTemplate = articleTemplate;
				
				String[] tagArray = tags.substring(1).split("#");
				for (String tag : tagArray) {
					String eachTagTemplate = tagsTemplate;
				    tag = tag.trim();
				    eachTagTemplate = eachTagTemplate.replaceAll("!TAG!", tag);
				    allTagsTemplate = allTagsTemplate.concat(eachTagTemplate);    
				}
				
				//putting the data in the template.
				eachArticleTemplate = eachArticleTemplate.replaceAll("!TITLE!", title);
				
				eachArticleTemplate = eachArticleTemplate.replaceAll("!USERNAME!", username);
				
				eachArticleTemplate = eachArticleTemplate.replaceAll("!DATE!", formattedDate);
				
				eachArticleTemplate = eachArticleTemplate.replaceAll("!IMAGE!", img);
									
				eachArticleTemplate = eachArticleTemplate.replace("!BODY!", body);
				
				eachArticleTemplate = eachArticleTemplate.replaceAll("!TAGS!", allTagsTemplate);

				allArticleTemplate = allArticleTemplate.concat(eachArticleTemplate);
				
				request.setAttribute("article", allArticleTemplate);
				request.getRequestDispatcher("article.jsp").include(request, response);

			}
			else {
			    response.sendRedirect("error.html");
			    //return;
			}
			
    	}catch(Exception e) { e.printStackTrace(); }
    	
    	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
