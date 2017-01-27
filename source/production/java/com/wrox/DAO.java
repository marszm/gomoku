/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wrox;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author oko
 */
public class DAO {
    
    //database
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://127.0.0.1/sys";
    static final String USER = "root";
    static final String PASS = "root";
    //database
    
    private static Connection getConnection() throws SQLException{
        Connection connection = null;
        try {
         Class.forName(JDBC_DRIVER);
         connection = DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (ClassNotFoundException ex) {
            //System.out.println("dsadasda"+ex);
            Logger.getLogger(TicTacToeServer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection;
    }
    
    public static void save(String winner) throws SQLException {
        
        String convert = winner;
        Connection con = null;
        PreparedStatement pstmt = null;
        String insertSQL = "INSERT INTO gomoku"
				+ "(winner) VALUES"
				+ "(?)";
        try{
            con = getConnection();
            pstmt = con.prepareStatement(insertSQL);
            pstmt.setString(1,convert);
            pstmt.executeUpdate();
            System.out.println("Record is inserted");       
        }catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if(pstmt != null) {
                pstmt.close();
            }
            if(con != null ) {
                con.close();
            }
        }
        //System.out.println(" save in databaes"+winner);
    }
    
    public static List<Person> selectAll() throws SQLException {
        
        List<Person> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        String selectallSQL = "select * from gomoku;";
        
        try{
            con = getConnection();
            ps = con.prepareStatement(selectallSQL);
            ResultSet rs = ps.executeQuery(selectallSQL);
            while(rs.next())
            {
                Person person = new Person();
                person.setId(rs.getInt(1));
                person.setName(rs.getString(2));
                list.add(person);
            } 
        }catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            if(ps != null) {
                ps.close();
            }
            if(con != null ) {
                con.close();
            }
        }
        return list;
    }
    
}
