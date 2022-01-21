package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import beans.Chambre;
import beans.Machine;
import beans.User;
import service.ChambreService;
import service.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

/**
 * Servlet implementation class ClientController
 */
@WebServlet("/OperationChambre")
public class ChambreOpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ChambreService cs = new ChambreService();
	//private final String UPLOAD_DIRECTORY = "C:/uploads";
    /**
     * Default constructor. 
     */
    public ChambreOpController() {
        // TODO Auto-generated constructor stub
    }

    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("op") != null) {
            if (request.getParameter("op").equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                cs.delete(cs.findById(id));
                response.sendRedirect("listerooms.jsp");
            } else if (request.getParameter("op").equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Chambre m = cs.findById(id);
                response.sendRedirect("ModifierChambre.jsp?id=" + m.getId() + "&num=" + m.getNum() + "&type=" + m.getType() + "&prix=" + m.getPrix() );
            }
        } else if (request.getParameter("id") != null) {
            if (!request.getParameter("id").equals("")) {
                int num = Integer.parseInt(request.getParameter("num"));
                String type = request.getParameter("type");
                Double prix = Double.parseDouble(request.getParameter("prix"));
                String photo = request.getParameter("photo");
                int id = Integer.parseInt(request.getParameter("id"));
                Chambre m = cs.findById(id);
                m.setNum(num);
                m.setPrix(prix);
                m.setType(type);
                m.setPhoto(photo);
                cs.update(m);
                response.sendRedirect("ListeChambres.jsp");
            
        
            }}
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        processRequest(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 processRequest(request, response);
	}

}
