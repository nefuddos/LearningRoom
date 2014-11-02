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
public class StudentTest extends HttpServlet {

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
  
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           request.setCharacterEncoding("UTF-8");
           String user=request.getParameter("name");
            String passw=request.getParameter("passw");
            System.out.printf("user: "+user+"\n"+"passw: "+passw);
             try{
             Test DBconnect =new Test();
              ResultSet Re=null;
             String str="select *from student where name='"+user+"' and stunum='"+passw+"'";
            
             Re=DBconnect.exeQ(str);
           
             
             if(Re.next()==true)
             {
                 out.print("登录成功");
                 HttpSession session=request.getSession(true);
                 session.setAttribute("user", user);
                 session.setAttribute("passw", passw);
                 //session.setMaxInactiveInterval(5);
                 
                 response.setStatus(200);
                 //response.sendRedirect("/LearningRoom/FrotPage/jsp/newjsp.jsp");
                 
             }
             else
             {
                  out.println("用户名或则密码错误,错误用户和密码为："+user+" ; "+passw);
                  response.setStatus(404);
             }
             
             DBconnect.closeCL();
             DBconnect.closeRs();
             DBconnect.closeSM();
             }catch (Exception e) {
            e.printStackTrace();
            }
             
        }catch (Exception e) {
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
