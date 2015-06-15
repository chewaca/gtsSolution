package GtsSoftware.proceso;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import GtsSoftware.general.CoException;
import GtsSoftware.general.Constants;
import GtsSoftware.general.MyBatisSesion;
import GtsSoftware.subproceso.ResultadoSubprocesoBeanData;

public class ProcesoBeanFuncion {

	static private ProcesoBeanFuncion ProcesoFuncion=null;
	
	SimpleDateFormat DF1 = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat DF2 = new SimpleDateFormat("dd/MM/yyyy");
	//SimpleDateFormat DF = new SimpleDateFormat("dd/MM/yyyy");
	   
	   public static ProcesoBeanFuncion getInstanceS(){
	       if(ProcesoFuncion==null) ProcesoFuncion= new ProcesoBeanFuncion();
	       
	       return ProcesoFuncion;
	   }
	   
	   private ProcesoBeanFuncion() {}
	
	   public ProcesoBeanData crearProceso(HttpServletRequest request, HttpServletResponse response){
		ProcesoBeanData procesoData= new ProcesoBeanData();
		try{		
		
		procesoData.setNombre((request.getParameter("txtNombre")==""?null:(request.getParameter("txtNombre"))));
		procesoData.setDescripcion(request.getParameter("txtDescripcion")==""?null:(request.getParameter("txtNombre")));
		
		//para crear un registro con la fecha de hoy, formato DATE
		Date date = new Date(); 
		String fecha = DF1.format(date);
		Date fechaInicio= DF1.parse(fecha); 
		procesoData.setFechaInicio((fechaInicio));
		
		String fechaF=request.getParameter("fFechaFin")==""?null:request.getParameter("fFechaFin");
		if(fechaF!=null){
			Date fechaFin=new Date(DF2.parse(request.getParameter("fFechaFin")).getTime());
			procesoData.setFechaFin(fechaFin);	
		}
		procesoData.setEstado(Constants.OPER_CALIBRADO);
		}catch(Exception e){
			e.printStackTrace();			
		}
		return procesoData;		
	} 
	
	public ProcesoBeanData crearProcesoModificar(HttpServletRequest request, HttpServletResponse response){
		ProcesoBeanData procesoData= new ProcesoBeanData();
		try{		
		
		procesoData.setNombre((request.getParameter("txtNombre")));
		procesoData.setDescripcion(request.getParameter("txtDescripcion"));
				
		Date fechaInicio=new Date(DF1.parse(request.getParameter("fFechaInicio")).getTime());
		procesoData.setFechaInicio(fechaInicio);
		
		Date fechaFin=new Date(DF2.parse(request.getParameter("fFechaFin")).getTime());
		procesoData.setFechaFin(fechaFin);
		
		Integer valor=0;
		
		if (request.getParameter("rButton")!=null){
			String estado;
			estado=request.getParameter("rButton");
			
			if(estado.equals("Activo")){
				valor=1;
			}
			if(estado.equals("Inactivo")){
				valor=2;
			}			
		}
		procesoData.setEstado(valor);
		
		}catch(Exception e){
			e.printStackTrace();			
		}
		return procesoData;		
	} 

	public synchronized boolean agregarProceso(ProcesoBeanData procesoData) throws CoException {
		boolean resultado=false;		
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			
			//se llama  la funcion creada en proceso_mapper, usando el namespace.funcion
			Integer codigo= sqlsesion.selectOne("Data.mappers.proceso.sacarCodigo");
			if(codigo!=null){
				int cod= codigo + 1;
				procesoData.setCodigo(cod);
			}
			else procesoData.setCodigo(1);			
			sqlsesion.insert("Data.mappers.proceso.insertarProceso",procesoData);
			
			resultado=true;
		}
		catch(Exception a){
			sqlsesion.rollback();
			a.printStackTrace();
			//throw CoException.set("Error: Nombre de evento repetido", "SMSEvento?accion=Agregar&tipo=1");
		}
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}			
		return resultado;
	}

	
	public synchronized ProcesoBeanData consultarProceso(Integer codigo){
		
	ProcesoBeanData procesoData=null;
	SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
	try{
		procesoData= sqlsesion.selectOne("Data.mappers.proceso.buscarUnProceso",codigo);
	}
	finally{
		sqlsesion.close();		
	}
	return procesoData;
	}
	
	
	public synchronized ProcesoBeanData consultarProcesoNombre(String nombreProceso){
		
		ProcesoBeanData procesoData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			procesoData= sqlsesion.selectOne("Data.mappers.proceso.buscarProcesoNombre",nombreProceso);
		}
		finally{
			sqlsesion.close();			
		}
		return procesoData;
	}
	
	
	public synchronized Vector<ResultadoSubprocesoBeanData> consultarSubprocesosProceso(Integer codigoProceso){
		
		Vector<ResultadoSubprocesoBeanData> subprocesoData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			List<ResultadoSubprocesoBeanData> resultados= sqlsesion.selectList("Data.mappers.subproceso.buscarSubprocesoProcesoAux",codigoProceso);
			subprocesoData=new Vector<ResultadoSubprocesoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();			
		}
		return subprocesoData;
	}
	
	
	public synchronized int consultarOrdenMaxProceso(Integer codigo){
		
		int orden;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			orden= sqlsesion.selectOne("Data.mappers.subproceso.sacarMaxOrden",codigo);
		}
		finally{
			sqlsesion.close();			
		}
		return orden;
	}
	
	
	public void modificarProceso(ProcesoBeanData proceso) throws CoException {
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
					
			sqlsesion.update("Data.mappers.proceso.modificarProceso",proceso);
		}
		catch(Exception a)		
		{sqlsesion.rollback();
		a.printStackTrace();
			//throw CoException.set("Error: No se pudo modificar el familiar, intente de nuevo", "SMVFamiliar?accion=Modificar&tipo=1");
		}		
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}			
		return ;
	}
	
}
