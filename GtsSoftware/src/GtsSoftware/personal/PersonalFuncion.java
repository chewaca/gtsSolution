package GtsSoftware.personal;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import GtsSoftware.general.CoException;
import GtsSoftware.general.MyBatisSesion;
import GtsSoftware.programacion.ProgramacionBeanData;
import GtsSoftware.usuario.CriterioUsuarioBeanData;

public class PersonalFuncion {
	SimpleDateFormat DF = new SimpleDateFormat("dd/MM/yyyy");
	
	public PersonalData crear(HttpServletRequest request, HttpServletResponse response){
		PersonalData personalData = new PersonalData();
		personalData.setNombre(request.getParameter("txtNombre")+"%");
		personalData.setApPaterno(request.getParameter("txtApPaterno")+"%");
		personalData.setApMaterno(request.getParameter("txtApMaterno")+"%");
		String codigo = request.getParameter("txtCodigo");
		if (!codigo.equals(""))
			personalData.setCodigo(Integer.parseInt(codigo));
		else 
			personalData.setCodigo(0);
		Integer estado = Integer.parseInt(request.getParameter("cmbEstado"));
		Integer codigoArea = Integer.parseInt(request.getParameter("cmbxArea"));
		personalData.setIdArea(codigoArea);
		personalData.setEstado(estado);
		return personalData;
	}
	public diasnolaboralData crearDia(HttpServletRequest request, HttpServletResponse response){
		diasnolaboralData diaData = new diasnolaboralData();
		diaData.setNombre(request.getParameter("txtNombre"));
		diaData.setMotivo(request.getParameter("txtMotivo"));
		try{
		Date fecha = new Date(DF.parse(request.getParameter("fecha")).getTime());
		diaData.setFecha(fecha);
		}catch(Exception e){
			e.printStackTrace();
		}
		return diaData;
	}
	public CursoData crearCurso(HttpServletRequest request, HttpServletResponse response){
		CursoData cursoData = new CursoData();
		cursoData.setNombre(request.getParameter("txtNombre"));
		cursoData.setHorasAcademicas(Integer.parseInt(request.getParameter("txtHoraAcademicas")));
		cursoData.setDescripcion(request.getParameter("txtDescripcion"));
		Integer area = Integer.parseInt(request.getParameter("cmbxArea"));
		cursoData.setCodigoArea(area);
		return cursoData;
	}
	public AreaData crearAreaBuscar(HttpServletRequest request, HttpServletResponse response){
		AreaData areaData = new AreaData();
		areaData.setNombre(request.getParameter("txtNombre")+"%");
		String codigo = request.getParameter("txtCodigo");
		if (!codigo.equals(""))
			areaData.setCodigo(Integer.parseInt(codigo));
		else 
			areaData.setCodigo(0);
		Integer estado = Integer.parseInt(request.getParameter("cmbEstado"));
		areaData.setEstado(estado);
		return areaData;
	}
	public CursoData crearCursoBuscar(HttpServletRequest request, HttpServletResponse response){
		CursoData cursoData = new CursoData();
		cursoData.setNombre(request.getParameter("txtNombre")+"%");
		String codigo = request.getParameter("txtCodigo");
		if (!codigo.equals(""))
			cursoData.setCodigo(Integer.parseInt(codigo));
		else 
			cursoData.setCodigo(0);
		Integer estado = Integer.parseInt(request.getParameter("cmbEstado"));
		Integer area = Integer.parseInt(request.getParameter("cmbxArea"));
		cursoData.setCodigoArea(area);
		cursoData.setEstado(estado);
		return cursoData;
	}
	public CapacitacionData crearCapacitacionBuscar(HttpServletRequest request, HttpServletResponse response){
		CapacitacionData capaData = new CapacitacionData();
		capaData.setNombre(request.getParameter("txtNombre")+"%");
		String codigo = request.getParameter("txtCodigo");
		if (!codigo.equals(""))
			capaData.setCodigo(Integer.parseInt(codigo));
		else 
			capaData.setCodigo(0);
		Integer estado = Integer.parseInt(request.getParameter("cmbEstado"));
		Integer area = Integer.parseInt(request.getParameter("cmbxArea"));
		Integer curso = Integer.parseInt(request.getParameter("cmbxCurso"));
		capaData.setCodigoArea(area);
		capaData.setEstado(estado);
		capaData.setCodigoCurso(curso);
		return capaData;
	}
	public AreaData crearArea(HttpServletRequest request, HttpServletResponse response){
		AreaData areaData = new AreaData();
		areaData.setNombre(request.getParameter("txtNombre"));
		areaData.setDescripcion(request.getParameter("txtDescripcion"));
		areaData.setEstado(1);

		return areaData;
	}
	public PersonalData crearPersonal(HttpServletRequest request, HttpServletResponse response){
		PersonalData personalData = new PersonalData();
		try
		{
			personalData.setNombre(request.getParameter("txtNombre"));
			personalData.setApPaterno(request.getParameter("txtApPaterno"));
			personalData.setApMaterno(request.getParameter("txtApMaterno"));
			personalData.setDireccion(request.getParameter("txtDireccion"));
			personalData.setSexo(request.getParameter("cmbSexo"));
			Integer area = Integer.parseInt(request.getParameter("cmbxArea"));
			personalData.setIdArea(area);
			personalData.setDni(request.getParameter("txtDNI"));	
			Date fNacimiento = new Date(DF.parse(request.getParameter("fcNacimiento")).getTime());
			personalData.setFecNacimiento(fNacimiento);
			personalData.setCorreo(request.getParameter("txtCorreo"));
			personalData.setTelefono1(request.getParameter("txtTelefono1"));
			personalData.setTelefono2(request.getParameter("txtTelefono2"));
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return personalData;
	}
	
	public CapacitacionData crearCapacitacion(HttpServletRequest request, HttpServletResponse response){
		CapacitacionData capacitacionData = new CapacitacionData();
		try
		{
			capacitacionData.setNombre(request.getParameter("txtNombre"));
			capacitacionData.setDescripcion(request.getParameter("txtDescripcion"));
			Date fInicio = new Date(DF.parse(request.getParameter("fechaInicio")).getTime());
			Date fFin = new Date(DF.parse(request.getParameter("fechaFin")).getTime());
			Integer curso = Integer.parseInt(request.getParameter("cmbxCurso"));
			Integer area = Integer.parseInt(request.getParameter("cmbxArea"));
			capacitacionData.setFechaInicio(fInicio);
			capacitacionData.setFechaFin(fFin);
			capacitacionData.setCodigoArea(area);
			capacitacionData.setCodigoCurso(curso);
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return capacitacionData;
	}
	public synchronized Vector<PersonalData>  buscarPersonal(PersonalData personalData){
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<PersonalData> vPersonal = null;
		
		try
		{
			List<PersonalData> resultados= sqlsesion.selectList("Data.mappers.personal.buscarPersonal",personalData);
			vPersonal= new Vector<PersonalData>(resultados);
		}
		finally
		{
			sqlsesion.close();
		}
		
		return vPersonal;
	}

	public synchronized Vector<AreaData>  buscarArea(AreaData areaData){
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<AreaData> vArea = null;
		
		try
		{
			List<AreaData> resultados= sqlsesion.selectList("Data.mappers.personal.buscarArea",areaData);
			vArea= new Vector<AreaData>(resultados);
		}
		finally
		{
			sqlsesion.close();
		}
		
		return vArea;
	}
	public synchronized Vector<CapacitacionData>  buscarCapacitacion(CapacitacionData capaData){
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<CapacitacionData> vArea = null;
		try
		{
			List<CapacitacionData> resultados= sqlsesion.selectList("Data.mappers.personal.buscarCapacitacion",capaData);
			vArea= new Vector<CapacitacionData>(resultados);
		}
		finally
		{
			sqlsesion.close();
		}
		
		return vArea;
	}
	public synchronized Integer buscarCodigoRol(String user){
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Integer resultados=0;
		try
		{
			 resultados= sqlsesion.selectOne("Data.mappers.personal.codigoRol",user);
		}
		finally
		{
			sqlsesion.close();
		}
		
		return resultados;
	}
	public synchronized Vector<AreaData>  comboArea(){
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<AreaData> vArea = null;
		
		try
		{
			List<AreaData> resultados= sqlsesion.selectList("Data.mappers.personal.comboArea");
			vArea= new Vector<AreaData>(resultados);
		}
		finally
		{
			sqlsesion.close();
		}
		
		return vArea;
	}
	public synchronized Vector<CursoData>  comboCurso(){
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<CursoData> vArea = null;
		
		try
		{
			List<CursoData> resultados= sqlsesion.selectList("Data.mappers.personal.comboCurso");
			vArea= new Vector<CursoData>(resultados);
		}
		finally
		{
			sqlsesion.close();
		}
		
		return vArea;
	}
	public synchronized Vector<CursoData>  buscarCurso(CursoData cursoData){
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<CursoData> vArea = null;
		
		try
		{
			List<CursoData> resultados= sqlsesion.selectList("Data.mappers.personal.buscarCurso",cursoData);
			vArea= new Vector<CursoData>(resultados);
		}
		finally
		{
			sqlsesion.close();
		}
		
		return vArea;
	}
	public synchronized Vector<diasnolaboralData>  buscarDiasNoLaborables(){
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		Vector<diasnolaboralData> vArea = null;
		
		try
		{
			List<diasnolaboralData> resultados= sqlsesion.selectList("Data.mappers.personal.allDiasNoLaboral");
			vArea= new Vector<diasnolaboralData>(resultados);
		}
		finally
		{
			sqlsesion.close();
		}
		
		return vArea;
	}
	public synchronized PersonalData buscarPersonalUnico(PersonalData personalData){
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		PersonalData vPersonal = null;
		
		try
		{
			PersonalData resultados= sqlsesion.selectOne("Data.mappers.personal.buscarPersonalUnico",personalData);
			vPersonal= resultados;
		}
		finally
		{
			sqlsesion.close();
		}
		
		return vPersonal;
	}
	public synchronized boolean agregarPersonal(PersonalData personalData) throws CoException {
		boolean resultado=false;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			Integer codigo= sqlsesion.selectOne("Data.mappers.personal.sacarCodigo");
			if(codigo!=null){

				int cod= codigo + 1;
				personalData.setCodigo(cod);
			}
			
			else personalData.setCodigo(1);
			personalData.setEstado(1);
			sqlsesion.insert("Data.mappers.personal.insertarPersonal",personalData);
			
			resultado=true;
		}
		catch(Exception a){
			sqlsesion.rollback();
			a.printStackTrace();
		}
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}
		return resultado;
	}
	public synchronized boolean actualizarPersonal(PersonalData personalData) throws CoException {
		boolean resultado=false;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			sqlsesion.update("Data.mappers.personal.actualizarPersonal",personalData);
			
			resultado=true;
		}
		catch(Exception a){
			sqlsesion.rollback();
			a.printStackTrace();
		}
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}
		return resultado;
	}
	public synchronized boolean agregarArea(AreaData areaData) throws CoException {
		boolean resultado=false;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			Integer codigo= sqlsesion.selectOne("Data.mappers.personal.sacarCodigoArea");
			areaData.setCodigo(codigo);	
			areaData.setEstado(1);
			sqlsesion.insert("Data.mappers.personal.insertarArea",areaData);
			
			resultado=true;
		}
		catch(Exception a){
			sqlsesion.rollback();
			a.printStackTrace();
		}
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}
		return resultado;
	}
	public synchronized boolean agregarDia(diasnolaboralData diaData) throws CoException {
		boolean resultado=false;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			sqlsesion.insert("Data.mappers.personal.insertarDia",diaData);
			resultado=true;
		}
		catch(Exception a){
			sqlsesion.rollback();
			a.printStackTrace();
		}
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}
		return resultado;
	}
	public synchronized boolean agregarCurso(CursoData cursoData) throws CoException {
		boolean resultado=false;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			sqlsesion.insert("Data.mappers.personal.insertarCurso",cursoData);
			resultado=true;
		}
		catch(Exception a){
			sqlsesion.rollback();
			a.printStackTrace();
		}
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}
		return resultado;
	}
	public synchronized boolean agregarCapacitacion(CapacitacionData capacitacionData) throws CoException {
		boolean resultado=false;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			sqlsesion.insert("Data.mappers.personal.insertarCapacitacion",capacitacionData);
			resultado=true;
		}
		catch(Exception a){
			sqlsesion.rollback();
			a.printStackTrace();
		}
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}
		return resultado;
	}
	public synchronized boolean eliminarDia(Integer codigo) throws CoException {
		boolean resultado=false;
		SqlSession sqlsesion=MyBatisSesion.metodo().openSession();
		try{
			sqlsesion.delete("Data.mappers.personal.borrarDiaNoLaboral",codigo);
			resultado=true;
		}
		catch(Exception a){
			sqlsesion.rollback();
			a.printStackTrace();
		}
		finally{
			sqlsesion.commit();
			sqlsesion.close();	
		}
		return resultado;
	}
}
