package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;
import service.UserService;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class ClientController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService us = new UserService();
    /**
     * Default constructor. 
     */
    public LoginController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");*/
        String email = request.getParameter("email");
        String password = request.getParameter("password");
       /* String role ="Client";
        String etat ="Disable";*/
        
        if(us.checkAuth(email, password))
        {
        	String name= us.findByEmail(email);
        	request.setAttribute("lobby", "Bonjour "+name);
        	request.setAttribute("logout", "Logout");
        	request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        else
        {
        	request.setAttribute("erreur", "Invalide Information / Compte non active");
        	request.getRequestDispatcher("login.jsp").forward(request, response);
        }

	}
	
	public void logout(HttpServletRequest request , HttpServletResponse response)
            throws ServletException, IOException {
		request.getRequestDispatcher("chambers.jsp").forward(request, response);
    }

}
