package Controller;

import DAO.DepartmentDAO;
import DAOImpl.DepartmentDAOImpl;
import Model.Department;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DepartmentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        String cmd = request.getParameter("action");

        if (cmd != null) {
            switch (cmd) {
                case "save":
                    saveDepartment(request, response);
                    break;
                
                case "update":
                    updateDepartment(request, response);
                    break;
                
                case "delete":
                    deleteDepartment(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/Dashboard.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentController.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    private void saveDepartment(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
       
        //Get all parameters from PollForm.jsp
        String organizationid = request.getParameter("organizationid");
        String departmentName = request.getParameter("departmentName");

        //Initialize object from model
        Department department = new Department();

        //Set object value based on parameters passed
        department.setOrganizationid(Integer.parseInt(organizationid));
        department.setDepartmentName(departmentName);

        DepartmentDAO departmentDAO = new DepartmentDAOImpl();
        departmentDAO.addDepartment(department);

        request.setAttribute("department", department);
        response.sendRedirect(request.getContextPath() + "/ADMIN/OrgDetails.jsp?id=" + Integer.parseInt(organizationid));
    }
    
    private void updateDepartment(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        
        String departmentid = request.getParameter("departmentid");
        String departmentName = request.getParameter("departmentName");

        Department department = new Department();

        department.setDepartmentid(Integer.parseInt(departmentid));
        department.setDepartmentName(departmentName);
        
        DepartmentDAO departmentDAO = new DepartmentDAOImpl();
        departmentDAO.update(department);

        request.setAttribute("department", department);
        response.sendRedirect(request.getContextPath() + "/ADMIN/DeptDetails.jsp?id=" + department.getDepartmentid());
    }
    
    private void deleteDepartment(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        
        int id = Integer.parseInt(request.getParameter("departmentid"));
        int organizationid = Integer.parseInt(request.getParameter("organizationid"));
        
        Department department = new Department();
        
        department.setDepartmentid(id);
        
        DepartmentDAO departmentDAO = new DepartmentDAOImpl();
        
        departmentDAO.delete(department);
        
        response.sendRedirect(request.getContextPath() + "/ADMIN/OrgDetails.jsp?id=" + organizationid);
    }

}
