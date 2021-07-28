package Controller;

import DAO.ContactDAO;
import DAOImpl.ContactDAOImpl;
import Model.Contact;
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

/**
 *
 * @author Hp
 */
public class ContactController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        String cmd = request.getParameter("command");
        
        if (cmd != null){
            switch(cmd){
                case "sendEmail":
                    saveEmail(request, response);
                    break;
                    
                case "retrieve":
                    listContact(request, response);
                    break;
                    
                case "update":
                    updateContact(request, response);
                    break;
                
                case "delete":
                    deleteContact(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "GENERAL PAGES/LandingPage.jsp");
        }
    }
    
    private void saveEmail(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String description = req.getParameter("description");
        
        Contact contact = new Contact();
        
        contact.setFullname(fullname);
        contact.setEmail(email);
        contact.setSubject(subject);
        contact.setDescription(description);

        ContactDAO contactDAO = new ContactDAOImpl();
        contactDAO.save(contact);
        
        req.setAttribute("contact", contact);
        resp.sendRedirect("GENERAL PAGES/ContactPage.jsp");
    }
    
    private void listContact(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException, ServletException{
        
        ContactDAO contactDAO = new ContactDAOImpl();
        List <Contact> contactlist = contactDAO.selectAllContact();
        
        request.setAttribute("contactlist",contactlist);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ADMIN/Message.jsp");
        dispatcher.forward(request, response);
    }
    
    private void updateContact(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        
        int contactid = Integer.parseInt(request.getParameter("contactid"));
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String description = request.getParameter("description");
        
        Contact contact = new Contact();
        
        contact.setId(contactid);
        contact.setFullname(fullname);
        contact.setEmail(email);
        contact.setSubject(subject);
        contact.setDescription(description);
        
        ContactDAO contactDAO = new ContactDAOImpl();
        
        contactDAO.update(contact);
        
        request.setAttribute("contact", contact);
        response.sendRedirect("GENERAL PAGES/MessageDetails.jsp" + contact.getId());
        
    }

    private void deleteContact(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        
     int id = Integer.parseInt(request.getParameter("contactid"));
        
        Contact contact = new Contact();
        
        contact.setId(id);
        
        ContactDAO contactDAO = new ContactDAOImpl();
        
        contactDAO.delete(contact);
        
        response.sendRedirect(request.getContextPath() + "/ADMIN/Message.jsp");
        
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
            Logger.getLogger(ContactController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ContactController.class.getName()).log(Level.SEVERE, null, ex);
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

}
