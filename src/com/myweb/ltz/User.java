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
    private String password2;
    private String name;
    private String email;
    private String gender;
    private int age;
    private int stuid;
    private String permission;
    public boolean signed = true;
    public boolean err;
    
    public User(String name1) throws SQLException
    {
        this.username = name1;
        String sql = "select password, gender, name, age, stuid, permission from student where username=?";
        CachedRowSetImpl crr = SqlHelper.Query(sql,this.username);
        try
        {
            if (crr.next())
            {
                this.password1 = crr.getString(1);
                this.gender = crr.getString(2);
                this.name = crr.getString(3);
                this.age = crr.getInt(4);
                this.stuid = crr.getInt(5);
                this.permission = crr.getString(6);
            }
            else
            {
                this.signed = false;
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
        else if (!this.signed)
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
    
    public int SignUp(String password1, String password2,String gender,  String name, int age, int stuid)
    {
        if (!this.signed)
        {
            this.password1 = password1;
            this.password2 = password2;
            this.gender = gender;
            this.name = name;
            this.age = age;
            this.stuid = stuid;
            this.permission = "普通用户";
            
            String sql1 = "insert into student values(? , ? , ? , ? , ? , ? , ?)";
            SqlHelper.NoneQuery(sql1, this.username, this.password1, this.gender, this.name, this.age, this.stuid, this.permission);
            return 1;
        }
        else
        {
            return 2;
        }
    }
    
}
