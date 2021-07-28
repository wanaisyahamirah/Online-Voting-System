package DAO;

import Model.PollItem;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public interface PollItemDAO {

    void addPollItem(PollItem pollItem) throws SQLException, IOException;

    public List<PollItem> retrieveAllPollItemByPollId(int pollId) throws ClassNotFoundException, SQLException;

    void update(PollItem pollItem) throws SQLException, IOException;

    void delete(PollItem pollItem) throws SQLException, IOException;

    PollItem getOne(int pollItemId) throws SQLException, IOException;
}
