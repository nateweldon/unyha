// JavaScript for Modal Dialogs
function toggle(div_id)
{
    var el = document.getElementById(div_id);
    if (el.style.display == 'none')
    {
        el.style.display = 'block';
    }
    else
    {
        el.style.display = 'none';
    }
}
function blanket_size(popUpDivVar)
{
    var viewportheight;
    if (typeof window.innerWidth != 'undefined')
    {
        viewportheight = window.innerHeight;
    }
    else
    {
        viewportheight = document.documentElement.clientHeight;
    }
    var blanket_height;
    if ((viewportheight > document.body.parentNode.scrollHeight) && (viewportheight > document.body.parentNode.clientHeight))
    {
        blanket_height = viewportheight;
    }
    else
    {
        if (document.body.parentNode.clientHeight > document.body.parentNode.scrollHeight)
        {
            blanket_height = document.body.parentNode.clientHeight;
        }
        else
        {
            blanket_height = document.body.parentNode.scrollHeight;
        }
    }
    var blanket = document.getElementById('blanket');
    blanket.style.height = blanket_height + 'px';
    var popUpDiv = document.getElementById(popUpDivVar);
    // todo: calculate the value based on the height of the popup and the height of the screen
    var popUpDiv_height = 0;//blanket_height / 2 - (525/2);//262 is half popup's height
    popUpDiv.style.top = popUpDiv_height + 'px';
}
function window_pos(popUpDivVar)
{
    var viewportwidth;
    if (typeof window.innerWidth != 'undefined')
    {
        viewportwidth = window.innerHeight;
    }
    else
    {
        viewportwidth = document.documentElement.clientHeight;
    }
    var window_width;
    if ((viewportwidth > document.body.parentNode.scrollWidth) && (viewportwidth > document.body.parentNode.clientWidth))
    {
        window_width = viewportwidth;
    }
    else
    {
        if (document.body.parentNode.clientWidth > document.body.parentNode.scrollWidth)
        {
            window_width = document.body.parentNode.clientWidth;
        }
        else
        {
            window_width = document.body.parentNode.scrollWidth;
        }
    }
    var popUpDiv = document.getElementById(popUpDivVar);
    var divWidth = popUpDiv.offsetWidth;
    // todo: get the width fromt he div style
    window_width = viewportwidth / 2 - (525 / 2);
    popUpDiv.style.left = window_width + 'px';
}
function showById(id)
{
    var el = document.getElementById(id);
    if (el)
    {
        el.style.display = 'block';
    }
}
function closeBlanket()
{
    jQuery(document.getElementById('blanket')).hide();
}
function closePopup(id)
{
    var elementById = document.getElementById(id);
    var popup = jQuery(elementById);
    popup.hide();
    var blanket = jQuery(document.getElementById('blanket-' + id));
    blanket.hide();
}
function popup(windowname)
{
    blanket_size(windowname);
    window_pos(windowname);
    showById('blanket');
    showById('blanket-' + windowname);
    toggle(windowname);
}

function validatePopUp(windowname)
{
    if (selectedRowName != "")
    {
        popup(windowname);
    }
}

function validateSelectedRowCellPopUp(windowname)
{
    if (rowSelected == true)
    {
        popup(windowname);
    }
}
