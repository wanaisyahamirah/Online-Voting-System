/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.PollItemCount;
import java.util.List;

/**
 *
 * @author ariffnorhadi
 */
public interface PollItemCountDAO {

    PollItemCount getHighestVotedPollItem(List<PollItemCount> pollItemCountList);

}
