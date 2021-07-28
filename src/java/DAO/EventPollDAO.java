package DAO;

import Model.EventPoll;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public interface EventPollDAO {

    void addEventPoll(EventPoll eventPoll) throws SQLException;

    List<EventPoll> retrieveAllEventPollByEventId(int eventid) throws SQLException;

    EventPoll retrieveEventPollByPollId(int pollEventId) throws SQLException;

    void update(EventPoll eventPoll) throws SQLException;

    void delete(EventPoll eventPoll) throws SQLException;
}
