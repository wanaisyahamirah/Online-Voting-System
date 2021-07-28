package Model;

public class Organization {
    private int organizationid;
    private String organizationName;
    private String organizationEmail;
    private String organizationAddr1;
    private String organizationAddr2;
    private String organizationCity;
    private String organizationState;
    private String organizationZipCode;
    
    public Organization() {
    
    }
     
    public int getOrganizationId() {
        return organizationid;
    }
    
    public void setOrganizationId(int organizationid) {
        this.organizationid = organizationid;
    }
    
    public String getOrganizationName() {
        return organizationName;
    }
    
    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }
    
    public String getOrganizationEmail() {
        return organizationEmail;
    }
    
    public void setOrganizationEmail(String organizationEmail) {
        this.organizationEmail = organizationEmail;
    }
    
    public String getOrganizationAddr1() {
        return organizationAddr1;
    }
    
    public void setOrganizationAddr1(String organizationAddr1) {
        this.organizationAddr1 = organizationAddr1;
    }
    
    public String getOrganizationAddr2() {
        return organizationAddr2;
    }
    
    public void setOrganizationAddr2(String organizationAddr2) {
        this.organizationAddr2 = organizationAddr2;
    }
    
    public String getOrganizationCity() {
        return organizationCity;
    }
    
    public void setOrganizationCity(String organizationCity) {
        this.organizationCity = organizationCity;
    }
    
    public String getOrganizationState() {
        return organizationState;
    }
    
    public void setOrganizationState(String organizationState) {
        this.organizationState = organizationState;
    }
    
    public String getOrganizationZipCode() {
        return organizationZipCode;
    }
    
    public void setOrganizationZipCode(String organizationZipCode) {
        this.organizationZipCode = organizationZipCode;
    }
}
