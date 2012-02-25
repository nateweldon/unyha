/**
 * Created by IntelliJ IDEA.
 * User: mgungor
 * Date: 8/24/11
 * Time: 8:48 AM
 * To change this template use File | Settings | File Templates.
 */

selectedRowName = "";
var selectedRowCells;
var rowSelected = false;

function getSelectedRowName()
{
    return selectedRowName
}

function highlightRow(row)
{
    var parent = row.parentNode;
    var trs = parent.getElementsByTagName('tr');

    for (var i = 0, ele; ele = trs[i]; i++)
    {
        if (ele.id == row.id)
        {
            selectedRowName = ele.id;
            changeRowColor(row);
        }
        else
        {
            ele.style.backgroundColor = "#ffffff";
            ele.style.color = "#000000";
        }
    }
}

function getSelectedRowCells()
{
    return selectedRowCells;
}

function highlightRowOnly(tr)
{
    addRemoveHighlight(tr);
    selectedRowCells = tr.getElementsByTagName('td');
}

function highlightRowWithEditDeleteEnableOrDisable(tr)
{
    addRemoveHighlightWithEditDeleteEnableOrDisable(tr);
    selectedRowCells = tr.getElementsByTagName('td');
    // This is only here to support previous implementation (highlightRow())
    selectedRowName = tr.id;
}

function addRemoveHighlightWithEditDeleteEnableOrDisable(element)
{
    // check if className has highlight
    var str = "highlight"
    if (element.className.indexOf(str) == -1)
    {
        removeHighlightFromAllRows();
        element.className = element.className + " " + str;
        setAhrefsClassName("enable",['edit','delete'])
        rowSelected = true;
    }
    else
    {
        element.className = element.className.replace(str, "");
        setAhrefsClassName("disable",['edit','delete'])
        rowSelected = false;
    }
}

function addRemoveHighlight(element)
{
    // check if className has highlight
    var str = "highlight"
    if (element.className.indexOf(str) == -1)
    {
        removeHighlightFromAllRows();
        element.className = element.className + " " + str;
        rowSelected = true;
    }
    else
    {
        element.className = element.className.replace(str, "");
        rowSelected = false;
    }
}

function removeHighlightFromAllRows()
{
    var str = "highlight";
    var trs = document.getElementsByTagName('tr');

    for (var i = 0, ele; ele = trs[i]; i++)
    {
        ele.className = ele.className.replace(str,"");
    }
}

function setAhrefsClassName(className,idArray)
{
    var ahrefs = document.getElementsByTagName('a');

    for (var i = 0, ele; ele = ahrefs[i]; i++)
    {
        for (var j = 0, id; id = idArray[j]; j++)
        {
            if (ele.id == id)
            {
                ele.className = className;
                updateImagesWithDisableOrEnable(className);
                break;
            }
        }
    }
}

function updateImagesWithDisableOrEnable(className)
{
    var d = document.getElementById('deleteImg');
    var e = document.getElementById('editImg');

    if (className == 'disable')
    {
        d.setAttribute('src',"/xeroxpresto/images/xerox/del_d.png");
        e.setAttribute('src',"/xeroxpresto/images/xerox/edit_box_d.png");
    }
    else
    {
        d.setAttribute('src',"/xeroxpresto/images/xerox/del.png");
        e.setAttribute('src',"/xeroxpresto/images/xerox/edit_box.png");
    }
}

function disableAhrefs()
{
    var ahrefs = document.getElementsByTagName('a');

    for (var i = 0, ele; ele = ahrefs[i]; i++)
    {
        ele.className = "disable";
    }
}



function changeRowColor(tableRow)
{
    var selected = false;

    if (tableRow.style.backgroundColor == "#ffffff" || tableRow.style.backgroundColor == "#1b84ce" || tableRow.style.backgroundColor == "rgb(27, 132, 206)")
    {
        if (tableRow.style.backgroundColor == "#ffffff")
        {
            tableRow.style.backgroundColor = "#1b84ce";
            tableRow.style.color = "#ffffff";
            selected = true;
        }
        else
        {
            tableRow.style.backgroundColor = "#ffffff";
            tableRow.style.color = "#000000";
        }
    }
    else
    {
        tableRow.style.backgroundColor = "#1b84ce";
        tableRow.style.color = "#ffffff";
        selected = true;
    }

    if (!selected)
    {
        selectedRowName = "";
    }
}