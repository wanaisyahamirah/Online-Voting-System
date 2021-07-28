/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public class EventPoll {
    
    private int pollEventId;
    private String pollEventName;
    private String pollEventDesc;
    private int eventid;
    private int departmentid;

    public EventPoll() {
    }

    public EventPoll(int pollEventId, String pollEventName, String pollEventDesc, int eventid, int departmentid) {
        this.pollEventId = pollEventId;
        this.pollEventName = pollEventName;
        this.pollEventDesc = pollEventDesc;
        this.eventid = eventid;
        this.departmentid = departmentid;
    }

    public int getPollEventId() {
        return pollEventId;
    }

    public void setPollEventId(int pollEventId) {
        this.pollEventId = pollEventId;
    }

    public String getPollEventName() {
        return pollEventName;
    }

    public void setPollEventName(String pollEventName) {
        this.pollEventName = pollEventName;
    }

    public String getPollEventDesc() {
        return pollEventDesc;
    }

    public void setPollEventDesc(String pollEventDesc) {
        this.pollEventDesc = pollEventDesc;
    }

    public int getEventid() {
        return eventid;
    }

    public void setEventid(int eventid) {
        this.eventid = eventid;
    }

    public int getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(int departmentid) {
        this.departmentid = departmentid;
    }
    
}
