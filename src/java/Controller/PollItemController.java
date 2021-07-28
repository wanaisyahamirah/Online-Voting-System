package Controller;

import DAO.PollItemDAO;
import DAOImpl.PollItemDAOImpl;
import Model.PollItem;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
@MultipartConfig(maxFileSize = 16177215)
public class PollItemController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IllegalStateException, SQLException, ClassNotFoundException {
        
        String cmd = request.getParameter("action");

        if (cmd != null) {
            switch (cmd) {
                case "savePollItem":
                    savePollItem(request, response);
                    break;

                case "updatePollItem":
                    updatePollItem(request, response);
                    break;

                case "deletePollItem":
                    deleteEventPollItem(request, response);
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
            try {
                processRequest(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(PollItemController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (IllegalStateException ex) {
            Logger.getLogger(PollItemController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PollItemController.class.getName()).log(Level.SEVERE, null, ex);
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
            try {
                processRequest(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(PollItemController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (IllegalStateException ex) {
            Logger.getLogger(PollItemController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PollItemController.class.getName()).log(Level.SEVERE, null, ex);
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

    private void savePollItem(HttpServletRequest request, HttpServletResponse response) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {
        
        //get all data from form
        String pollItemName = request.getParameter("pollItemName");
        Part pollItemImage = request.getPart("pollItemImage");
        int pollid = Integer.parseInt(request.getParameter("pollid"));

        //keep data into javabeans
        PollItem pollItem = new PollItem();

        pollItem.setPollItemName(pollItemName);
        pollItem.setPollItemImage(pollItemImage);
        pollItem.setPollid(pollid);

        //pass the bean to DAO
        PollItemDAO pollItemDAO = new PollItemDAOImpl();
        pollItemDAO.addPollItem(pollItem);

        request.setAttribute("pollItem", pollItem);

        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/PollDetails.jsp?pollid=" + pollid);
    }

    private void updatePollItem(HttpServletRequest request, HttpServletResponse response) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {
        
        String pollItemName = request.getParameter("pollItemName");
        Part pollItemImage = request.getPart("pollItemImage");
        int pollid = Integer.parseInt(request.getParameter("pollid"));
        int pollitemid = Integer.parseInt(request.getParameter("pollitemid"));

        PollItem pollItem = new PollItem();

        pollItem.setPollItemName(pollItemName);
        pollItem.setPollItemImage(pollItemImage);
        pollItem.setPollid(pollid);
        pollItem.setPollitemid(pollitemid);

        PollItemDAO pollItemDAO = new PollItemDAOImpl();
        pollItemDAO.update(pollItem);

        request.setAttribute("pollItem", pollItem);

        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/PollDetails.jsp?pollid=" + pollid);
    }

    private void deleteEventPollItem(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        
        int pollid = Integer.parseInt(request.getParameter("pollid"));
        int pollitemid = Integer.parseInt(request.getParameter("pollitemid"));
        
        PollItem pollItem = new PollItem();
        
        pollItem.setPollitemid(pollitemid);
        
        PollItemDAO pollItemDAO = new PollItemDAOImpl();
        pollItemDAO.delete(pollItem);

        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/PollDetails.jsp?pollid=" + pollid);
    }

}
