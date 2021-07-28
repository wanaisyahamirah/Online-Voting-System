/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.EventPollItemDAO;
import DAOImpl.EventPollItemDAOImpl;
import Model.EventPollItem;
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
public class EventPollItemController extends HttpServlet {

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

                case "deleteEventPollItem":
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
            processRequest(request, response);
        } catch (IllegalStateException ex) {
            Logger.getLogger(EventPollItemController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EventPollItemController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventPollItemController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (IllegalStateException ex) {
            Logger.getLogger(EventPollItemController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EventPollItemController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EventPollItemController.class.getName()).log(Level.SEVERE, null, ex);
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
        int eventid = Integer.parseInt(request.getParameter("eventid"));
        String pollItemName = request.getParameter("pollItemName");
        Part pollItemImage = request.getPart("pollItemImage");
        int polleventid = Integer.parseInt(request.getParameter("polleventid"));

        //keep data into javabeans
        EventPollItem eventPollItem = new EventPollItem();

        eventPollItem.setPollItemName(pollItemName);
        eventPollItem.setPollItemImage(pollItemImage);
        eventPollItem.setPolleventid(polleventid);

        //pass the bean to DAO
        EventPollItemDAO eventPollItemDAO = new EventPollItemDAOImpl();
        eventPollItemDAO.addEventPollItem(eventPollItem);

        request.setAttribute("eventPollItem", eventPollItem);

        //EventPollDetails.jsp?eventpollid=2&eventid=9
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/EventPollDetails.jsp?eventpollid=" + polleventid + "&eventid=" + eventid);
    }

    private void updatePollItem(HttpServletRequest request, HttpServletResponse response) throws IOException, IllegalStateException, ServletException, SQLException, ClassNotFoundException {

        int eventid = Integer.parseInt(request.getParameter("eventid"));
        String pollItemName = request.getParameter("pollItemName");
        Part pollItemImage = request.getPart("pollItemImage");
        int polleventid = Integer.parseInt(request.getParameter("polleventid"));
        int polleventitemid = Integer.parseInt(request.getParameter("polleventitemid"));

        EventPollItem eventPollItem = new EventPollItem();

        eventPollItem.setPolleventid(eventid);
        eventPollItem.setPollItemName(pollItemName);
        eventPollItem.setPollItemImage(pollItemImage);
        eventPollItem.setPolleventid(polleventid);
        eventPollItem.setPolleventitemid(polleventitemid);

        EventPollItemDAO eventPollItemDAO = new EventPollItemDAOImpl();
        eventPollItemDAO.updateEventPollItem(eventPollItem);

        request.setAttribute("eventPollItem", eventPollItem);

        //EventPollDetails.jsp?eventpollid=2&eventid=9
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/EventPollDetails.jsp?eventpollid=" + polleventid + "&eventid=" + eventid);
    }

    private void deleteEventPollItem(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ClassNotFoundException {
        
        int eventid = Integer.parseInt(request.getParameter("eventid"));
        int id = Integer.parseInt(request.getParameter("eventid"));
        int eventpollid = Integer.parseInt(request.getParameter("eventpollid"));
        int polleventitemid = Integer.parseInt(request.getParameter("polleventitemid"));
        
        EventPollItem eventPollItem = new EventPollItem();
        
        eventPollItem.setPolleventitemid(polleventitemid);
        
        EventPollItemDAO eventPollItemDAO = new EventPollItemDAOImpl();
        eventPollItemDAO.delete(eventPollItem);

        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/EventPollDetails.jsp?id=" + id +"&eventpollid=" + eventpollid +"&eventid=" + eventid);
    }

}
