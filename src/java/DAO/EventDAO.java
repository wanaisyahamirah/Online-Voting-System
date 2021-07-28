package DAO;

import Model.Event;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public interface EventDAO {
    void addEvent(Event event) throws SQLException;
    List<Event> retrieveAllEventByUserId(int userid) throws SQLException;
    List<Event> retrieveAllEventByOrganizationIdandStatus(int organizationid, String status) throws SQLException;
    Event retrieveEventByEventId(int eventid) throws SQLException;
    void update(Event event) throws SQLException;
    void delete(Event event) throws SQLException;
    void launchEvent(Event event) throws SQLException;
    void closeEvent(Event event) throws SQLException;
    List<Event> retrieveAllEventByUserIdandStatus(int userid, String status) throws SQLException;
}
