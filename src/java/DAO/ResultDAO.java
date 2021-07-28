package DAO;

import Model.Result;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public interface ResultDAO {

    void saveResult(Result result) throws SQLException;

    int countResultByUserIdAndEventId(int userid, int eventid) throws SQLException;

    int countResultByEventId(int eventid) throws SQLException;

    int countResultByPollEventItemId(int pollEventItemId) throws SQLException;

    List<Result> retrieveResultsByPollEventItemId(int pollEventItemId) throws SQLException;
}
