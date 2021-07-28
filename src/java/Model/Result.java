package Model;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class Result {
    
    private int userid;
    private int pollItemId;
    private int eventid;
    private String datetime; 

    public Result() {
    }
    
    public Result(int userid, int pollItemId, int eventid, String datetime) {
        this.userid = userid;
        this.pollItemId = pollItemId;
        this.eventid = eventid;
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

    public int getEventid() {
        return eventid;
    }

    public void setEventid(int eventid) {
        this.eventid = eventid;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

}
