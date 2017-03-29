package com.myweb.ltz;

import com.sun.rowset.CachedRowSetImpl;

import java.sql.SQLException;

/**
 * Created by we on 2017/1/13.
 */
public class User
{
    private String username;
    private String password1;
    public boolean err;
    
    public User(String name1) throws SQLException
    {
        this.username = name1;
        String sql = "select password from student where username=?";
        CachedRowSetImpl crr = SqlHelper.Query(sql,this.username);
        try
        {
            if (crr.next())
            {
                this.password1 = crr.getString(1);
            }
            else
            {
                this.username = null;
            }
        }
        catch (SQLException e)
        {
            this.username = null;
            this.err = true;
        }
    }
    
    public int Longin(String password2)
    {
        if (this.err)
        {
            return 3;
        }
        else if (this.username == null)
        {
            return 0;
        }
        else if (this.password1.equals(password2))
        {
            return 1;
        }
        else
        {
            return 2;
        }
    }
    
}
