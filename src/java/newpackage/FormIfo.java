/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rjg
 */
public class FormIfo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        //获取从客户端传递进来的信息
        HttpSession session=request.getSession(true);
            int i=Integer.parseInt(request.getParameter("i"));
            String[][]  data  =  (String[][])session.getAttribute("table_number"); 
            String username=(String)session.getAttribute("user");
            String date=(String)session.getAttribute("date");
            String time=(String)session.getAttribute("time");
            String reason=request.getParameter("reason");
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
             out.println("<center>");
            try{
           Test DBconnect =new Test();
           ResultSet Re=null;
           
             String Prestr="select *from subscrible where number = '"+data[i][0]+"' and date = '"+date+"' and time = '"+time+"'";
           
             String str="insert into subscrible ( number,name,time,date,reason ) values ('"+data[i][0]+"','"+username+"','"+time+"','"+date+"' , '"+reason+"')";
             
             Re=DBconnect.exeQ(Prestr);
             
             if(Re.next())
             {
                 out.print("学习间已经被预约,请选择其他学习间,<a href=\"/LearningRoom/FrotPage/index1.jsp\">返回</a>");
             }
             else
             {
                     int n=DBconnect.exeU(str);
                     if(n!=0)
                     {

                         out.print("预约成功,<a href=\"/LearningRoom/FrotPage/index1.jsp\">返回</a>");
                     }
                     else
                     {
                         out.print("预约失败,<a href=\"/LearningRoom/FrotPage/index1.jsp\">返回</a>");
                     }
             }
              out.println("</center>");
            out.println("</body>");
            out.println("</html>");
            }catch(Exception e)
            {
                 response.setStatus(400, "数据库异常，稍后再试");
                 e.printStackTrace();
            }
            
        }catch (Exception e) {
             response.setStatus(400, "数据库异常，稍后再试");
            e.printStackTrace();
            }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
