package GtsSoftware.general;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IsServlet
 */

public class CoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected VAccion	acciones= new VAccion();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		this.initAcciones();
		try{
			acciones.find(request.getParameter("accion")).ejecutar(getServletContext(), request, response);
		}
		catch(CoException a){
			acciones.find(request.getParameter("accion")).error(a, getServletContext(), request, response);	
		}
	}

	protected  void initAcciones() {}
}

	