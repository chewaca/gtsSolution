package GtsSoftware.personal;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import GtsSoftware.general.MyBatisSesion;

public class CriterioPersonalBeanFuncion {
	private Lock l= new ReentrantLock();
	private Lock l1= new ReentrantLock(); 
	SimpleDateFormat DF = new SimpleDateFormat("dd/MM/yyyy");

	public CriterioPersonalBeanData crearCriterio(HttpServletRequest request, HttpServletResponse response){
		
		CriterioPersonalBeanData criterioPersonalData= new CriterioPersonalBeanData();
		
		criterioPersonalData.setNombre(request.getParameter("txtNombre")==""?null:"%"+request.getParameter("txtNombre")+"%");
	
	
		return criterioPersonalData;				
	}
	
	
	public synchronized Vector<ResultadoPersonalBeanData> buscarPlantillaPersonal(CriterioPersonalBeanData criterioPersonalData){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoPersonalBeanData> resultadosV=null;
					
		try{		
			List<ResultadoPersonalBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarPersonal",criterioPersonalData);
			
			resultadosV= new Vector<ResultadoPersonalBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
}

