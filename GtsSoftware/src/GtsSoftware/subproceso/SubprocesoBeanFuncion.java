package GtsSoftware.subproceso;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import GtsSoftware.general.CoException;
import GtsSoftware.general.Constants;
import GtsSoftware.general.MyBatisSesion;
import GtsSoftware.proceso.ProcesoBeanData;
import GtsSoftware.programacion.ResultadoProgramacionBeanData;

public class SubprocesoBeanFuncion {

	static private SubprocesoBeanFuncion SubprocesoFuncion=null;

	SimpleDateFormat DF1 = new SimpleDateFormat("dd/MM/yyyy");
	   
	   public static SubprocesoBeanFuncion getInstanceS(){
	       if(SubprocesoFuncion==null) SubprocesoFuncion= new SubprocesoBeanFuncion();
	       
	       return SubprocesoFuncion;
	   }
	   
	   private SubprocesoBeanFuncion() {}
	
	//Este es para crear desde proceso, crear el segundo nivel
	public SubprocesoBeanData crearSubproceso(HttpServletRequest request, HttpServletResponse response,Integer codigoProceso){
		SubprocesoBeanData subprocesoData= new SubprocesoBeanData();
		try{		
		
		subprocesoData.setNombre(request.getParameter("txtNombre"));
		subprocesoData.setCodigoproceso(codigoProceso);
		subprocesoData.setDescripcion(request.getParameter("txtDescripcion"));
		subprocesoData.setTiempoEstimado(Integer.parseInt(request.getParameter("txtTiempo")));
		subprocesoData.setIdRolEjecutor(Integer.parseInt(request.getParameter("idRol")));
		Date fechaActual=new Date(DF1.parse(request.getParameter("fFechaActual")).getTime());
		subprocesoData.setFechaActual(fechaActual);
		
		//agregar el orden del ultimo, ir a BD y agregar uno mas		
		subprocesoData.setEstado(Constants.ACTIVO);
		
		}catch(Exception e){
			e.printStackTrace();			
		}
		return subprocesoData;		
	}
	
	
	//Este es para crear desde la vista subproceso, para crear mas de 2 niveles
	public SubprocesoBeanData crearSubprocesoPadre(HttpServletRequest request, HttpServletResponse response,Integer codigoSubprocesoPadre){
		SubprocesoBeanData subprocesoData= new SubprocesoBeanData();
		try{		
		
		subprocesoData.setNombre(request.getParameter("txtSubproceso"));
		subprocesoData.setCodigosubprocesopadre(codigoSubprocesoPadre);
		subprocesoData.setDescripcion(request.getParameter("txtDescripcion"));
		subprocesoData.setTiempoEstimado(Integer.parseInt(request.getParameter("txtTiempo")));
		subprocesoData.setIdRolEjecutor(Integer.parseInt(request.getParameter("idRol")));
		subprocesoData.setIdRolResponsable(Integer.parseInt(request.getParameter("idRolResponsable")));
		Date date = new Date(); 
		String fecha = DF1.format(date);
		Date fechaActual= DF1.parse(fecha); 
		subprocesoData.setFechaActual((fechaActual));
			    
	    //agregar el orden del ultimo, ir a BD y agregar uno mas
		
		subprocesoData.setEstado(Constants.ACTIVO);
		
		}catch(Exception e){
			e.printStackTrace();			
		}
		return subprocesoData;		
	}
	
	
	public SubprocesoBeanData crearProcesoPadre(HttpServletRequest request, HttpServletResponse response,Integer codigoProcesoPadre){
		SubprocesoBeanData subprocesoData= new SubprocesoBeanData();
		try{		
		
		subprocesoData.setNombre(request.getParameter("txtSubproceso")==""?null:request.getParameter("txtSubproceso"));
		subprocesoData.setCodigoproceso(codigoProcesoPadre);
		subprocesoData.setDescripcion(request.getParameter("txtDescripcion")==""?null:request.getParameter("txtDescripcion"));
		subprocesoData.setTiempoEstimado(request.getParameter("txtTiempo")==""?null:Integer.parseInt(request.getParameter("txtTiempo")));
		subprocesoData.setIdRolEjecutor(request.getParameter("idRol")==""?null:Integer.parseInt(request.getParameter("idRol")));
		subprocesoData.setIdRolResponsable(request.getParameter("idRolResponsable")==""?null:Integer.parseInt(request.getParameter("idRolResponsable")));
		Date date = new Date(); 
		String fecha = DF1.format(date);
		Date fechaActual= DF1.parse(fecha); 
		subprocesoData.setFechaActual((fechaActual));
		subprocesoData.setEstado(Constants.ACTIVO);
		
		}catch(Exception e){
			e.printStackTrace();			
		}
		return subprocesoData;		
	}
	
	public SubprocesoBeanData crearSubprocesoModificar(HttpServletRequest request, HttpServletResponse response){
		SubprocesoBeanData subprocesoData= new SubprocesoBeanData();
		try{		
		
		subprocesoData.setNombre((request.getParameter("txtNombre")));
		subprocesoData.setDescripcion(request.getParameter("txtDescripcion"));
				
		Date fechaRegistro=new Date(DF1.parse(request.getParameter("fFechaRegistro")).getTime());
		subprocesoData.setFechaActual(fechaRegistro);
		
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
		subprocesoData.setEstado(valor);
		
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return subprocesoData;		
	}
	
	//Este es para agregar desde proceso, crear el segundo nivel
	public synchronized boolean agregarSubproceso(SubprocesoBeanData subsubprocesoData) throws CoException {
		boolean resultado=false;
		
		//ProcesoBeanFuncion ProcesoFuncion= ProcesoBeanFuncion.getInstanceS();	
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			
			//se llama  la funcion creada en proceso_mapper, usando el namespace.funcion
			Integer codigo= sqlsesion.selectOne("Data.mappers.subproceso.sacarCodigo");
			
			//saca el orden maximo de subproceso, para un proceso
		    Integer orden=sqlsesion.selectOne("Data.mappers.subproceso.sacarMaxOrden", subsubprocesoData.getCodigoproceso());
			
			if(codigo!=null){

				int cod= codigo + 1;
				subsubprocesoData.setCodigosubproceso(cod);
			}
			
			else subsubprocesoData.setCodigosubproceso(1);
			
			if (orden!=null){
		    	subsubprocesoData.setOrden(orden+1);
		    }
		    else subsubprocesoData.setOrden(1);			
							
			sqlsesion.insert("Data.mappers.subproceso.insertarSubProceso",subsubprocesoData);
			
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
	
	//Este es para crear desde la vista subproceso, para crear mas de 2 niveles
	public synchronized boolean agregarSubprocesoPadre(SubprocesoBeanData subprocesoData) throws CoException {
		boolean resultado=false;
		
		//ProcesoBeanFuncion ProcesoFuncion= ProcesoBeanFuncion.getInstanceS();	
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			
			//se llama  la funcion creada en proceso_mapper, usando el namespace.funcion
			Integer codigo= sqlsesion.selectOne("Data.mappers.subproceso.sacarCodigo");
			
			//saca el orden maximo de subproceso, para un proceso
		    Integer orden=sqlsesion.selectOne("Data.mappers.subproceso.sacarMaxOrdenPadre", subprocesoData.getCodigosubprocesopadre());
			
			if(codigo!=null){

				codigo= codigo + 1;
				subprocesoData.setCodigosubproceso(codigo);
			}
			
			else subprocesoData.setCodigosubproceso(codigo);
			
			if (orden!=null){
		    	subprocesoData.setOrden(orden+1);
		    }
		    else subprocesoData.setOrden(1);			
							
			sqlsesion.insert("Data.mappers.subproceso.insertarSubProceso",subprocesoData);
			
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

	
	
	public synchronized void modificarSubproceso(SubprocesoBeanData subproceso) throws CoException {
	
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
					
			sqlsesion.update("Data.mappers.subproceso.modificarSubproceso",subproceso);
		}
		catch(Exception a)		
		{sqlsesion.rollback();
		a.printStackTrace();
			//throw CoException.set("Error: No se pudo modificar la plantilla intente de nuevo", "SMVSocio?accion=Modificar&tipo=1");
			
		}
		
		finally{
			sqlsesion.commit();
			sqlsesion.close();
			
		}			
		return ;
	}
	
	public synchronized SubprocesoBeanData consultarSubproceso(Integer codigo){
		
	SubprocesoBeanData subprocesoData=null;
	SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
	try{
		subprocesoData= sqlsesion.selectOne("Data.mappers.subproceso.buscarUnSubprocesoS",codigo);
	}
	finally{
		sqlsesion.close();
		
	}
	return subprocesoData;
	}
	
	
	public synchronized Integer consultarMaximoOrdenNivelDos(Integer codigo){
		
		Integer maximoOrden=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			 maximoOrden=sqlsesion.selectOne("Data.mappers.subproceso.sacarMaxOrden", codigo);
		}
		finally{
			sqlsesion.close();
			
		}
		return maximoOrden;
	}
	
	
	public synchronized SubprocesoBeanData consultarSubprocesoS(Integer codigosubproceso){
		
		SubprocesoBeanData subprocesoData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			subprocesoData= sqlsesion.selectOne("Data.mappers.subproceso.buscarUnSubprocesoS",codigosubproceso);
		}
		finally{
			sqlsesion.close();
			
		}
		return subprocesoData;
	}
	
	public synchronized SubprocesoBeanData consultarSubprocesoOrden(SubprocesoBeanData Subproceso){
		
		SubprocesoBeanData subprocesoData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			subprocesoData= sqlsesion.selectOne("Data.mappers.subproceso.buscarUnSubprocesoOrden",Subproceso);
		}
		finally{
			sqlsesion.close();
			
		}
		return subprocesoData;
	}
	
	
		public synchronized ProcesoBeanData consultarProcesoS(Integer codigoproceso){
		
		ProcesoBeanData procesoData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			procesoData= sqlsesion.selectOne("Data.mappers.subproceso.buscarUnProcesoS",codigoproceso);
		}
		finally{
			sqlsesion.close();
			
		}
		return procesoData;
	}
	
	
	public synchronized SubprocesoBeanData consultarSubprocesoNombre(String nombreSubprocesoS){
		
		SubprocesoBeanData subprocesoData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			subprocesoData= sqlsesion.selectOne("Data.mappers.subproceso.buscarUnSubprocesoNombre",nombreSubprocesoS);
		}
		finally{
			sqlsesion.close();
			
		}
		return subprocesoData;
	}
	
	
	public synchronized ProcesoBeanData consultarProcesoNombre(String nombreProceso){
		
		ProcesoBeanData procesoData=null;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			procesoData= sqlsesion.selectOne("Data.mappers.subproceso.buscarUnProcesoNombre",nombreProceso);
		}
		finally{
			sqlsesion.close();
			
		}
		return procesoData;
	}
	
	
	public synchronized Vector<ResultadoProgramacionBeanData> buscarPlantillaProgramacion(Integer codigoProceso){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProgramacionBeanData> resultadosV=null;
					
		try{		
			List<ResultadoProgramacionBeanData> resultados=sqlsesion.selectList("Data.mappers.proceso.buscarProgramacion",codigoProceso);
			
			resultadosV= new Vector<ResultadoProgramacionBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}		
		return resultadosV;		
	}
	
	
	
	//Se busca a los subprocesos de un proceso, solo el 2do nivel
	public synchronized Vector<ResultadoSubprocesoBeanData> buscarSubprocesosNivelDos(Integer idProceso){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoSubprocesoBeanData> resultadosV=null;
					
		try{		
			List<ResultadoSubprocesoBeanData> resultados=sqlsesion.selectList("Data.mappers.subproceso.buscarSubprocesosNivelDos",idProceso);
			
			resultadosV= new Vector<ResultadoSubprocesoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	
	//Se busca a los subprocesos de un subproceso, para niveles mayores a 2
	public synchronized Vector<ResultadoSubprocesoBeanData> buscarSubprocesosNivelInferior(Integer idSubProceso){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoSubprocesoBeanData> resultadosV=null;
					
		try{		
			List<ResultadoSubprocesoBeanData> resultados=sqlsesion.selectList("Data.mappers.subproceso.buscarSubprocesosNivelInferior",idSubProceso);
			
			resultadosV= new Vector<ResultadoSubprocesoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	
	
	
	public void modificarProceso(SubprocesoBeanData subproceso) throws CoException {
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
					
			sqlsesion.update("Data.mappers.subproceso.modificarSubproceso",subproceso);
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
