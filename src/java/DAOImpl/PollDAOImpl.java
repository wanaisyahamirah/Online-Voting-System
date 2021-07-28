package DAOImpl;

import DAO.PollDAO;
import Database.DBConnection;
import Model.Poll;
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
public class PollDAOImpl implements PollDAO{
    
    private final Connection con;
    
    public PollDAOImpl() throws SQLException{
        con = DBConnection.getConnection();
    }

    @Override
    public void addPoll(Poll poll) throws SQLException {
        try {
            String mySQLQuery = "insert into polls(pollName, pollDesc, userid) values(?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, poll.getPollName());
            myPS.setString(2, poll.getPollDesc());
            myPS.setInt(3, poll.getUserid());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        }
    }

    @Override
    public List<Poll> retrieveAllPollByUserId(int userid) throws SQLException {
        List<Poll> pollList = new ArrayList<>();
        
        try {
            String sqlQuery = "select * from polls where userid=" +userid;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                Poll poll = new Poll();
                
                poll.setPollid(rs.getInt(1));
                poll.setPollName(rs.getString(2));
                poll.setPollDesc(rs.getString(3));
                poll.setStatus(rs.getString(4));
                poll.setUserid(userid);
                
                pollList.add(poll);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return pollList;
    }

    @Override
    public Poll retrievePollByPollId(int pollId) throws SQLException {
        Poll poll = new Poll();
        
        try {
            String sqlQuery = "select * from polls where pollid=" +pollId;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                poll.setPollid(pollId);
                poll.setPollName(rs.getString(2));
                poll.setPollDesc(rs.getString(3));
                poll.setStatus(rs.getString(4));
                poll.setUserid(rs.getInt(5));
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return poll;
    }

    @Override
    public void update(Poll poll) throws SQLException {
        try {
            String myQ = "update polls set pollName=?, pollDesc=? where pollid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, poll.getPollName());
            myPS.setString(2, poll.getPollDesc());
            myPS.setInt(3, poll.getPollid());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void delete(Poll poll) throws SQLException {
        String myQ = "delete from polls where pollid=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, poll.getPollid());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(vmDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void launchPoll(Poll poll) throws SQLException {
        try {
            String myQ = "update polls set status=? where pollid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, "Live");
            myPS.setInt(2, poll.getPollid());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void closePoll(Poll poll) throws SQLException {
        try {
            String myQ = "update polls set status=? where pollid=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, "Close");
            myPS.setInt(2, poll.getPollid());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    public List<Poll> retrieveAllPollByStatus(String status) throws SQLException {
        
        List<Poll> polllist = new ArrayList<>();
        
        try {
            String sqlQuery = "select * from polls where status='"+status+"'";
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                Poll poll = new Poll();
                
                poll.setPollid(rs.getInt(1));
                poll.setPollName(rs.getString(2));
                poll.setPollDesc(rs.getString(3));
                poll.setStatus(status);
                poll.setUserid(rs.getInt(5));
                
                polllist.add(poll);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return polllist;
    }
    
    
}
