package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServlet;

import service.ChambreService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Chambre;
import beans.User;
import service.ChambreService;
import service.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Servlet implementation class ClientController
 */
@WebServlet("/addchambre")
public class ChambreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ChambreService us = new ChambreService();
	//private final String UPLOAD_DIRECTORY = "C:/uploads";
    /**
     * Default constructor. 
     */
    public ChambreController() {
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
		
		
		int num = Integer.parseInt(request.getParameter("numero"));
		
        String type = request.getParameter("type");
        double prix = Double.parseDouble(request.getParameter("prix"));
        String photo = request.getParameter("file");
        

        us.create(new Chambre(num, type, prix, photo));
        request.getRequestDispatcher("ListeChambres.jsp").forward(request, response);
	}

}
