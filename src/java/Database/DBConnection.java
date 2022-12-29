package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection implements java.io.Serializable {
    
    private static Connection con;
    
    public static Connection getConnection() throws SQLException{
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/votingsystem";
            
            con = DriverManager.getConnection(url, "root", "");
        } catch (ClassNotFoundException | SQLException e){
            e.getMessage();
        }
        return con;
    }
    
    public void closeConnection(){
        try {
            con.close();
        } catch (SQLException e){
            e.getMessage();
        }
    }
}
