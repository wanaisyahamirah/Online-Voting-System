package Controller;

import DAO.ResultDAO;
import DAOImpl.ResultDAOImpl;
import Model.Result;
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
public class ResultController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String cmd = request.getParameter("action");

        if (cmd != null) {
            switch (cmd) {
                case "saveVote":
                    saveVote(request, response);
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
            Logger.getLogger(ResultController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ResultController.class.getName()).log(Level.SEVERE, null, ex);
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

    private void saveVote(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {

        //Get all parameters from SelectVote.jsp
        int userid = Integer.parseInt(request.getParameter("userid"));
        int counter = Integer.parseInt(request.getParameter("counter"));
        int eventid = Integer.parseInt(request.getParameter("eventid"));

        int pollEventItem[] = new int[counter];

        for (int i = 0; i < counter; i++) {
            pollEventItem[i] = Integer.parseInt(request.getParameter("pollItem" + (i+1)));
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");

        // 2018-08-03 03:50:17
        String dateTime = LocalDateTime.now().format(formatter);

        for (int i = 0; i < counter; i++) {
            Result result = new Result(userid, pollEventItem[i], eventid, dateTime);
            ResultDAO resultDAO = new ResultDAOImpl();
            resultDAO.saveResult(result);
        }

        response.sendRedirect(request.getContextPath() + "/VOTER/ThankYouVote.jsp?eventid=" +eventid);
    }

}
