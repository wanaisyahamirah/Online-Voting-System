
package Controller;

import DAO.OrganizationDAO;
import DAOImpl.OrganizationDAOImpl;
import Model.Organization;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        String cmd = request.getParameter("command");
        
        if (cmd != null){
            switch(cmd){
                case "insert":
                    insertOrganization(request, response);
                    break;
                
                case "retrieve":
                    listOrganization(request, response);
                    break;
                    
                case "update":
                    updateOrganization(request, response);
                    break;
                
                case "delete":
                    deleteOrganization(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "GENERAL PAGES/LandingPage.jsp");
        }
    }
    
    private void insertOrganization(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        //get all data from signup
        String organizationName = req.getParameter("organizationName");
        String organizationEmail = req.getParameter("organizationEmail");
        String organizationAddr1 = req.getParameter("organizationAddr1");
        String organizationAddr2 = req.getParameter("organizationAddr2");
        String organizationCity = req.getParameter("organizationCity");
        String organizationState = req.getParameter("organizationState");
        String organizationZipCode = req.getParameter("organizationZipCode");
        
        //keep data into javabeans
        Organization newOrganization = new Organization();
        
        newOrganization.setOrganizationName(organizationName);
        newOrganization.setOrganizationEmail(organizationEmail);
        newOrganization.setOrganizationAddr1(organizationAddr1);
        newOrganization.setOrganizationAddr2(organizationAddr2);
        newOrganization.setOrganizationCity(organizationCity);
        newOrganization.setOrganizationState(organizationState);
        newOrganization.setOrganizationZipCode(organizationZipCode);
        
        //pass the bean to DAO
        OrganizationDAO organization = new OrganizationDAOImpl();
        organization.insert(newOrganization);
        
        //save the bean as attribute and pass to view
        req.setAttribute("orgDetails", newOrganization);
        resp.sendRedirect("ADMIN/Dashboard.jsp");
    }
    
    private void listOrganization(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException{
        
        OrganizationDAO OrgDAO = new OrganizationDAOImpl();
        List <Organization> organizationList = OrgDAO.selectAllOrganization();
        
        request.setAttribute("organizationList",organizationList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ADMIN/Dashboard.jsp");
        dispatcher.forward(request, response);
    }
    
    private void updateOrganization(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        
        int organizationid = Integer.parseInt(request.getParameter("organizationid"));
        String organizationName = request.getParameter("organizationName");
        String organizationEmail = request.getParameter("organizationEmail");
        String organizationAddr1 = request.getParameter("organizationAddr1");
        String organizationAddr2 = request.getParameter("organizationAddr2");
        String organizationCity = request.getParameter("organizationCity");
        String organizationState = request.getParameter("organizationState");
        String organizationZipCode = request.getParameter("organizationZipCode");
            
        Organization organization = new Organization();
        
        organization.setOrganizationId(organizationid);
        organization.setOrganizationName(organizationName);
        organization.setOrganizationEmail(organizationEmail);
        organization.setOrganizationAddr1(organizationAddr1);
        organization.setOrganizationAddr2(organizationAddr2);
        organization.setOrganizationCity(organizationCity);
        organization.setOrganizationState(organizationState);
        organization.setOrganizationZipCode(organizationZipCode);
        
        OrganizationDAO organizationDAO = new OrganizationDAOImpl();
        
        organizationDAO.update(organization);

        request.setAttribute("organization", organization);
        
        response.sendRedirect("ADMIN/OrgDetails.jsp?id=" + organization.getOrganizationId());
    }

    //<editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
            Logger.getLogger(vmController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(vmController.class.getName()).log(Level.SEVERE, null, ex);
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

    private void deleteOrganization(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        
     int id = Integer.parseInt(request.getParameter("organizationid"));
        
        Organization organization = new Organization();
        
        organization.setOrganizationId(id);
        
        OrganizationDAO organizationDAO = new OrganizationDAOImpl();
        
        organizationDAO.delete(organization);
        
        response.sendRedirect(request.getContextPath() + "/ADMIN/Dashboard.jsp");
        
    }

}
