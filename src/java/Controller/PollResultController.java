package Controller;

import DAO.PollResultDAO;
import DAOImpl.PollResultDAOImpl;
import Model.PollResult;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class PollResultController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String cmd = request.getParameter("action");

        if (cmd != null) {
            switch (cmd) {
                case "savePoll":
                    savePoll(request, response);
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
            Logger.getLogger(PollResultController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PollResultController.class.getName()).log(Level.SEVERE, null, ex);
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

        //Get all parameters from SelectVote.jsp
        int userid = Integer.parseInt(request.getParameter("userid"));
        int pollid = Integer.parseInt(request.getParameter("pollid"));
        int pollitem = Integer.parseInt(request.getParameter("pollItem"));

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");

        // 2018-08-03 03:50:17
        String dateTime = LocalDateTime.now().format(formatter);

        PollResult pollResult = new PollResult(userid, pollitem, pollid, dateTime);
        PollResultDAO pollResultDAO = new PollResultDAOImpl();
        pollResultDAO.saveResult(pollResult);

        response.sendRedirect(request.getContextPath() + "/VOTER/PollThankYouVote.jsp?pollid=" + pollid);
    }

}
