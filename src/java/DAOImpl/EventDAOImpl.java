package DAOImpl;

import DAO.EventDAO;
import Database.DBConnection;
import Model.Event;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class EventDAOImpl implements EventDAO{
    
    private final Connection con;
    
    public EventDAOImpl() throws SQLException{
        con = DBConnection.getConnection();
    }

    @Override
    public void addEvent(Event event) throws SQLException {
        try {
            String mySQLQuery = "insert into events(eventName, organizedBy, eventLocation, startDate, endDate, eventDesc, userid, organizationid) values(?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, event.getEventName());
            myPS.setString(2, event.getOrganizedBy());
            myPS.setString(3, event.getEventLocation());
            myPS.setDate(4, event.getStartDate());
            myPS.setDate(5, event.getEndDate());
            myPS.setString(6, event.getEventDesc());
            myPS.setInt(7, event.getUserid());
            myPS.setInt(8, event.getOrganizationid());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        }
    }

    @Override
    public List<Event> retrieveAllEventByUserId(int userid) throws SQLException {
        List<Event> eventlist = new ArrayList<>();
        
        try {
            String sqlQuery = "select * from events where userid =" +userid;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                Event event = new Event();
                
                event.setEventid(rs.getInt(1));
                event.setEventName(rs.getString(2));
                event.setOrganizedBy(rs.getString(3));
                event.setStartDate(rs.getDate(5));
                event.setStatus(rs.getString(8));
                event.setUserid(userid);
                
                eventlist.add(event);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return eventlist;
    }

    @Override
    public Event retrieveEventByEventId(int eventid) throws SQLException {
        Event event = new Event();
        
        try {
            String sqlQuery = "select * from events where eventid =" +eventid;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
    
                event.setEventid(eventid);
                event.setEventName(rs.getString(2));
                event.setOrganizedBy(rs.getString(3));
                event.setEventLocation(rs.getString(4));
                event.setStartDate(rs.getDate(5));
                event.setEndDate(rs.getDate(6));
                event.setEventDesc(rs.getString(7));
                event.setOrganizationid(rs.getInt(10));
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return event;
    }

    @Override
    public void update(Event event) throws SQLException{
        
        try {
            String myQ = "update events set eventName=?, organizedBy=?, eventLocation=?, startDate=?,"
                    + " endDate=?, eventDesc=? where eventid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, event.getEventName());
            myPS.setString(2, event.getOrganizedBy());
            myPS.setString(3, event.getEventLocation());
            myPS.setDate(4, event.getStartDate());
            myPS.setDate(5, event.getEndDate());
            myPS.setString(6, event.getEventDesc());
            myPS.setInt(7, event.getEventid());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
        } 
    }

    @Override
    public void delete(Event event) {
        
        String myQ = "delete from events where eventid=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, event.getEventid());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(vmDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public List<Event> retrieveAllEventByOrganizationIdandStatus(int organizationid, String status) throws SQLException {
        List<Event> eventlist = new ArrayList<>();
        
        try {
            String sqlQuery = "select * from events where organizationid=" +organizationid + " and status='"+status+"'";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                Event event = new Event();
                
                event.setEventid(rs.getInt(1));
                event.setEventName(rs.getString(2));
                event.setOrganizedBy(rs.getString(3));
                event.setEventLocation(rs.getString(4));
                event.setStartDate(rs.getDate(5));
                event.setEndDate(rs.getDate(6));
                event.setEventDesc(rs.getString(7));
                event.setStatus(status);
                event.setUserid(rs.getInt(9));
                event.setOrganizationid(organizationid);
                
                eventlist.add(event);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return eventlist;
    }

    @Override
    public void launchEvent(Event event) throws SQLException{
        
        try {
            String myQ = "update events set status=? where eventid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, "Live");
            myPS.setInt(2, event.getEventid());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
        } 

    }

    @Override
    public void closeEvent(Event event) throws SQLException{
        try {
            String myQ = "update events set status=? where eventid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, "Close");
            myPS.setInt(2, event.getEventid());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    public List<Event> retrieveAllEventByUserIdandStatus(int userid, String status) throws SQLException {
        List<Event> eventlist = new ArrayList<>();
        
        try {
            String sqlQuery = "select * from events where userid=" +userid + " and status='"+status+"'";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                Event event = new Event();
                
                event.setEventid(rs.getInt(1));
                event.setEventName(rs.getString(2));
                event.setOrganizedBy(rs.getString(3));
                event.setEventLocation(rs.getString(4));
                event.setStartDate(rs.getDate(5));
                event.setEndDate(rs.getDate(6));
                event.setEventDesc(rs.getString(7));
                event.setStatus(status);
                event.setUserid(userid);
                event.setOrganizationid(rs.getInt(10));
                
                eventlist.add(event);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return eventlist;
    }
    
}
