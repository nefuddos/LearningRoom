/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package newpackage;

/**
 *
 * @author rjg
 */
import java.sql.*;

import javax.naming.Context;
import javax.sql.DataSource;
import javax.naming.InitialContext;
public class Test
{
 //   String dri="com.mysql.jdbc.Driver";
 //   String dri="org.postgresql.Driver";
 //   String url="jdbc:postgresql://localhost:5432/room";
//    String user="manager";
//    String password="123456";
    Connection conn=null;
    Statement smt=null;
    ResultSet rs=null;
    DataSource ds=null;
    public Test()
    {

      try
       {
           
     // Driver driver = (Driver) Class.forName(dri).newInstance();
     // DriverManager.registerDriver(driver);
    //  conn=DriverManager.getConnection(url,user,password);
           Context initCtx=new InitialContext();
           Context envCtx=(Context)initCtx.lookup("java:comp/env");  
           ds=(DataSource)envCtx.lookup("jdbc/myDatasource_1");
           
       conn=ds.getConnection();
       smt=conn.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        System.out.print("数据源连接ok");
       }
       catch(Exception e)
       {
            e.printStackTrace();
           System.out.print("数据库连接错误");
       }
       
     }
    public int exeU(String sql)
    {
        int n=0;
        try
        {
        n=smt.executeUpdate(sql);
        }
        catch(Exception e)
       {
           e.printStackTrace();
           System.out.print("数据库更新错误");
           //e.printstacktrace();
       }
        return n;
     }
    public ResultSet exeQ(String sql)
    {
        try
        {
           rs= smt.executeQuery(sql);
        }
        catch(Exception e)
       {
            e.printStackTrace();
           System.out.print("数据库查询错误");
       }
        return rs;
    }
    
    
     public void closeRs()
    {
       try
       {
       rs.close();
       }
       catch(Exception e)
       {
            e.printStackTrace();
           System.out.print("数据库关闭RS错误");
       }
    }
       
        public void closeSM()
    {
       try
       {

       smt.close();
  
       }
       catch(Exception e)
       {
            e.printStackTrace();
           System.out.print("数据库关闭SM错误");
       }
    }
    
    public void closeCL()
    {
       try
       {
       conn.close();
       }
       catch(Exception e)
       {
            e.printStackTrace();
           System.out.print("数据库关闭CL错误");
       }
    }
    
}