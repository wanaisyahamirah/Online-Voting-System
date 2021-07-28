/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.User;
import java.sql.SQLException;
import java.util.List;

public interface vmDAO {
    
    void save(User vm) throws SQLException;
    User authentication(String email, String password) throws SQLException;
    List<User> retrieveAll() throws SQLException;
    void update(User vm) throws SQLException;
    void delete(User vm) throws SQLException;
    User getOne(int id) throws SQLException;
    User verifyEmail (String email) throws SQLException;
}
