package DAOImpl;

import DAO.OrganizationDAO;
import Database.DBConnection;
import Model.Organization;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class OrganizationDAOImpl implements OrganizationDAO {
    
    private final Connection con;
    
    public OrganizationDAOImpl() throws SQLException{
        con = DBConnection.getConnection();
    }
    
    @Override
    public void insert(Organization organization) throws SQLException{
        try {
            String mySQLQuery = "insert into organizations(organizationName, organizationEmail, organizationAddr1, organizationAddr2, organizationCity, organizationState, organizationZipCode) values(?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, organization.getOrganizationName());
            myPS.setString(2, organization.getOrganizationEmail());
            myPS.setString(3, organization.getOrganizationAddr1());
            myPS.setString(4, organization.getOrganizationAddr2());
            myPS.setString(5, organization.getOrganizationCity());
            myPS.setString(6, organization.getOrganizationState());
            myPS.setString(7, organization.getOrganizationZipCode());
            
            myPS.executeUpdate();
            
        } catch (Exception e){
            System.out.println(e.getMessage());
            
        } finally {
            con.close();
        }
    }
    
    @Override
    public List<Organization> selectAllOrganization() throws SQLException {
        List<Organization> organizationList = new ArrayList<>();
        
        try {
            String sqlQuery = "select * from organizations";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                Organization organization = new Organization();
                
                organization.setOrganizationId(rs.getInt(1));
                organization.setOrganizationName(rs.getString(2));
                organization.setOrganizationEmail(rs.getString(3));
                organization.setOrganizationAddr1(rs.getString(4));
                organization.setOrganizationAddr2(rs.getString(5));
                organization.setOrganizationCity(rs.getString(6));
                organization.setOrganizationState(rs.getString(7));
                organization.setOrganizationZipCode(rs.getString(8));
                
                organizationList.add(organization);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return organizationList;
    }

    @Override
    public Organization retrieveOrganizationByOrganizationId(int organizationid) throws SQLException {
       Organization organization = new Organization();
        
        try {
            String sqlQuery = "select * from organizations where organizationid =" +organizationid;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){                
                organization.setOrganizationId(rs.getInt(1));
                organization.setOrganizationName(rs.getString(2));
                organization.setOrganizationEmail(rs.getString(3));
                organization.setOrganizationAddr1(rs.getString(4));
                organization.setOrganizationAddr2(rs.getString(5));
                organization.setOrganizationCity(rs.getString(6));
                organization.setOrganizationState(rs.getString(7));
                organization.setOrganizationZipCode(rs.getString(8));      
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return organization;
    }
    
    @Override
    public void update(Organization organization) {
        try {
            String myQ = "update organizations set organizationName=?, organizationEmail=?, organizationAddr1=?, organizationAddr2=?, organizationCity=?, organizationState=?, organizationZipCode=? where organizationid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, organization.getOrganizationName());
            myPS.setString(2, organization.getOrganizationEmail());
            myPS.setString(3, organization.getOrganizationAddr1());
            myPS.setString(4, organization.getOrganizationAddr2());
            myPS.setString(5, organization.getOrganizationCity());
            myPS.setString(6, organization.getOrganizationState());
            myPS.setString(7, organization.getOrganizationZipCode());
            myPS.setInt(8, organization.getOrganizationId());

            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }
    
    @Override
    public void delete(Organization organization) {
        
        String myQ = "delete from organizations where organizationid=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, organization.getOrganizationId());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }      
    }
    
}
