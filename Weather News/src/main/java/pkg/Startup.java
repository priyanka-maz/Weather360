package pkg;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.DatabaseMetaData;

/**
 * Servlet implementation class Startup
 */
@WebServlet("/Startup")
public class Startup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Startup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context=getServletContext();
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		try {

			Connection con, con1;

			Class.forName("com.mysql.cj.jdbc.Driver"); //Class is a class

			//Creating Database
			con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "abcd");
			String sqlDbCreate = "create database if not exists news";
			Statement stmt1 = con1.createStatement();

			stmt1.executeUpdate(sqlDbCreate);
			System.out.println("Created database");

			//Using servlet database
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/news", "root", "abcd"); //DriverManager is a class
																	//jdbc:mysql then ip address then port no. then db name

			String sqlUserCreate = "create table if not exists user"
					+ "(user_id int auto_increment not null, "
					+ "first_name varchar(255) not null, "
					+ "last_name varchar(255) not null, "
					+ "email varchar(255) unique not null, "
					+ "password varchar(255) not null, "
					+ "location varchar(255) not null,"
					+ "primary key(user_id))";

			String sqlArticleCreate = "create table if not exists article"
					+ "(article_id int auto_increment not null,"
					+ "title varchar(255) not null,"
					+ "body text not null, "
					+ "user_id int not null, "
					+ "p_date datetime, "
					+ "img varchar(255), "
					+ "tags varchar(255),"
					+ "foreign key(user_id) references user(user_id) on delete cascade, "
					+ "primary key(article_id))";

		
		Statement stmt = con.createStatement();

		stmt.addBatch(sqlUserCreate);
        stmt.addBatch(sqlArticleCreate);
	    stmt.executeBatch();
		}catch(Exception e) {}

		response.sendRedirect("Index");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
