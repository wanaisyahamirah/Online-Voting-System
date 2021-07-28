package Model;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class PollResult {
    
    private int userid;
    private int pollItemId;
    private int pollid;
    private String datetime;

    public PollResult() {
    }

    public PollResult(int userid, int pollItemId, int pollid, String datetime) {
        this.userid = userid;
        this.pollItemId = pollItemId;
        this.pollid = pollid;
        this.datetime = datetime;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getPollItemId() {
        return pollItemId;
    }

    public void setPollItemId(int pollItemId) {
        this.pollItemId = pollItemId;
    }

    public int getPollid() {
        return pollid;
    }

    public void setPollid(int pollid) {
        this.pollid = pollid;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }
            
}
