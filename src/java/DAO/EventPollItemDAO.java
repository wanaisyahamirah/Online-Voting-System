/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.EventPollItem;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public interface EventPollItemDAO {

    void addEventPollItem(EventPollItem eventPollItem) throws SQLException, IOException;

    public List<EventPollItem> retrieveAllEventPollItemByEventPollId(int eventPollId) throws ClassNotFoundException, SQLException;

    void updateEventPollItem(EventPollItem eventPollItem) throws SQLException, IOException;

    void delete(EventPollItem eventPollItem) throws SQLException, IOException;
    
    EventPollItem getOne(int eventPollItem) throws SQLException, IOException;
}
