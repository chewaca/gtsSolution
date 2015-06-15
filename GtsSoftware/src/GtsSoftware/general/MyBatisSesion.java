package GtsSoftware.general;

import java.io.InputStream;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisSesion {

	static SqlSessionFactory sqlSesionB=null;
	
	private MyBatisSesion(){}
	private MyBatisSesion(SqlSessionFactory sqlSesion){
		this.sqlSesionB=sqlSesion;
	}
	
	static public SqlSessionFactory metodo(){
		if (sqlSesionB!=null) return sqlSesionB;
		try{
			SqlSessionFactory sqlSesionB;
			String resource = "Data/config/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			sqlSesionB = builder.build(inputStream);
			return sqlSesionB;
			}
			catch(Exception e){
				System.out.println("error en conf");
				e.printStackTrace();
				
			}
		return sqlSesionB;
			
	}
	
}
