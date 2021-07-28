package Model;

import java.sql.Date;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class Event {
    
    private int eventid;
    private String eventName;
    String organizedBy;
    private String eventLocation;
    private Date startDate;
    private Date endDate;
    private String eventDesc;
    private String status;
    private int userid;
    private int organizationid;

    public Event() {
    }

    public Event(int eventid, String eventName, String organizedBy, String eventLocation, Date startDate, Date endDate, String eventDesc, String status, int userid, int organizationid) {
        this.eventid = eventid;
        this.organizedBy = organizedBy;
        this.eventName = eventName;
        this.eventLocation = eventLocation;
        this.startDate = startDate;
        this.endDate = endDate;
        this.eventDesc = eventDesc;
        this.status = status;
        this.userid = userid;
        this.organizationid = organizationid;
    }

    public int getEventid() {
        return eventid;
    }

    public void setEventid(int eventid) {
        this.eventid = eventid;
    }

    public String getOrganizedBy() {
        return organizedBy;
    }

    public void setOrganizedBy(String organizedBy) {
        this.organizedBy = organizedBy;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getEventLocation() {
        return eventLocation;
    }

    public void setEventLocation(String eventLocation) {
        this.eventLocation = eventLocation;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getEventDesc() {
        return eventDesc;
    }

    public void setEventDesc(String eventDesc) {
        this.eventDesc = eventDesc;
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

    public int getOrganizationid() {
        return organizationid;
    }

    public void setOrganizationid(int organizationid) {
        this.organizationid = organizationid;
    }
     
}