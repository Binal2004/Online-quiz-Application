
package com.quiz;


import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3305/quiz_db", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}
