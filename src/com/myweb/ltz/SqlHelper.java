package com.myweb.ltz;

import java.sql.*;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Created by zogod on 2016/9/9.
 */
public class SqlHelper
{
    private static String url = "jdbc:mysql://localhost:3306/test";
    private static String jar = "com.mysql.jdbc.Driver";
    private static String username = "root";
    private static String password = "123456";

    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;
    private ResultSet rset;
    private CachedRowSetImpl crs;

    public CachedRowSetImpl Select(String sql)
    {
        try
        {
            Class.forName(jar);
            conn = DriverManager.getConnection(url, username, password);
            System.out.println(conn);
            stmt = conn.createStatement();
            rset = stmt.executeQuery(sql);
            crs = new CachedRowSetImpl();
            crs.populate(rset);
            Close();
            return crs;
        }
        catch (Exception e)
        {
            try{ Close(); }
            catch (Exception e2) { }
            return null;
        }
    }

    public void Close() throws SQLException
    {
        if (conn != null) conn.close();
        if (stmt != null) stmt.close();
        if (pstmt != null) pstmt.close();
        if (rset != null) rset.close();
    }

    public CachedRowSetImpl getRowSet()
    {
        return crs;
    }

}

