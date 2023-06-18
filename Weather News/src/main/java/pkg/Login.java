package pkg;

import java.io.*;
import java.sql.*;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("wrong_password", "hidden");
	   	request.setAttribute("wrong_email", "hidden");

    	request.getRequestDispatcher("login.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context=getServletContext();
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String email = request.getParameter("email");
		String password  = request.getParameter("password");
		
		
		try {
			Connection con;
			PreparedStatement pstm;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/news", "root", "abcd"); //DriverManager is a class 
			
			pstm = con.prepareStatement("select user_id, email, password, first_name, last_name, location from user where email = ?;");
			pstm.setString(1, email);
			
			ResultSet rs = pstm.executeQuery();
			
			if(rs.next())
			{
				String generatedSecuredPasswordHash = generateStrongPasswordHash(password);
				System.out.println("From input: " + generatedSecuredPasswordHash);
				System.out.println("From db: " + rs.getString("password"));

				if(generatedSecuredPasswordHash.equals(rs.getString("password")))
				{
					System.out.println("Success!");
					request.setAttribute("logged_in", "ticked");
					
					//Cookies
					Cookie ck  = new Cookie("UID", rs.getString("user_id"));
					ck.setMaxAge(60 * 60 * 24 * 10);
					response.addCookie(ck);
							
					//Post log in page
				   	request.setAttribute("first_name", rs.getString("first_name"));
				   	request.setAttribute("last_name", rs.getString("last_name"));
				   	request.setAttribute("email", rs.getString("email"));
				   	request.setAttribute("location", rs.getString("location"));

			    	request.getRequestDispatcher("profile.jsp").forward(request, response);

				}
				else
				{
					request.setAttribute("wrong_email", "hidden");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					System.out.println("Wrong Password!");

				}
			}
			else
			{
				request.setAttribute("wrong_password", "hidden");
				request.getRequestDispatcher("login.jsp").include(request, response);
				System.out.println("Email not present!");
			}
			
			
		}catch(Exception e) {}
	}

	private static String generateStrongPasswordHash(String password)throws NoSuchAlgorithmException, InvalidKeySpecException
		{
		    int iterations = 1000;
		    char[] chars = password.toCharArray();
		    byte[] salt = "[B@76ed5528".getBytes();
		    PBEKeySpec spec = new PBEKeySpec(chars, salt, iterations, 64 * 8);
		    SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
		    byte[] hash = skf.generateSecret(spec).getEncoded();
		    return iterations + ":" + toHex(salt) + ":" + toHex(hash);
		}
	
		private static String toHex(byte[] array) throws NoSuchAlgorithmException
		{
		    BigInteger bi = new BigInteger(1, array);
		    String hex = bi.toString(16);
		    int paddingLength = (array.length * 2) - hex.length();
		    if(paddingLength > 0)
		    {
		        return String.format("%0"  + paddingLength + "d", 0) + hex;
		    }else{
		        return hex;
		    }
		}
}
