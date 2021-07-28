package DAO;

import Model.Department;
import java.sql.SQLException;
import java.util.List;

public interface DepartmentDAO {
    
    void addDepartment(Department department) throws SQLException;
    Department retrieveById(int id);
    List<Department> retrieveAllDepartmentByOrganizationId(int organizationid) throws SQLException;
    void update(Department department);
    void delete(Department department);
}
