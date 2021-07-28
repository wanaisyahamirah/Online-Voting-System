package Model;

import javax.servlet.http.Part;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class PollItem {
    
    private int pollitemid;
    private String pollItemName;
    private Part pollItemImage;
    private int pollid;

    public PollItem() {
    }

    
    public PollItem(int pollitemid, String pollItemName, int pollid) {
        this.pollitemid = pollitemid;
        this.pollItemName = pollItemName;
        this.pollid = pollid;
    }

    public int getPollitemid() {
        return pollitemid;
    }

    public void setPollitemid(int pollitemid) {
        this.pollitemid = pollitemid;
    }

    public String getPollItemName() {
        return pollItemName;
    }

    public void setPollItemName(String pollItemName) {
        this.pollItemName = pollItemName;
    }

    public Part getPollItemImage() {
        return pollItemImage;
    }

    public void setPollItemImage(Part pollItemImage) {
        this.pollItemImage = pollItemImage;
    }

    public int getPollid() {
        return pollid;
    }

    public void setPollid(int pollid) {
        this.pollid = pollid;
    }
  
}
