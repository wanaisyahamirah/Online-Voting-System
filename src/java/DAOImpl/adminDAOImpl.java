package DAOImpl;

import DAO.adminDAO;
import Database.DBConnection;
import Model.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class adminDAOImpl implements adminDAO {
    
    private final Connection con;
    
    public adminDAOImpl() throws SQLException{
        con = DBConnection.getConnection();
    }
    
    @Override
    public Admin authentication (String email, String password) throws SQLException{
        ResultSet rs = null;
        Admin admin = null;
        
        try {
            String mySQLQuery = "select * from admin where admin_email=? and admin_password=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);
            
            ps.setString(1, email);
            ps.setString(2, password);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                admin = new Admin();
                
                admin.setEmail(email);
                admin.setPassword(password);
                admin.setId(rs.getInt(1));
            }
            con.close();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            if(rs != null){
                rs.close();
            }
            con.close();
        }
        
        return admin;
    }
    
    @Override
    public List<Admin> retrieveAll() throws SQLException {
        List<Admin> adminlist = new ArrayList<>();
        
        Admin admin;
        ResultSet rs = null;
        
        try {
            String sqlQuery = "select * from admin";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                admin = new Admin();
                
                admin.setEmail(rs.getString(1));
                admin.setPassword(rs.getString(2));
                
                adminlist.add(admin);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            if(rs != null){
                rs.close();
            }
            
            con.close();
        }
        
        return adminlist;
    }
    
    @Override
    public void update(Admin admin){
        
        try {
            String myQ = "UPDATE admin SET admin_email=?, admin_password=? WHERE admin_id=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, admin.getEmail());
            myPS.setString(2, admin.getPassword());
            myPS.setInt(3, admin.getId()); 
            
            myPS.executeUpdate();
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(vmDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
}
