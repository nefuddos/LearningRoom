/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Room;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import newpackage.Test;
/**
 *
 * @author rjg
 */
public class OrderSelect extends HttpServlet {

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
        
          HttpSession session=request.getSession(true);
         int i=Integer.parseInt(request.getParameter("i"));
            String[][]  data  =  (String[][])session.getAttribute("Room_table");
           int flag=Integer.parseInt(request.getParameter("params")); 
            String number=data[i][0];
            String name=data[i][1];
            String date=data[i][2];
            String time=data[i][3];
            String str;
          
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if(flag==1)
            str="update subscrible set flag = 1 where ( number = '"+number+"' and name = '"+name+"' and date = '"+date+"' and time = '"+time+"' )";
            else
            str="update subscrible set flag = 2 where ( number = '"+number+"' and name = '"+name+"' and date = '"+date+"' and time = '"+time+"' )";
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderSelect</title>");            
            out.println("</head>");
            out.println("<body>");
             out.println("<center>");
             try{
           Test DBconnect2 =new Test();
           int n=DBconnect2.exeU(str);
           if(n==0)
           {
               out.println("操作失败");
               
           }
           else
           {
               out.println("操作成功");
           }
            out.println("<a href=\"/LearningRoom/manage/index.jsp\">返回</a>");
            DBconnect2.closeCL();
            DBconnect2.closeSM();
           
            }catch(Exception e)
            {
                 response.setStatus(400, "数据库异常，稍后再试");
                 e.printStackTrace();
            }
            out.println("</center>");
            out.println("</body>");
            out.println("</html>");
        }
          catch (Exception e) {
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
