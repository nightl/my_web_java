package com.myweb.ltz;

/**
 * Created by we on 2017/1/13.
 */
public class User
{
    private String name;
    private String password;
    private String message;
    
    User(String name1, String password1, String message1)
    {
        this.name = name1;
        this.password = password1;
        this.message = message1;
    }
    
    public String Getname()
    {
        return name;
    }
    
    public String Getpassword()
    {
        return password;
    }
    
    public String Getmessage()
    {
        return message;
    }
}
