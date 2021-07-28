package Controller;

import DAO.PollDAO;
import DAOImpl.PollDAOImpl;
import Model.Poll;
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
public class PollController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String cmd = request.getParameter("action");

        if (cmd != null) {
            switch (cmd) {
                case "savePoll":
                    savePoll(request, response);
                    break;
                case "updatePoll":
                    updatePoll(request, response);
                    break;
                case "deletePoll":
                    deletePoll(request, response);
                    break;
                 case "launch":
                    launchPoll(request, response);
                    break;
                
                case "close":
                    closePoll(request, response);
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
            Logger.getLogger(PollController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PollController.class.getName()).log(Level.SEVERE, null, ex);
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

    private void savePoll(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {

        //Get all parameters from PollFormMain.jsp
        int userid = Integer.parseInt(request.getParameter("userid"));
        String pollName = request.getParameter("pollName");
        String pollDesc = request.getParameter("pollDesc");

        //Initialize object from model
        Poll poll = new Poll();

        //Set object value based on parameters passed
        poll.setUserid(userid);
        poll.setPollName(pollName);
        poll.setPollDesc(pollDesc);

        PollDAO pollDAO = new PollDAOImpl();
        pollDAO.addPoll(poll);

        request.setAttribute("poll", poll);
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/Dashboard.jsp?");
    }

    private void updatePoll(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {

        int pollid = Integer.parseInt(request.getParameter("pollid"));
        String pollName = request.getParameter("pollName");
        String pollDesc = request.getParameter("pollDesc");

        Poll poll = new Poll();

        poll.setPollid(pollid);
        poll.setPollName(pollName);
        poll.setPollDesc(pollDesc);

        PollDAO pollDAO = new PollDAOImpl();
        pollDAO.update(poll);

        request.setAttribute("poll", poll);
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/PollDetails.jsp?pollid=" + pollid);
    }

    private void deletePoll(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        
        int pollid = Integer.parseInt(request.getParameter("pollid"));
        
        Poll poll = new Poll();
        
        poll.setPollid(pollid);
        
        PollDAO PollDAO = new PollDAOImpl();
        PollDAO.delete(poll);

        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/Dashboard.jsp");
    }

    private void launchPoll(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int pollid = Integer.parseInt(request.getParameter("pollid"));
        
        PollDAO pollDAO = new PollDAOImpl();
        Poll poll = pollDAO.retrievePollByPollId(pollid);
        
        pollDAO.launchPoll(poll);
        
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/Dashboard.jsp");
    }

    private void closePoll(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int pollid = Integer.parseInt(request.getParameter("pollid"));
        
        PollDAO pollDAO = new PollDAOImpl();
        Poll poll = pollDAO.retrievePollByPollId(pollid);
        
        pollDAO.closePoll(poll);
        
        response.sendRedirect(request.getContextPath() + "/VOTING MANAGER/Dashboard.jsp");
    }

}
