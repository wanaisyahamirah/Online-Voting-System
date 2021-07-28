package DAOImpl;

import DAO.ContactDAO;
import Database.DBConnection;
import Model.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hp
 */
public class ContactDAOImpl implements ContactDAO {
    private final Connection con;
    
    public ContactDAOImpl() throws SQLException{
        con = DBConnection.getConnection();
    }
    
    @Override
    public void save(Contact contact) throws SQLException{
        try {
            String mySQLQuery = "insert into contact(fullname, email, subject, description) values(?, ?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, contact.getFullname());
            myPS.setString(2, contact.getEmail());
            myPS.setString(3, contact.getSubject());
            myPS.setString(4, contact.getDescription());
            
            myPS.executeUpdate();
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            
        } finally {
            con.close();
        }
    }
    
    @Override
    public List<Contact> selectAllContact() throws SQLException {
        List<Contact> contactlist = new ArrayList<>();
        
        try {
            String sqlQuery = "select * from contact";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                Contact contact = new Contact();
                
                contact.setId(rs.getInt(1));
                contact.setFullname(rs.getString(2));
                contact.setEmail(rs.getString(3));
                contact.setSubject(rs.getString(4));
                contact.setDescription(rs.getString(5));
                
                contactlist.add(contact);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return contactlist;
    }
    
     @Override
    public Contact retrieveContactByContactId(int contactid) throws SQLException {
       Contact contact = new Contact();
        
        try {
            String sqlQuery = "select * from contact where contactid=" +contactid;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){                
                contact.setId(contactid);
                contact.setFullname(rs.getString(2));
                contact.setEmail(rs.getString(3));
                contact.setSubject(rs.getString(4));
                contact.setDescription(rs.getString(5));
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return contact;
    }
    
    @Override
    public void update(Contact contact) {
        try {
            String myQ = "update contact set fullname=?, email=?, subject=?, description=? where contactid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, contact.getFullname());
            myPS.setString(2, contact.getEmail());
            myPS.setString(3, contact.getSubject());
            myPS.setString(4, contact.getDescription());
            myPS.setInt(5, contact.getId());

            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }
    
    @Override
    public void delete(Contact contact) {
        
        String myQ = "delete from contact where contactid=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, contact.getId());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ContactDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }      
    }
}
