/**
 * Created by we on 2017/3/29.
 */
function ajax(url, onSuccess)
{
    var xmlhttp = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft XMLHTTP');
    xmlhttp.open("POST", url, true);
    xmlhttp.setAttribute();
    xmlhttp.send();

    xmlhttp.onreadystatechange = function ()
    {
        if (xmlhttp.readyState == 4)
        {
            if (xmlhttp.status == 200)
            {
                onSuccess(xmlhttp.responseText);
            }
            else
            {
                alert("Ajax return Error");
            }
        }
    }
}