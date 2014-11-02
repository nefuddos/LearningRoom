/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package newpackage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rjg
 */
public class login extends HttpServlet {

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
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
       
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        
           //获取表单中提取的用户名和密码   
            String user=request.getParameter("name");
            String passw=request.getParameter("passw");
          try{
             Test DBconnect =new Test();
              ResultSet Re=null;
             String str="select *from managertb where username=\'"+user+"\' and password=\'"+passw+"\'";
            
             Re=DBconnect.exeQ(str);
           
             
             if(Re.next()==true)
             {
                 
                 // response.sendRedirect("/LearningRoom/manage/index.jsp");
                 out.print("登录成功");
                  HttpSession session=request.getSession(true);
                 session.setAttribute("username", user);
                 session.setAttribute("password", passw);
                 response.setStatus(200);
             }
             else
             {
                  out.println("用户名或则密码错误");
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
