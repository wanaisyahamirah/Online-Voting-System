/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import DAO.PollItemCountDAO;
import Model.PollItemCount;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

/**
 *
 * @author ariffnorhadi
 */
public class PollItemCountDAOImpl implements PollItemCountDAO {

    @Override
    public PollItemCount getHighestVotedPollItem(List<PollItemCount> pollItemCountList) {

        PollItemCount pollItemCount = new PollItemCount();

        Optional<PollItemCount> maxCountOpt = pollItemCountList.stream().max(Comparator.comparing(PollItemCount::getVoteCount));
        if (maxCountOpt.isPresent()) {
            pollItemCount = maxCountOpt.get();
        }

        return pollItemCount;
    }

}
