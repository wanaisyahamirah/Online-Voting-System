package DAOImpl;

import DAO.EventPollDAO;
import Database.DBConnection;
import Model.EventPoll;
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
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class EventPollDAOImpl implements EventPollDAO{
    
    private final Connection con;
    
    public EventPollDAOImpl() throws SQLException{
        con = DBConnection.getConnection();
    }

    @Override
    public void addEventPoll(EventPoll eventPoll) throws SQLException {
        try {
            String mySQLQuery = "insert into pollevents(pollEventName, pollEventDesc, eventid, departmentid) values(?, ?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, eventPoll.getPollEventName());
            myPS.setString(2, eventPoll.getPollEventDesc());
            myPS.setInt(3, eventPoll.getEventid());
            myPS.setInt(4, eventPoll.getDepartmentid());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        }
    }

    @Override
    public List<EventPoll> retrieveAllEventPollByEventId(int eventid) throws SQLException {
        List<EventPoll> eventPollList = new ArrayList<>();
        
        try {
            String sqlQuery = "select * from pollevents where eventid=" +eventid;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                EventPoll eventPoll = new EventPoll();
                
                eventPoll.setPollEventId(rs.getInt(1));
                eventPoll.setPollEventName(rs.getString(2));
                eventPoll.setPollEventDesc(rs.getString(3));
                eventPoll.setEventid(eventid);
                eventPoll.setDepartmentid(rs.getInt(5));
                
                eventPollList.add(eventPoll);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return eventPollList;
    }

    @Override
    public EventPoll retrieveEventPollByPollId(int pollEventId) throws SQLException {
       EventPoll eventPoll = new EventPoll();
        
        try {
            String sqlQuery = "select * from pollevents where pollEventId=" +pollEventId;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                eventPoll.setPollEventId(rs.getInt(1));
                eventPoll.setPollEventName(rs.getString(2));
                eventPoll.setPollEventDesc(rs.getString(3));
                eventPoll.setEventid((rs.getInt(4)));
                eventPoll.setDepartmentid(rs.getInt(5));
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return eventPoll;
    }

    @Override
    public void update(EventPoll eventPoll) throws SQLException{
        try {
            String myQ = "update pollevents set pollEventName=?, pollEventDesc=?, departmentid=? where pollEventId=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, eventPoll.getPollEventName());
            myPS.setString(2, eventPoll.getPollEventDesc());
            myPS.setInt(3, eventPoll.getDepartmentid());
            myPS.setInt(4, eventPoll.getPollEventId());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void delete(EventPoll eventPoll) throws SQLException{
        
        String myQ = "delete from pollevents where pollEventId=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, eventPoll.getPollEventId());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(vmDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
