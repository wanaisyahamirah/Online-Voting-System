package DAO;

import Model.Contact;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Hp
 */
public interface ContactDAO {
    
    void save(Contact contact) throws SQLException;
    List<Contact> selectAllContact() throws SQLException;
    Contact retrieveContactByContactId(int contactid) throws SQLException;
    void update(Contact contact);
    void delete(Contact contact);
    
}
