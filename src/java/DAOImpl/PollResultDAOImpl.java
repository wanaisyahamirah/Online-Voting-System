package DAOImpl;

import DAO.PollResultDAO;
import Database.DBConnection;
import Model.PollResult;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class PollResultDAOImpl implements PollResultDAO{
    
    private final Connection con;
    
    public PollResultDAOImpl() throws SQLException{
        con = DBConnection.getConnection();
    }

    @Override
    public void saveResult(PollResult pollResult) throws SQLException {
        try {
            String mySQLQuery = "insert into pollresults(userid, pollItemId, pollid, dateTime) values(?, ?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setInt(1, pollResult.getUserid());
            myPS.setInt(2, pollResult.getPollItemId());
            myPS.setInt(3, pollResult.getPollid());
            myPS.setString(4, pollResult.getDatetime());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        }
    }

    @Override
    public int countResultByPollId(int pollid) throws SQLException {
        String myQ = "select count(1) from pollresults where pollid="+pollid;
        int record = 0;
        
        try {
            Statement stmt = con.createStatement();
            ResultSet rsExist = stmt.executeQuery(myQ);
            
            if (rsExist.next()) {
                record = rsExist.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        return record;
    }

    @Override
    public int countResultByUserIdAndPollId(int userid, int pollid) throws SQLException {
        String myQ = "select count(1) from pollresults where userid="+userid+" and pollid="+pollid;
        int record = 0;
        
        try {
            Statement stmt = con.createStatement();
            ResultSet rsExist = stmt.executeQuery(myQ);
            
            if (rsExist.next()) {
                record = rsExist.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        return record;
    }

    @Override
    public int countResultByPollEventItemId(int pollItemId) throws SQLException {
        String myQ = "select count(2) from results where pollItemId="+pollItemId;
        int record = 0;
        
        try {
            Statement stmt = con.createStatement();
            ResultSet rsExist = stmt.executeQuery(myQ);
            
            if (rsExist.next()) {
                record = rsExist.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        return record;
    }
    
    @Override
    public int countResultByPollItemId(int pollItemId) throws SQLException {
        String myQ = "select count(2) from pollresults where pollItemId="+pollItemId;
        int record = 0;
        
        try {
            Statement stmt = con.createStatement();
            ResultSet rsExist = stmt.executeQuery(myQ);
            
            if (rsExist.next()) {
                record = rsExist.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        return record;
    }

    @Override
    public List<PollResult> retrieveResultsByPollItemId(int pollItemId) throws SQLException {
        List<PollResult> pollResultList = new ArrayList<>();
        
        try {
            String sqlQuery = "select * from pollresults where pollItemId="+pollItemId;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                PollResult pollResult = new PollResult();
                
                pollResult.setUserid(rs.getInt(1));
                pollResult.setPollItemId(pollItemId);
                pollResult.setPollid(rs.getInt(3));
                pollResult.setDatetime(rs.getString(4));
                
                pollResultList.add(pollResult);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return pollResultList;
    }
    
}
