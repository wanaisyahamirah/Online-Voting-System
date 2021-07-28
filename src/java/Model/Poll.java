package Model;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class Poll {
    
    private int pollid;
    private String pollName;
    private String pollDesc;
    private String status;
    private int userid;

    public Poll() {
    }

    public Poll(int pollid, String pollName, String pollDesc, String status, int userid) {
        this.pollid = pollid;
        this.pollName = pollName;
        this.pollDesc = pollDesc;
        this.status = status;
        this.userid = userid;
    }

    public int getPollid() {
        return pollid;
    }

    public void setPollid(int pollid) {
        this.pollid = pollid;
    }

    public String getPollName() {
        return pollName;
    }

    public void setPollName(String pollName) {
        this.pollName = pollName;
    }

    public String getPollDesc() {
        return pollDesc;
    }

    public void setPollDesc(String pollDesc) {
        this.pollDesc = pollDesc;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

}
