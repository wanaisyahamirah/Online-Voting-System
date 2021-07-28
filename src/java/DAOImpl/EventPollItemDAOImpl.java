/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import DAO.EventPollItemDAO;
import Database.DBConnection;
import Model.EventPollItem;
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
public class EventPollItemDAOImpl implements EventPollItemDAO {
    
    private final Connection con;
    
    public EventPollItemDAOImpl() throws SQLException, ClassNotFoundException{
        con = DBConnection.getConnection();
    }

    @Override
    public void addEventPollItem(EventPollItem eventPollItem) throws SQLException, IOException {
        
        try {
            String mySQLQuery = "insert into polleventitems(pollEventItemName, pollEventItemImage, pollEventId) values(?, ?, ?)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, eventPollItem.getPollItemName());
            
            Part filePart = eventPollItem.getPollItemImage();
            InputStream inputStream = null;
            
            if (filePart != null){
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            } 
            
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                myPS.setBlob(2, inputStream);
            }
            
            myPS.setInt(3, eventPollItem.getPolleventid());
            myPS.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } 
    }

    @Override
    public List<EventPollItem> retrieveAllEventPollItemByEventPollId(int eventPollId) throws ClassNotFoundException, SQLException {
        List <EventPollItem> eventPollItemList = new ArrayList<>();

        try {
            String mySQLQuery = "select * from polleventitems where pollEventId=" +eventPollId;

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            ResultSet rs = myPS.executeQuery();
            
            while (rs.next()){
                int pollEventItemId = rs.getInt("pollEventItemId");
                String pollEventItemName = rs.getString("pollEventItemName");
                int pollEventId  = rs.getInt("pollEventId");
                eventPollItemList.add(new EventPollItem(pollEventItemId, pollEventItemName, pollEventId));
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } 
        return eventPollItemList;
    }

    @Override
    public void updateEventPollItem(EventPollItem eventPollItem) throws SQLException, IOException {
        try {
            String myQ = "update polleventitems set pollEventItemName=?, pollEventItemImage=? where pollEventItemId =?";
     
            PreparedStatement myPS = con.prepareStatement(myQ);
            
            myPS.setString(1, eventPollItem.getPollItemName());
            
            Part filePart = eventPollItem.getPollItemImage();
            InputStream inputStream = null;
            
            inputStream = filePart.getInputStream();
            
            // fetches input stream of the upload file for the blob column
            myPS.setBlob(2, inputStream);
            myPS.setInt(3, eventPollItem.getPolleventitemid());

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
    public void delete(EventPollItem eventPollItem) throws SQLException, IOException {
        
        String myQ = "delete from polleventitems where pollEventItemId=?";
        try {
            PreparedStatement myPs = con.prepareStatement(myQ);
            myPs.setInt(1, eventPollItem.getPolleventitemid());
        
            myPs.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(vmDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public EventPollItem getOne(int eventPollItemId) throws SQLException, IOException {
        EventPollItem eventPollItem = new EventPollItem();
        
        try {
            String sqlQuery = "select * from polleventitems where pollEventItemId=" +eventPollItemId;
            PreparedStatement stat = con.prepareStatement(sqlQuery);
            ResultSet rs = stat.executeQuery(sqlQuery);
            
            while(rs.next()){
                
                eventPollItem.setPollItemName(rs.getString(2));
    
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return eventPollItem;
    }

}
