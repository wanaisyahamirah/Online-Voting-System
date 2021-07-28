package DAOImpl;

import DAO.DepartmentDAO;
import Database.DBConnection;
import Model.Department;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DepartmentDAOImpl implements DepartmentDAO{
    private final Connection con;
    
    public DepartmentDAOImpl() throws SQLException{
        con = DBConnection.getConnection();
    }
    
    @Override
    public void addDepartment(Department department) throws SQLException {
        try {
            String mySQLQuery = "insert into departments(departmentName, organizationid) values(?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, department.getDepartmentName());
            myPS.setInt(2, department.getOrganizationid());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        }
    }
    
    @Override
    public List<Department> retrieveAllDepartmentByOrganizationId(int organizationid) throws SQLException {
        List<Department> departmentList = new ArrayList<>();
        
        try {
            String sqlQuery = "select * from departments where organizationid=" + organizationid;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                Department department = new Department();
                
                department.setDepartmentid(rs.getInt(1));
                department.setDepartmentName(rs.getString(2));
                department.setOrganizationid(organizationid);
                
                departmentList.add(department);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return departmentList;
    }

    @Override
    public Department retrieveById(int id) {
       Department department = new Department();
        
        try {
            String sqlQuery = "select * from departments where departmentid =" +id;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                
                department.setDepartmentid(rs.getInt("departmentid"));
                department.setDepartmentName(rs.getString("departmentName"));
                department.setOrganizationid(rs.getInt("organizationid"));
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return department;
       
    }
    
    @Override
    public void update(Department department) {
        try {
            String myQ = "update departments set departmentName=? where departmentid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, department.getDepartmentName());
            myPS.setInt(2, department.getDepartmentid());

            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }
    
    @Override
    public void delete(Department department) {
        
        String myQ = "delete from departments where departmentid=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, department.getDepartmentid());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
