package DAO;

import Model.Admin;
import java.sql.SQLException;
import java.util.List;

public interface adminDAO {
    Admin authentication(String email, String password) throws SQLException;
    List<Admin> retrieveAll() throws SQLException;
    void update(Admin admin);
}
