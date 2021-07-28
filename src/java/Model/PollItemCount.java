package Model;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class PollItemCount {
    
    private int pollItemId;
    private int voteCount;

    public PollItemCount() {
    }

    public PollItemCount(int pollItemId, int voteCount) {
        this.pollItemId = pollItemId;
        this.voteCount = voteCount;
    }

    public int getPollItemId() {
        return pollItemId;
    }

    public void setPollItemId(int pollItemId) {
        this.pollItemId = pollItemId;
    }

    public int getVoteCount() {
        return voteCount;
    }

    public void setVoteCount(int voteCount) {
        this.voteCount = voteCount;
    }
    
    
}
