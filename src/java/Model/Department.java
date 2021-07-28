package Model;

public class Department {
    private int departmentid;
    private String departmentName;
    private int organizationid;
    
    public Department() {
        
    }

    public Department(int departmentid, String departmentName, int organizationid) {
        this.departmentid = departmentid;
        this.departmentName = departmentName;
        this.organizationid = organizationid;
    }

    public int getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(int departmentid) {
        this.departmentid = departmentid;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public int getOrganizationid() {
        return organizationid;
    }

    public void setOrganizationid(int organizationid) {
        this.organizationid = organizationid;
    }
}

