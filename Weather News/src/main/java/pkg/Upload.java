package pkg;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 35, // 35MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    String first_name=null;
    String last_name=null;
    String email = null;
    String location=null;
    
    void DB_Access(String user_id)
    {
    	try {
			Connection con;
			PreparedStatement pstm;
			
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
			
    	}catch(Exception e) {}
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("get");
		
		
		Cookie ck[] = request.getCookies();
		int flag = 0;
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
	    	request.getRequestDispatcher("upload.html").include(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = getServletContext(); 
	    response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();

		//getting values from input fields
		String title = request.getParameter("title");
		String tags = request.getParameter("tags");
		Part photo = request.getPart("photo");
		String article_body = request.getParameter("article-body");
		
		String user_id = Utilities.GetUID(request);
		String img_path = "";
		int articleId = 0;
		
		//String uploadDirectory = getServletContext().getRealPath("Pics/Posts");
		
		String uploadDirectory = "/opt/tomcat/webapps/Weather_News/Pics/Posts";
		
		if (photo.getSize() == 0) img_path="Pics/Posts/default.jpg"; 
		
		try 
		{
			Connection con;
			PreparedStatement pstm; 			     
			
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/news", "root", "abcd"); 
													
			Statement stmt = con.createStatement();
			
			pstm = con.prepareStatement("insert into article "
					+ "(title, body, user_id, p_date, img, tags) "
					+ "values (?, ?, ?, ?, ?, ?);", Statement.RETURN_GENERATED_KEYS);
			
			pstm.setString(1, title);			
			pstm.setString(2, article_body);
			pstm.setString(3, user_id);
			pstm.setObject(4, LocalDateTime.now());
			pstm.setString(5, img_path);
			pstm.setString(6, tags);

			int rowsAffected = pstm.executeUpdate();
			
			try (ResultSet generatedKeys1 = pstm.getGeneratedKeys()) {
		        if (generatedKeys1.next()) {
		            articleId = generatedKeys1.getInt(1);
		            }
		    }
		        
			if (rowsAffected > 0 && photo.getSize() > 0) {

				try (ResultSet generatedKeys = pstm.getGeneratedKeys()) {
				        if (generatedKeys.next()) {
				            articleId = generatedKeys.getInt(1);
				            
				            String imgPath = "Pics/Posts/" + articleId + ".jpg";
				            
				            // Update the image pathname in the database
				            PreparedStatement updatePstm = con.prepareStatement("update article set img = ? where article_id = ?");
				            updatePstm.setString(1, imgPath);
				            updatePstm.setInt(2, articleId);
				            updatePstm.executeUpdate();
				            
				            File directory = new File(uploadDirectory);
				    	    File uploadedFile = new File(directory, articleId + ".jpg");
				    	    
				    	 // Save the photo to the file system
				    	    try (InputStream input = photo.getInputStream();
				    	         FileOutputStream output = new FileOutputStream(uploadedFile)) {
				    	        byte[] buffer = new byte[1024];
				    	        int length;
				    	        while ((length = input.read(buffer)) > 0) {
				    	            output.write(buffer, 0, length);
				    	        }
				    	    }

				    	    // Send a response indicating successful file upload
				    	    System.out.println("File uploaded successfully!");
				        }
				    }catch (Exception e) {
				        e.printStackTrace();
				    }
			}

		}catch(Exception e) {}
		
		request.setAttribute("post", "Article?aid=" + articleId );
    	request.getRequestDispatcher("postPost.jsp").include(request, response);

	}

}
