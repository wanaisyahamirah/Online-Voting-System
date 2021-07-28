package DAO;

import Model.Organization;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Wan Aisyah Amirah <S54164@ocean.umt.edu.my>
 */
public interface OrganizationDAO {
   void insert(Organization organization) throws SQLException;
    List<Organization> selectAllOrganization() throws SQLException;
    Organization retrieveOrganizationByOrganizationId(int organizationid) throws SQLException;
    void delete(Organization organization);
    void update(Organization organization);
}
