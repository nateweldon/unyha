/**
 * Created by IntelliJ IDEA.
 * UserJDO: jlmessme
 * Date: 8/23/11
 * Time: 10:21 PM
 * To change this template use File | Settings | File Templates.
 */

function toggle2(divId)
{
    var divs = document.getElementsByTagName('div');

    for (var i = 0, ele; ele = divs[i]; i++)
    {
        if (ele.id == divId)
        {
            if (ele.style.display == "block")
            {
                ele.style.display = "none";
            }
            else
            {
                ele.style.display = "block";
            }
        }
    }
}

function updateClassName(divID,response)
{
    var divs = document.getElementsByTagName('div');

    for (var i = 0, ele; ele = divs[i]; i++)
    {
        if (ele.id == divID)
        {
            ele.className = response.responseText;
        }
    }
}

function showTitleBaseOnDisplay(divId,titleId,showTitle,hideTitle)
{
    var ele = document.getElementById(divId);
    var elet = document.getElementById(titleId);
    if (ele.style.display == "block")
    {
        elet.title = hideTitle;
    }
    else
    {
        elet.title = showTitle;
    }
}

function getTimeZoneUTCDST()
{
    var d = new Date('1/1/' + (new Date()).getUTCFullYear());
   /* var intOffset = 0;*/
    var intOffset = 10000; //set initial offset high so it is adjusted on the first attempt
    var intMonth;
    var intHoursUtc;
    var intHours;
    var intDaysMultiplyBy;

    //go through each month to find the lowest offset to account for DST
    for (intMonth=0;intMonth < 12;intMonth++)
    {
        //go to the next month
        d.setUTCMonth(d.getUTCMonth() + 1);

        //To ignore daylight saving time look for the lowest offset.
        //Since, during DST, the clock moves forward, it'll be a bigger number.
        /*if (!intOffset || intOffset > (d.getTimezoneOffset() * (-1)))*/
        if (intOffset > (d.getTimezoneOffset() * (-1)))
        {
            intOffset = (d.getTimezoneOffset() * (-1));
        }
    }

    return intOffset;
}

// does not reflect day light saving time
function getTimeZoneOffsetMinutes()
{
    var offset = new Date().getTimezoneOffset();
    return offset;
}

// does not reflect day light saving time
function getTimeZoneOffsetHours()
{
    var offset = new Date().getTimezoneOffset()/60;
    return offset;
}

function getBrowserTimeFromEpoch(epoch)
{
    var localeString = new Date(epoch).toLocaleString();
    return localeString;
}
