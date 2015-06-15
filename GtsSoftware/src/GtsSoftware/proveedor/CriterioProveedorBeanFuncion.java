package GtsSoftware.proveedor;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import GtsSoftware.general.MyBatisSesion;


public class CriterioProveedorBeanFuncion {
	private Lock l= new ReentrantLock();
	private Lock l1= new ReentrantLock(); 
	SimpleDateFormat DF = new SimpleDateFormat("dd/MM/yyyy");

	public CriterioProveedorBeanData crearCriterio(HttpServletRequest request, HttpServletResponse response){
		
		CriterioProveedorBeanData criterioPersonalData= new CriterioProveedorBeanData();
		
		criterioPersonalData.setRazonSocial(request.getParameter("txtRazonSocial")==""?null:"%"+request.getParameter("txtRazonSocial")+"%");
	
	
		return criterioPersonalData;				
	}
	
	
	public synchronized Vector<ResultadoProveedorBeanData> buscarPlantillaPersonal(CriterioProveedorBeanData criterioProveedorData){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProveedorBeanData> resultadosV=null;
					
		try{		
			List<ResultadoProveedorBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarProveedor",criterioProveedorData);
			
			resultadosV= new Vector<ResultadoProveedorBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
}

