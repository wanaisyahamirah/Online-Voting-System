package DAO;

import Model.PollResult;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public interface PollResultDAO {

    void saveResult(PollResult pollResult) throws SQLException;

    int countResultByPollId(int pollid) throws SQLException;
    
    int countResultByUserIdAndPollId(int userid, int pollid) throws SQLException;
    
    int countResultByPollEventItemId(int pollItemId) throws SQLException;
    
    int countResultByPollItemId(int pollItemId) throws SQLException;
    
     List<PollResult> retrieveResultsByPollItemId(int pollItemId) throws SQLException;
}
