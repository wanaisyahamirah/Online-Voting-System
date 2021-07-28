package Controller;

import DAO.EventPollDAO;
import DAOImpl.EventPollDAOImpl;
import Model.EventPoll;
import java.io.IOException;
import java.sql.SQLException;
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
public class EventPollController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String cmd = request.getParameter("action");

        if (cmd != null) {
            switch (cmd) {
                case "savePoll":
                    savePoll(request, response);
                    break;

                case "update":
                    updateEventPoll(request, response);
                    break;

                case "deleteEventPoll":
                    deleteEventPoll(request, response);
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
            Logger.getLogger(EventPollController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EventPollController.class.getName()).log(Level.SEVERE, null, ex);
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

    private void savePoll(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {

        //Get all parameters from PollForm.jsp
        String eventid = request.getParameter("eventid");
        String EventPollName = request.getParameter("pollName");
        String EventPollDesc = request.getParameter("pollDesc");
        String departmentid = request.getParameter("department");

        //Initialize object from model
        EventPoll eventPoll = new EventPoll();

        //Set object value based on parameters passed
        eventPoll.setEventid(Integer.parseInt(eventid));
        eventPoll.setPollEventName(EventPollName);
        eventPoll.setPollEventDesc(EventPollDesc);
        eventPoll.setDepartmentid(Integer.parseInt(departmentid));

        EventPollDAO eventPollDAO = new EventPollDAOImpl();
        eventPollDAO.addEventPoll(eventPoll);

        request.setAttribute("eventPoll", eventPoll);
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/EventDetails.jsp?id=" + Integer.parseInt(eventid));
    }

    private void updateEventPoll(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {

        int eventid = Integer.parseInt(request.getParameter("eventid"));
        String pollEventId = request.getParameter("pollEventId");
        String pollEventTitle = request.getParameter("pollEventTitle");
        String pollEventDesc = request.getParameter("pollEventDesc");
        String departmentId = request.getParameter("department");

        EventPoll eventPoll = new EventPoll();

        eventPoll.setPollEventId(Integer.parseInt(pollEventId));
        eventPoll.setPollEventName(pollEventTitle);
        eventPoll.setPollEventDesc(pollEventDesc);
        eventPoll.setDepartmentid(Integer.parseInt(departmentId));

        EventPollDAO eventPollDAO = new EventPollDAOImpl();
        eventPollDAO.update(eventPoll);

        request.setAttribute("eventPoll", eventPoll);
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/EventPollDetails.jsp?eventpollid=" + eventPoll.getPollEventId() + "&eventid=" + eventid);
    }

    private void deleteEventPoll(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        
        int eventid = Integer.parseInt(request.getParameter("eventid"));
        int eventpollid = Integer.parseInt(request.getParameter("eventpollid"));
        
        EventPoll eventPoll = new EventPoll();
        
        eventPoll.setPollEventId(eventpollid);
        
        EventPollDAO eventPollDAO = new EventPollDAOImpl();
        eventPollDAO.delete(eventPoll);

        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/EventDetails.jsp?id=" + eventid);
    }

}
