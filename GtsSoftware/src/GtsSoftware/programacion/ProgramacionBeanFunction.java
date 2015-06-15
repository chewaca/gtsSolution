package GtsSoftware.programacion;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import GtsSoftware.actividad.ResultadoActividadBeanData;
import GtsSoftware.activo.ResultadoActivoBeanData;
import GtsSoftware.general.CoException;
import GtsSoftware.general.MyBatisSesion;
import GtsSoftware.local.LocalBeanData;
import GtsSoftware.marca.MarcaBeanData;
import GtsSoftware.personal.ResultadoPersonalBeanData;
import GtsSoftware.proveedor.ProveedorBeanData;

public class ProgramacionBeanFunction {
	static private ProgramacionBeanFunction ProgramaFuncion=null;
	
	Calendar fechaI = new GregorianCalendar();
	Calendar fechaE = new GregorianCalendar();
	Calendar fechaF = new GregorianCalendar();
	Calendar fechaAAux = new GregorianCalendar();
	Calendar fechaRegistro=new GregorianCalendar();
	
	private String cadena="1234567";
	private String cero="0";
	SimpleDateFormat DF1 = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat DF2 = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat DF3 = new SimpleDateFormat("hh:mm");
	private Integer estadoEjecutando=2;
	private Integer estadoEjecutado=3;
	private Integer estadoNoEjecutado=4;
	
   public static ProgramacionBeanFunction getInstanceS(){
       if(ProgramaFuncion==null) ProgramaFuncion= new ProgramacionBeanFunction();
       
       return ProgramaFuncion;
   }
   private ProgramacionBeanFunction() {}
   
   //Creamos una programacion
   public ProgramacionBeanData crearProgramacion(HttpServletRequest request, HttpServletResponse response){
		ProgramacionBeanData prograData= new ProgramacionBeanData();
		String nueva="";

		try{
			
		prograData.setIdProceso(Integer.parseInt(request.getParameter("codigo")));
		prograData.setDescripcion(request.getParameter("txtNombre"));
		prograData.setOcurrencia(Integer.parseInt(request.getParameter("txtNroOcurr")));
		prograData.setIdOcurrencia(Integer.parseInt(request.getParameter("cmbOcurrencia")));
		Date fechaInicio=new Date(DF1.parse(request.getParameter("fcCreacion")).getTime());
		prograData.setFechaInicio(fechaInicio);
		prograData.setProxFechaEjecucion(fechaInicio);
		
		Date fechaFin=new Date(DF2.parse(request.getParameter("fcFin")).getTime());
		prograData.setFechaFin(fechaFin);
			
		Time horaEjecucion=new Time(DF3.parse((request.getParameter("hora"))).getTime());
		prograData.setHora(horaEjecucion);
		
		String[] valores = request.getParameterValues("chboxFecha");
		
		if(valores!=null){
			for(int i=0;i<valores.length;i++){
				String car =valores[i].substring(0, 1);
			
				nueva=cadena.replace(car,cero);
				cadena=nueva;
			}
		}
		//los que tienen cero,son los que tienen dia programado
		prograData.setDias(nueva);
		prograData.setEstado(1);//se crea como pendiente
		
		}catch(Exception e){
			e.printStackTrace();			
		}
		return prograData;		
	} 
   
   //Agregar una programacion
	public synchronized boolean agregarProgramacion(ProgramacionBeanData prograData) throws CoException {
		boolean resultado=false;		
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{			
			//se llama  la funcion creada en proceso_mapper, usando el namespace.funcion
			Integer codigo= sqlsesion.selectOne("Data.mappers.programacion.sacarCodigo");
			
			if(codigo!=null){
				int cod= codigo + 1;
				prograData.setCodigo(cod);
			}			
			else prograData.setCodigo(1);
							
			sqlsesion.insert("Data.mappers.programacion.insertarProgramacion",prograData);
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
	
	
	
	public synchronized boolean agregarProgramacionHistorica(ProgramacionHistoricoBeanData programacionHistoricaData) throws CoException {
		boolean resultado=false;		
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			
			//se llama  la funcion creada en proceso_mapper, usando el namespace.funcion
			Integer codigo= sqlsesion.selectOne("Data.mappers.programacion.sacarCodigoHistorico");
			
			if(codigo!=null){

				int cod= codigo + 1;
				programacionHistoricaData.setIdHistoricoProgramacion(cod);
			}
			
			else programacionHistoricaData.setIdHistoricoProgramacion(1);
							
			sqlsesion.insert("Data.mappers.programacion.insertarProgramacionHistorico",programacionHistoricaData);
			sqlsesion.update("Data.mappers.programacion.actualizaActivoxProgramacion",programacionHistoricaData);
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
	
	
	public ProgramacionBeanData crearProgramacionModificar(HttpServletRequest request, HttpServletResponse response,Integer estado){
		ProgramacionBeanData programacionData= new ProgramacionBeanData();
		try{		
		
		if(estado==1) programacionData.setEstado(estadoEjecutando);
		if(estado==2) programacionData.setEstado(estadoEjecutado);
		/*if(estado==1 && (idOcurrencia==4||idOcurrencia==1))
			programacionData.setEstado(estadoEjecutando);
		
		if(estado==2 && (idOcurrencia==4))
			programacionData.setEstado(estadoEjecutado);
		
		if(estado==2 && (idOcurrencia==1))
			programacionData.setEstado(estadoPendiente);*/
		
		
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return programacionData;		
	}
	
	
	public ProgramacionHistoricoBeanData crearProgramacionHistorica(HttpServletRequest request, HttpServletResponse response){
		ProgramacionHistoricoBeanData programacionData= new ProgramacionHistoricoBeanData();
		try{		
		
		//PERSONAL QUE AUTORIZA	
		programacionData.setIdPersonalResponsable(Integer.parseInt(request.getParameter("idPersonalAutorizo")));
		
		//PERSONAL QUE DA MANTENIMIENTO
		programacionData.setIdPersonalEjecutor(Integer.parseInt(request.getParameter("idPersonalMantenimiento")));
		
		programacionData.setIdProveedor(Integer.parseInt(request.getParameter("idProveedor")));
		
		Date date = new Date(); 
		String fecha = DF1.format(date);
		Date fechaRegistro= DF1.parse(fecha); 
		programacionData.setFechaRegistro((fechaRegistro));
		
		programacionData.setCondicionesEquipo(request.getParameter("txtCondicionesEquipo"));
		programacionData.setHorasHombre(request.getParameter("txtHorasHombre"));
		
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return programacionData;		
	}
	public synchronized void ejecutarProgramacion(ProgramacionBeanData programacionData,String user) throws CoException {
		
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			int IdUser = sqlsesion.selectOne("Data.mappers.programacion.buscaIdUsuario",user);
			programacionData.setIdUsuarioEjecutor(IdUser);
			sqlsesion.update("Data.mappers.programacion.historicoProgramacion",programacionData);
			int IdProxSubproceso= sqlsesion.selectOne("Data.mappers.programacion.sacarProxSubproceso",programacionData);
			programacionData.setIdSubproceso(IdProxSubproceso);
			int OrdenSubproceso= sqlsesion.selectOne("Data.mappers.programacion.ordenSubproceso",programacionData);
			int IdSubprocesoPadre= sqlsesion.selectOne("Data.mappers.programacion.idSubprocesoPadre",programacionData);			
			if(IdSubprocesoPadre==0)
				if(OrdenSubproceso==1){
					//En caso se termine el ciclo de ejecuciÃ³n
					sqlsesion.update("Data.mappers.programacion.siguienteProgramacionCiclo",programacionData);
					sqlsesion.update("Data.mappers.programacion.validaFechaFin",programacionData);
					sqlsesion.update("Data.mappers.programacion.reiniciaActivoxProgramacion",programacionData);
				}else {
					sqlsesion.update("Data.mappers.programacion.siguienteProgramacion",programacionData);
				}
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
	
	public synchronized void modificarProgramacion(ProgramacionBeanData programacionData) throws CoException {
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{					
			sqlsesion.update("Data.mappers.programacion.modificarProgramacion",programacionData);
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
	
	
	public synchronized void modificarReprogramacion(ProgramacionBeanData programacionData) throws CoException {
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{					
			sqlsesion.update("Data.mappers.programacion.modificarReprogramacion",programacionData);
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
	
	
	
	public ProgramacionBeanData crearReProgramacionModificar(HttpServletRequest request, HttpServletResponse response){
		ProgramacionBeanData programacionData= new ProgramacionBeanData();
		try{
			Time horaEjecucion=new Time(DF3.parse((request.getParameter("hora"))).getTime());
			programacionData.setHora(horaEjecucion);
			
			Date fechaInicio=new Date(DF1.parse(request.getParameter("fcReProgramacion")).getTime());
			programacionData.setProxFechaEjecucion(fechaInicio);				

		}catch(Exception e){
			e.printStackTrace();			
		}
		return programacionData;		
	}
	
	
	
	public synchronized void modificarProgramacionOpcional(ProgramacionBeanData programacionData) throws CoException {
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
					
			sqlsesion.update("Data.mappers.programacion.modificarProgramacionOpcional",programacionData);
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
	
	
	public synchronized void modificarNoEjecutada(Vector<ResultadoProgramacionBeanData> resultados) throws CoException {
	
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			for(int i=0;i<resultados.size();i++){
				ResultadoProgramacionBeanData programacionData=resultados.get(i);
				programacionData.setEstado(estadoNoEjecutado);
				sqlsesion.update("Data.mappers.programacion.modificarProgramacionNoEjecutada",programacionData);
			}
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
	
	
	public synchronized Vector<ResultadoPersonalBeanData> buscarPlantillaPersonalEjecutor(Vector<ProgramacionHistoricoBeanData> resultadosEjecutado){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoPersonalBeanData> resultadosV=new Vector<ResultadoPersonalBeanData>();
					
		try{		
			
			for(int i=0;i<resultadosEjecutado.size();i++){
				
				ProgramacionHistoricoBeanData programacionData=resultadosEjecutado.get(i);
				Integer idPersonalEjecutor=programacionData.getIdPersonalEjecutor();
				ResultadoPersonalBeanData resultados=sqlsesion.selectOne("Data.mappers.programacion.buscarPersonalID",idPersonalEjecutor);
				resultadosV.add(resultados);
			}
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	
	
	public synchronized Vector<ResultadoPersonalBeanData> buscarPlantillaPersonalResponsable(Vector<ProgramacionHistoricoBeanData> resultadosEjecutado){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoPersonalBeanData> resultadosV=new Vector<ResultadoPersonalBeanData>();
					
		try{		
			
			for(int i=0;i<resultadosEjecutado.size();i++){
				
				ProgramacionHistoricoBeanData programacionData=resultadosEjecutado.get(i);
				Integer idPersonalEjecutor=programacionData.getIdPersonalResponsable();
				ResultadoPersonalBeanData resultados=sqlsesion.selectOne("Data.mappers.programacion.buscarPersonalID",idPersonalEjecutor);
				resultadosV.add(resultados);
			}
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	
	public synchronized Vector<ResultadoActivoBeanData> buscarPlantillaActivoHistorico(Vector<ProgramacionHistoricoBeanData> resultadosEjecutado){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoActivoBeanData> resultadosV=new Vector<ResultadoActivoBeanData>();
					
		try{		
			
			for(int i=0;i<resultadosEjecutado.size();i++){
				
				ProgramacionHistoricoBeanData programacionData=resultadosEjecutado.get(i);
				Integer idActivo=programacionData.getIdActivo();
				ResultadoActivoBeanData resultados=sqlsesion.selectOne("Data.mappers.programacion.buscarActivo",idActivo);
				resultadosV.add(resultados);
			}
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	
	
	public synchronized Vector<ResultadoProgramacionBeanData> buscarPlantillaActividadesProgramacion(Integer codigoProgramacion){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProgramacionBeanData> resultadosV=null;
					
		try{		
			List<ResultadoProgramacionBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarActividadesProgramacion",codigoProgramacion);
			resultadosV= new Vector<ResultadoProgramacionBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	public synchronized Vector<ResultadoProgramacionBeanData> buscarPlantillaActivoProgramacion(Integer codigoProgramacion){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProgramacionBeanData> resultadosV=null;
					
		try{		
			List<ResultadoProgramacionBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarActivoProgramacion",codigoProgramacion);
			resultadosV= new Vector<ResultadoProgramacionBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	public synchronized Vector<ResultadoProgramacionBeanData> buscarPlantillaProgramacionEjecuntado(Integer estado){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProgramacionBeanData> resultadosV=null;
		
		try{		
			List<ResultadoProgramacionBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarProgramacionEnEjecucion",estado);
			resultadosV= new Vector<ResultadoProgramacionBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		return resultadosV;
		
	}	
	public synchronized Vector<ResultadoProgramacionBeanData> buscarPlantillaProgramacionEjecutadas(Integer estado){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProgramacionBeanData> resultadosV=null;
		
		try{		
			List<ResultadoProgramacionBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarProgramacionEjecutadas");
			resultadosV= new Vector<ResultadoProgramacionBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		return resultadosV;
		
	}
	public synchronized Vector<ResultadoProgramacionBeanData> buscarPlantillaProgramacionPendiente(Integer estado){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProgramacionBeanData> resultadosV=null;
		
		try{		
			List<ResultadoProgramacionBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarProgramacionPendientes",estado);
			resultadosV= new Vector<ResultadoProgramacionBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		return resultadosV;
		
	}
	
	
	public synchronized Vector<ResultadoProgramacionBeanData> buscarPlantillaProgramacionNoEjecutados(Integer estado){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProgramacionBeanData> resultadosV=null;
		
		try{		
			List<ResultadoProgramacionBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarProgramacionNoEjecutadas",estado);
			
			resultadosV= new Vector<ResultadoProgramacionBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		return resultadosV;
		
	}
	public synchronized Vector<ResultadoProgramacionBeanData> buscarPlantillaProgramacionEjecutados(Integer estado){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProgramacionBeanData> resultadosV=null;
		
		try{		
			List<ResultadoProgramacionBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarProgramacionEjecutadas",estado);
			
			resultadosV= new Vector<ResultadoProgramacionBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		return resultadosV;
		
	}
	public synchronized Vector<ResultadoProgramacionBeanData> buscarPlantillaProgramacionEjecutadosID(Integer codigo){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProgramacionBeanData> resultadosV=null;
		
		try{		
			List<ResultadoProgramacionBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarProgramacionEjecutadasID",codigo);
			
			resultadosV= new Vector<ResultadoProgramacionBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		return resultadosV;
		
	}

	public Integer existeEjecucion(Vector<ProgramacionHistoricoBeanData> resultadosHistorico,GregorianCalendar fechaActual,GregorianCalendar fechaAAux){
	
	Integer existe=0;
	
	if(resultadosHistorico!=null){		
		
		for(int j=0;j<resultadosHistorico.size();j++){
		
			fechaRegistro.setTime(resultadosHistorico.get(j).getFechaRegistro());
			//fechaRegistro.add(Calendar.DATE, 1);
		
			if(fechaActual.before(fechaRegistro) && fechaAAux.after(fechaRegistro)) {
				existe=1;
				break;
			}
		}
	}
	return existe;
	}
	
	
	public synchronized Vector<ResultadoProgramacionBeanData> buscarPlantillaProgramacion(Integer estado){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoProgramacionBeanData> resultadosV=null;
		
		try{		
			List<ResultadoProgramacionBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarProgramacionEstado",estado);
	
			resultadosV= new Vector<ResultadoProgramacionBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	
	
	
	
	
	public synchronized ProgramacionBeanData buscarPlantillaProgramacionId(Integer idProgramacion){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		ProgramacionBeanData resultados=null;
					
		try{		
			resultados=sqlsesion.selectOne("Data.mappers.programacion.buscarProgramacionId",idProgramacion);

		}
		finally{
			sqlsesion.close();
		}
		
		return resultados;
		
	}
	
	
	public synchronized Vector<ProgramacionHistoricoBeanData> buscarPlantillaProgramacionHistoricaId(Integer idProgramacion){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ProgramacionHistoricoBeanData> resultadosV=new Vector<ProgramacionHistoricoBeanData>();
					
		try{		
			List<ProgramacionHistoricoBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarProgramacionHistoricoId",idProgramacion);
			resultadosV= new Vector<ProgramacionHistoricoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	
	public synchronized Vector<ProgramacionHistoricoBeanData> buscarPlantillaProgramacionesHistoricas(Integer idProgramacion){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ProgramacionHistoricoBeanData> resultadosV=new Vector<ProgramacionHistoricoBeanData>();
					
		try{		
			List<ProgramacionHistoricoBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarProgramacionesHistoricas",idProgramacion);
			resultadosV= new Vector<ProgramacionHistoricoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	
	public synchronized Vector<ResultadoActividadBeanData> buscarPlantillaActividades(Vector<ResultadoProgramacionBeanData> vector){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoActividadBeanData> resultadosV=new Vector<ResultadoActividadBeanData>();
					
		try{
			
			for(int i=0;i<vector.size();i++){
				Integer codigo=vector.get(i).getIdActividad();
				ResultadoActividadBeanData resultados=sqlsesion.selectOne("Data.mappers.programacion.buscarActividad",codigo);
				resultadosV.add(resultados);
			}
			
			//resultadosV= new Vector<>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	
	public synchronized Vector<ResultadoActivoBeanData> buscarPlantillaActivos(Integer codigo){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ResultadoActivoBeanData> resultadosV=new Vector<ResultadoActivoBeanData>();
					
		try{
			List<ResultadoActivoBeanData> resultados=sqlsesion.selectList("Data.mappers.programacion.buscarActivoxProgramación",codigo);
			
			resultadosV= new Vector<ResultadoActivoBeanData>(resultados);
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	
	
	public synchronized Vector<LocalBeanData> buscarPlantillaLocales(Vector<ResultadoActivoBeanData> vector){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<LocalBeanData> resultadosV=new Vector<LocalBeanData>();
					
		try{
			
			for(int i=0;i<vector.size();i++){
				Integer codigo=vector.get(i).getIdLocal();
				LocalBeanData resultados=sqlsesion.selectOne("Data.mappers.activo.buscarUnLocal",codigo);
				resultadosV.add(resultados);
			}

		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
		
	}
	
	
	public synchronized Vector<MarcaBeanData> buscarPlantillaMarcas(Vector<ResultadoActivoBeanData> vector){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<MarcaBeanData> resultadosV=new Vector<MarcaBeanData>();
					
		try{
			
			for(int i=0;i<vector.size();i++){
				Integer codigo=vector.get(i).getIdMarca();
				MarcaBeanData resultados=sqlsesion.selectOne("Data.mappers.activo.buscarUnaMarca",codigo);
				resultadosV.add(resultados);
			}

		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;
	}
	
	public synchronized Vector<ProveedorBeanData> buscarPlantillaProveedores(Vector<ResultadoActivoBeanData> vector){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<ProveedorBeanData> resultadosV=new Vector<ProveedorBeanData>();
					
		try{			
			for(int i=0;i<vector.size();i++){
				Integer codigo=vector.get(i).getIdProveedor();
				ProveedorBeanData resultados=sqlsesion.selectOne("Data.mappers.activo.buscarUnProveedor",codigo);
				resultadosV.add(resultados);
			}
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;		
	}
	
	
	//Verificaba si tenia una OTM ya ejecutada para determinado activo
	public synchronized Vector<Integer> verificarActivoHistorico(Vector<ResultadoActivoBeanData> vector){
		
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<Integer> resultadosV=new Vector<Integer>();
					
		try{			
			for(int i=0;i<vector.size();i++){
				Integer codigo=vector.get(i).getCodigo();
				ProgramacionHistoricoBeanData resultados=sqlsesion.selectOne("Data.mappers.activo.buscarProgramacionHistoricoIdActivo",codigo);
				
				if(resultados!=null)
					resultadosV.add(1);
				else
					resultadosV.add(0);
			}
		}
		finally{
			sqlsesion.close();
		}
		
		return resultadosV;		
	}
}
