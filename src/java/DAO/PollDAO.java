package DAO;

import Model.Poll;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public interface PollDAO {

    void addPoll(Poll poll) throws SQLException;

    List<Poll> retrieveAllPollByUserId(int userid) throws SQLException;

    Poll retrievePollByPollId(int pollId) throws SQLException;

    void update(Poll poll) throws SQLException;

    void delete(Poll poll) throws SQLException;

    void launchPoll(Poll poll) throws SQLException;

    void closePoll(Poll poll) throws SQLException;
    
    List<Poll> retrieveAllPollByStatus(String status) throws SQLException;
}
