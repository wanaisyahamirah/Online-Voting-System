package DAOImpl;

import DAO.PollItemDAO;
import Database.DBConnection;
import Model.EventPollItem;
import Model.PollItem;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class PollItemDAOImpl implements PollItemDAO{
    
    private final Connection con;
    
    public PollItemDAOImpl() throws SQLException, ClassNotFoundException{
        con = DBConnection.getConnection();
    }

    @Override
    public void addPollItem(PollItem pollItem) throws SQLException, IOException {
        try {
            String mySQLQuery = "insert into pollitems(pollItemName, pollItemImage, pollid) values(?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, pollItem.getPollItemName());
            
            Part filePart = pollItem.getPollItemImage();
            InputStream inputStream = null;
            
            if (filePart != null){
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            } 
            
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(2, inputStream);
            }
            
            myPS.setInt(3, pollItem.getPollid());
            myPS.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public List<PollItem> retrieveAllPollItemByPollId(int pollId) throws ClassNotFoundException, SQLException {
        List <PollItem> pollItemList = new ArrayList<>();

        try {
            String mySQLQuery = "select * from pollitems where pollid=" +pollId;

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            ResultSet rs = myPS.executeQuery();
            
            while (rs.next()){
                int pollItemId = rs.getInt("pollItemId");
                String pollItemName = rs.getString("pollItemName");
                int pollid  = rs.getInt("pollid");
                pollItemList.add(new PollItem(pollItemId, pollItemName, pollid));
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } 
        return pollItemList;
    }

    @Override
    public void update(PollItem pollItem) throws SQLException, IOException {
        try {
            String myQ = "update pollitems set pollItemName=?, pollItemImage=? where pollItemId=?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, pollItem.getPollItemName());
            
            Part filePart = pollItem.getPollItemImage();
            
            InputStream inputStream = filePart.getInputStream();
            
            // fetches input stream of the upload file for the blob column
            myPS.setBlob(2, inputStream);
            myPS.setInt(3, pollItem.getPollitemid());

            myPS.executeUpdate();

        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
        finally {
            con.close();
        }
    }

    @Override
    public void delete(PollItem pollItem) throws SQLException, IOException {
        String myQ = "delete from pollitems where pollItemId=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, pollItem.getPollitemid());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(vmDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public PollItem getOne(int pollItemId) throws SQLException, IOException {
        PollItem pollItem = new PollItem();
        
        try {
            String sqlQuery = "select * from pollitems where pollItemId =" +pollItemId;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                
                pollItem.setPollItemName(rs.getString(2));
    
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return pollItem;
    }
    
}
