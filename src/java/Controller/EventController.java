package Controller;

import DAO.EventDAO;
import DAOImpl.EventDAOImpl;
import Model.Event;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class EventController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String cmd = request.getParameter("action");

        if (cmd != null) {
            switch (cmd) {
                case "saveEvent":
                    saveEvent(request, response);
                    break;

                case "update":
                    updateEvent(request, response);
                    break;
                    
                case "delete":
                    deleteEvent(request, response);
                    break;
                   
                case "launch":
                    launchEvent(request, response);
                    break;
                
                case "close":
                    closeEvent(request, response);
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
            Logger.getLogger(EventController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EventController.class.getName()).log(Level.SEVERE, null, ex);
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

    private void saveEvent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        //Get all parameters from EventForm.jsp
        String eventName = request.getParameter("eventName");
        String organizedBy = request.getParameter("organizedBy");
        String eventLocation = request.getParameter("eventLocation");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String eventDesc = request.getParameter("eventDesc");
        String userid = request.getParameter("userid");
        String organizationid = request.getParameter("organization");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEE MMM d yyyy", Locale.ENGLISH);
        LocalDate startDateTime = LocalDate.parse(startDate, formatter);
        LocalDate endDateTime = LocalDate.parse(endDate, formatter);

        //Initialize object from model
        Event event = new Event();

        //Set object value based on parameters passed
        event.setEventName(eventName);
        event.setOrganizedBy(organizedBy);
        event.setEventLocation(eventLocation);
        event.setStartDate(Date.valueOf(startDateTime));
        event.setEndDate(Date.valueOf(endDateTime));
        event.setEventDesc(eventDesc);
        event.setUserid(Integer.parseInt(userid));
        event.setOrganizationid(Integer.parseInt(organizationid));

        EventDAO eventDAO = new EventDAOImpl();
        eventDAO.addEvent(event);

        request.setAttribute("event", event);
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/Dashboard.jsp");
    }

    private void updateEvent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {

        String eventid = request.getParameter("eventid");
        String eventName = request.getParameter("eventName");
        String organizedBy = request.getParameter("organizedBy");
        String eventLocation = request.getParameter("eventLocation");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String eventDesc = request.getParameter("eventDesc");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEE MMM d yyyy", Locale.ENGLISH);
        LocalDate startDateTime = LocalDate.parse(startDate, formatter);
        LocalDate endDateTime = LocalDate.parse(endDate, formatter);

        Event event = new Event();

        event.setEventid(Integer.parseInt(eventid));
        event.setEventName(eventName);
        event.setOrganizedBy(organizedBy);
        event.setEventLocation(eventLocation);
        event.setStartDate(Date.valueOf(startDateTime));
        event.setEndDate(Date.valueOf(endDateTime));
        event.setEventDesc(eventDesc);
        
        EventDAO eventDAO = new EventDAOImpl();
        eventDAO.update(event);

        request.setAttribute("event", event);
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/EventDetails.jsp?id=" + event.getEventid());
    }

    private void deleteEvent(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        
        int id = Integer.parseInt(request.getParameter("eventid"));
        
        Event event = new Event();
        
        event.setEventid(id);
        
        EventDAO eventDAO = new EventDAOImpl();
        
        eventDAO.delete(event);
        
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/Dashboard.jsp");
    }

    private void launchEvent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        
        int eventid = Integer.parseInt(request.getParameter("eventid"));
        
        EventDAO eventDAO = new EventDAOImpl();
        Event event = eventDAO.retrieveEventByEventId(eventid);
        
        eventDAO.launchEvent(event);
        
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/Dashboard.jsp");
    }

    private void closeEvent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int eventid = Integer.parseInt(request.getParameter("eventid"));
        
        EventDAO eventDAO = new EventDAOImpl();
        Event event = eventDAO.retrieveEventByEventId(eventid);
        
        eventDAO.closeEvent(event);
        
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/Dashboard.jsp");
    }

}
