package Controller;

import DAO.adminDAO;
import DAO.OrganizationDAO;
import DAOImpl.adminDAOImpl;
import Model.Admin;
import DAO.vmDAO;
import DAOImpl.OrganizationDAOImpl;
import DAOImpl.vmDAOImpl;
import Model.Organization;
import Model.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class vmController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        String cmd = request.getParameter("command");
        
        if (cmd != null){
            switch(cmd){
                case "sendOrgId":
                    passOrgId(request, response);
                    break;
                
                case "verify":
                    verifyEmail(request, response);
                    break;
                    
                case "signup":
                    saveUser(request, response);
                    break;
                
                case "signin":
                    retrieveUser(request, response);
                    break;
                    
                case "update":
                    updateUser(request, response);
                    break;
                    
                case "updateAdmin":
                    updateAdmin(request, response);
                    break;
                
                case "delete":
                    deleteUser(request, response);
                    break;
                    
                case "signout":
                    signOut(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "GENERAL PAGES/LandingPage.jsp");
        }
    }
    
    private void passOrgId(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        int organizationid = Integer.parseInt(req.getParameter("organization"));
        
        OrganizationDAO OrgDAO = new OrganizationDAOImpl();
        
        Organization organization = OrgDAO.retrieveOrganizationByOrganizationId(organizationid);
        
        HttpSession session = req.getSession();
        session.setAttribute("organization", organization);
        resp.sendRedirect("GENERAL PAGES/SignUp.jsp");
    }
    
    private void verifyEmail(HttpServletRequest req, HttpServletResponse resp)
            throws SQLException, ServletException, IOException{
        
        if(req.getParameter("command") != null){
            
            String departmentid = req.getParameter("department");
            String fname = req.getParameter("fname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            
            vmDAO vmdao = new vmDAOImpl();
            
            try {
                User vmuser = vmdao.verifyEmail(email);
                
                if(vmuser == null){
                    User newUser = new User();
        
                    newUser.setDepartmentid(Integer.parseInt(departmentid));
                    newUser.setFullname(fname);
                    newUser.setEmail(email);
                    newUser.setPassword(password);

                    vmDAO vm = new vmDAOImpl();
                    vm.save(newUser);
        
                    req.setAttribute("vmDetails", newUser);
                    resp.sendRedirect("GENERAL PAGES/LogIn.jsp");
                    
                } else {
                    HttpSession session = req.getSession();
                    session.setAttribute("erroremail", "Email is already taken.");
                    resp.sendRedirect("GENERAL PAGES/SignUp.jsp");
                }
                
            } catch (SQLException e){
                throw new ServletException(e);
            }
        }    
    }
    
    private void saveUser(HttpServletRequest req, HttpServletResponse resp) 
            throws SQLException, ServletException, IOException{
        
        //get all data from signup
        String departmentid = req.getParameter("department");
        String fname = req.getParameter("fname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        //keep data into javabeans
        User newUser = new User();
        
        newUser.setDepartmentid(Integer.parseInt(departmentid));
        newUser.setFullname(fname);
        newUser.setEmail(email);
        newUser.setPassword(password);

        //pass the bean to DAO
        vmDAO vm = new vmDAOImpl();
        vm.save(newUser);
        
        //save the bean as attribute and pass to view
        req.setAttribute("vmDetails", newUser);
        resp.sendRedirect("GENERAL PAGES/LogIn.jsp");
    }
    
    private void retrieveUser(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException{
        
        if(req.getParameter("command") != null){
            
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            
            
            vmDAO vmdao = new vmDAOImpl();
            adminDAO admindao = new adminDAOImpl();
            
            try {
                User vmuser = vmdao.authentication(email, password);
                Admin admin = admindao.authentication(email, password);
                
                if(admin !=null){
                    
                    HttpSession session = req.getSession();
                    session.setAttribute("admin", admin);
                    resp.sendRedirect("ADMIN/Dashboard.jsp");
                    
                } else if(vmuser != null){
                    
                    HttpSession session = req.getSession();
                    session.setAttribute("vmuser", vmuser);
                    resp.sendRedirect("VOTING MANAGER/Dashboard.jsp");
                    
                } else {
                    
                    req.setAttribute("error", "Invalid username or password!");
                    RequestDispatcher rd = req.getRequestDispatcher("GENERAL PAGES/LogIn.jsp");
                    rd.forward(req,resp);
                }
                
            } catch (SQLException e){
                throw new ServletException(e);
            }
        }
        
    }
    
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        
        String fname = request.getParameter("fullname");
        String email = request.getParameter("hidemail");
        String password = request.getParameter("password");
        int id = Integer.parseInt(request.getParameter("hidid"));
        int departmentid = Integer.parseInt(request.getParameter("hiddept"));
        
        User user = new User();
        
        user.setFullname(fname);
        user.setEmail(email);
        user.setPassword(password);
        user.setId(id);
        user.setDepartmentid(departmentid);
        
        vmDAO vmdao = new vmDAOImpl();
        
        vmdao.update(user);
        
        HttpSession session = request.getSession();
        session.setAttribute("vmuser", user);
        
        response.sendRedirect("VOTING MANAGER/Settings.jsp");
    }
    
    private void updateAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int id = Integer.parseInt(request.getParameter("hidid"));
        
        Admin admin = new Admin();
        
        admin.setEmail(email);
        admin.setPassword(password);
        admin.setId(id);
        
        adminDAO adminDAO = new adminDAOImpl();
        
        adminDAO.update(admin);
        
        HttpSession session = request.getSession();
        session.setAttribute("admin", admin);
        
        response.sendRedirect("ADMIN/Settings.jsp");
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

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("hidid"));
        
        User user = new User();
        
        user.setId(id);
        
        vmDAO vmdao = new vmDAOImpl();
        
        vmdao.delete(user);

        HttpSession session = request.getSession();
        session.invalidate();
        
        response.sendRedirect("GENERAL PAGES/ListOrganization.jsp");
        
    }

    private void signOut(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        request.getSession().removeAttribute("vmuser");
        
        response.sendRedirect("GENERAL PAGES/LogIn.jsp");
    }

}
