package com.myweb.ltz;

/**
 * Created by we on 2017/1/17.
 */
public class ErrorMessage
{
    private String error1;
    private String error2;
    
    public ErrorMessage(String error11,String error12)
    {
        this.error1 = error11;
        this.error2 = error12;
    }
    
    public String GetError1()
    {
        return error1;
    }
    
    public String GetError2()
    {
        return error2;
    }
}
