package Model;

import java.io.Serializable;
import javax.servlet.http.Part;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class EventPollItem implements Serializable {
    private int polleventitemid;
    private String pollItemName;
    private Part pollItemImage;
    private int polleventid;

    public EventPollItem() {
    }

    public EventPollItem(int polleventitemid, String pollItemName, int polleventid) {
        this.polleventitemid = polleventitemid;
        this.pollItemName = pollItemName;
        this.polleventid = polleventid;
    }

    public int getPolleventitemid() {
        return polleventitemid;
    }

    public void setPolleventitemid(int polleventitemid) {
        this.polleventitemid = polleventitemid;
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

    public int getPolleventid() {
        return polleventid;
    }

    public void setPolleventid(int polleventid) {
        this.polleventid = polleventid;
    }
    
}
