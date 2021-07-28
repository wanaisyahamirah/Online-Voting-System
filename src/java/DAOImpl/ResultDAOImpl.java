package DAOImpl;

import DAO.ResultDAO;
import Database.DBConnection;
import Model.Result;
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
public class ResultDAOImpl implements ResultDAO{
    
    private final Connection con;
    
    public ResultDAOImpl() throws SQLException{
        con = DBConnection.getConnection();
    }

    @Override
    public void saveResult(Result result) throws SQLException {
        try {
            String mySQLQuery = "insert into results(userid, pollItemId, eventid, dateTime) values(?, ?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setInt(1, result.getUserid());
            myPS.setInt(2, result.getPollItemId());
            myPS.setInt(3, result.getEventid());
            myPS.setString(4, result.getDatetime());
            
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        }
    }

    @Override
    public int countResultByUserIdAndEventId(int userid, int eventid) throws SQLException {
        String myQ = "select count(1) from results where userid="+userid+" and eventid="+eventid;
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
    public int countResultByEventId(int eventid) throws SQLException {
        String myQ = "select count(distinct userid) from results where eventid="+eventid;
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
    public int countResultByPollEventItemId(int pollEventItemId) throws SQLException {
        String myQ = "select count(2) from results where pollItemId="+pollEventItemId;
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
    public List<Result> retrieveResultsByPollEventItemId(int pollEventItemId) throws SQLException {
        List<Result> resultList = new ArrayList<>();
        
        try {
            String sqlQuery = "select * from results where pollItemId="+pollEventItemId;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                Result result = new Result();
                
                result.setUserid(rs.getInt(1));
                result.setPollItemId(pollEventItemId);
                result.setEventid(rs.getInt(3));
                result.setDatetime(rs.getString(4));
                
                resultList.add(result);
            }
            
        }catch (SQLException e){
            System.out.println(e.getMessage());
            
        } 
        return resultList;
    }
}
