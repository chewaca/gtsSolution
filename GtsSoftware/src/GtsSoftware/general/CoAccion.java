package GtsSoftware.general;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class CoAccion {
	
	public abstract void ejecutar(ServletContext sc, HttpServletRequest  request, HttpServletResponse response) throws CoException;
	public void direccionar(ServletContext sc,HttpServletRequest  request, HttpServletResponse response,String URL){
		try{
			sc.getRequestDispatcher(URL).forward(request, response);
			}
			catch(Exception e){}
			finally{}
	}
	public void error(CoException a,ServletContext sc,HttpServletRequest  request, HttpServletResponse response){
		try{
		request.setAttribute("exception", a);		
		sc.getRequestDispatcher("/Gts/general/errorpage.jsp").forward(request, response);
		}
		catch(Exception e){}
		
	}
	
}
