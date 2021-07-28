/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import DAO.vmDAO;
import Database.DBConnection;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hp
 */
public class vmDAOImpl implements vmDAO {

    private final Connection con;

    public vmDAOImpl() throws SQLException {
        con = DBConnection.getConnection();
    }

    @Override
    public void save(User vm) throws SQLException {
        try {
            String mySQLQuery = "insert into users(fname, email, password, departmentid) values(?, ?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, vm.getFullname());
            myPS.setString(2, vm.getEmail());
            myPS.setString(3, vm.getPassword());
            myPS.setInt(4, vm.getDepartmentid());

            myPS.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            con.close();
        }
    }

    @Override
    public User authentication(String email, String password) throws SQLException {
        ResultSet rs = null;
        User user = null;

        try {
            String mySQLQuery = "select * from users where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);

            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            while (rs.next()) {
                user = new User();

                user.setEmail(email);
                user.setPassword(password);
                user.setId(rs.getInt(1));
                user.setFullname(rs.getString(2));
                user.setDepartmentid(rs.getInt(5));
            }
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }
            con.close();
        }

        return user;
    }

    @Override
    public List<User> retrieveAll() throws SQLException {
        List<User> userlist = new ArrayList<>();

        User vm;
        ResultSet rs = null;

        try {
            String sqlQuery = "select * from users";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            rs = stat.executeQuery(sqlQuery);

            while (rs.next()) {
                vm = new User();

                vm.setFullname(rs.getString(1));
                vm.setEmail(rs.getString(2));
                vm.setPassword(rs.getString(3));

                userlist.add(vm);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        } finally {
            if (rs != null) {
                rs.close();
            }

            con.close();
        }

        return userlist;
    }

    @Override
    public void update(User vm) throws SQLException {

        try {
            String myQ = "UPDATE users SET fname=?, email=?, password=? WHERE user_id=?";

            PreparedStatement myPS = con.prepareStatement(myQ);

            myPS.setString(1, vm.getFullname());
            myPS.setString(2, vm.getEmail());
            myPS.setString(3, vm.getPassword());
            myPS.setInt(4, vm.getId());

            myPS.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());

        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(vmDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public void delete(User vm) throws SQLException {

        String myQ = "DELETE FROM users WHERE user_id=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, vm.getId());

            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(vmDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public User getOne(int id) throws SQLException {

        User user = null;

        try {
            String mySQLQuery = "select * from users where user_id=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                user = new User();

                user.setId(id);
                user.setFullname(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
                user.setDepartmentid(rs.getInt(5));
            }
            con.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());

        }

        return user;
    }

    @Override
    public User verifyEmail (String email) throws SQLException {
        ResultSet rs = null;
        User user = null;
        
        try {
            String mySQLQuery = "select * from users where email=?";
            PreparedStatement ps = con.prepareStatement(mySQLQuery);
            
            ps.setString(1, email);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                user = new User();
                
                user.setEmail(email);
                user.setId(rs.getInt(1));
                user.setFullname(rs.getString(2));
                user.setPassword(rs.getString(4));
                user.setDepartmentid(rs.getInt(5));
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
        
        return user;
    }
}
