function showImpressions()
{
    jQuery(document.getElementById('impressions')).show();
    jQuery(document.getElementById('sheets')).hide();
    updateOverallImpressions();
}

function updateImpressions()
{
    var useBlackImpressionCheckbox = jQuery(document.getElementById('useBlackImpression'));
    var blackImpressionsTextbox = jQuery(document.getElementById('blackImpressionsTarget'));
    var useBlackImpressions = useBlackImpressionCheckbox.is(':checked');
    if (!useBlackImpressions)
    {
        blackImpressionsTextbox.addClass('dis');
    }
    else
    {
        blackImpressionsTextbox.removeClass('dis');
    }
    blackImpressionsTextbox.attr('readonly', !useBlackImpressions);

    var useColorImpressions = jQuery(document.getElementById('useColorImpression')).is(':checked');
    var colorImpressionTextbox = jQuery(document.getElementById('colorImpressionsTarget'));
    if (useColorImpressions)
    {
        colorImpressionTextbox.removeClass('dis');
    }
    else
    {
        colorImpressionTextbox.addClass('dis');
    }
    colorImpressionTextbox.attr('readonly', !useColorImpressions);

    updateOverallImpressions()
}

function useXLargeSheets()
{
    return jQuery(document.getElementById('useXLargeSheets')).is(':checked');
}
function edit_target_get_id(id)
{
    return jQuery(document.getElementById(id));
}
function useXXLargeSheets()
{
    return jQuery(document.getElementById('useXXLargeSheets')).is(':checked');
}
function updateSheets()
{
    var useSmallSheets = jQuery(document.getElementById('useSmallSheets')).is(':checked');
    var smallSheetsTextbox = jQuery(document.getElementById('smallSheetsTarget'));
    if (useSmallSheets)
    {
        smallSheetsTextbox.removeClass('dis');
    }
    else
    {
        smallSheetsTextbox.addClass('dis');
    }
    smallSheetsTextbox.attr('readonly', !useSmallSheets);

    var useLargeSheets = jQuery(document.getElementById('useLargeSheets')).is(':checked');
    var largeSheetsTextbox = jQuery(document.getElementById('largeSheetsTarget'));
    if (useLargeSheets)
    {
        largeSheetsTextbox.removeClass('dis');
    }
    else
    {
        largeSheetsTextbox.addClass('dis');
    }
    largeSheetsTextbox.attr('readonly', !useLargeSheets);

    var xLargeSheetsTextbox = edit_target_get_id('xlargeSheetsTarget');
    if (useXLargeSheets())
    {
        xLargeSheetsTextbox.removeClass('dis');
    }
    else
    {
        xLargeSheetsTextbox.addClass('dis');
    }
    xLargeSheetsTextbox.attr('readonly', !useXLargeSheets());

    var xxLargeSheetsTextbox = edit_target_get_id('xxlargeSheetsTarget');
    if (useXXLargeSheets())
    {
        xxLargeSheetsTextbox.removeClass('dis');
    }
    else
    {
        xxLargeSheetsTextbox.addClass('dis');
    }
    xxLargeSheetsTextbox.attr('readonly', !useXXLargeSheets());

    var xxxLargeSheetsTextbox = edit_target_get_id('xxxlargeSheetsTarget');
    if (useXXXLargeSheets())
    {
        xxxLargeSheetsTextbox.removeClass('dis');
    }
    else
    {
        xxxLargeSheetsTextbox.addClass('dis');
    }
    xxxLargeSheetsTextbox.attr('readonly', !useXXXLargeSheets());

    updateOverallSheets();
}

function useXXXLargeSheets()
{
    return edit_target_get_id('useXXXLargeSheets').is(':checked');
}

function showSheets()
{
    edit_target_get_id('sheets').show();
    edit_target_get_id('impressions').hide();
    updateOverallSheets();
}

function updateOverallImpressions()
{
    var overall = 0;
    if (edit_target_get_id('useBlackImpression').is(':checked'))
    {
        overall = overall + parseInt(edit_target_get_id('blackImpressionsTarget').val());
    }
    if (edit_target_get_id('useColorImpression').is(':checked'))
    {
        overall = overall + parseInt(edit_target_get_id('colorImpressionsTarget').val());
    }
    if (!overall)
        overall = 0;
    edit_target_get_id("overallImpressions").val(overall)
}

function updateOverallSheets()
{
    var overall = 0;
    if (edit_target_get_id('useSmallSheets').is(':checked'))
    {
        overall = overall + parseInt(edit_target_get_id("smallSheetsTarget").val());
    }
    if (edit_target_get_id('useLargeSheets').is(':checked'))
    {
        overall = overall + parseInt(edit_target_get_id("largeSheetsTarget").val());
    }
    if (useXLargeSheets())
    {
        overall = overall + parseInt(edit_target_get_id("xlargeSheetsTarget").val());
    }
    if (useXXLargeSheets())
    {
        overall = overall + parseInt(edit_target_get_id("xxlargeSheetsTarget").val());
    }
    if (useXXXLargeSheets())
    {
        overall = overall + parseInt(edit_target_get_id("xxxlargeSheetsTarget").val());
    }
    if (!overall)
        overall = 0;
    edit_target_get_id("overallSheets").val(overall)
}


function updateTargetSelection(serialNumber)
{
    // hide all target panels
//    var allDivs = $('div[id^="TargetDetails-"]');
//    if (allDivs) allDivs.hide();
    if (serialNumber != null)
    {
        // show just the desired target panel
        var element = document.getElementById('TargetDetails-' + serialNumber);
        var detailsPanel = jQuery(element);
        var parent = element.parentNode;
        var divs = parent.getElementsByTagName('div');
        for (var i = 0, ele; ele = divs[i]; i++)
        {
            jQuery(ele).hide();
        }
        detailsPanel.show();
        // update hidden variable
        edit_target_get_id('targetSerialNumber').val(serialNumber);
    }
}

function updatePrinterTarget()
{
    function setCheckbox(id, value)
    {
        if (value)
        {
            edit_target_get_id(id).attr('checked', true);
        }
        else
        {
            edit_target_get_id(id).removeAttr('checked');
        }
    }

    var serialNumber = edit_target_get_id('targetSerialNumber').val();
    if (serialNumber)
    {

        // parse data
        const TRUE = 'true';
        var targetTypeInput = edit_target_get_id('' + serialNumber + '-targetType');
        if (! targetTypeInput.length)
        {
            // if no target data then close pop up
            closePopup('GetTargetsPopUp');
            return;
        }
        var targetTypeIsImpression = targetTypeInput.val() === TRUE;
        var useBlackImpression = edit_target_get_id('' + serialNumber + '-useBlackImpression').val() === TRUE;
        var blackImpression = parseInt(edit_target_get_id('' + serialNumber + '-blackImpression').val());
        var useColorImpression = edit_target_get_id('' + serialNumber + '-useColorImpression').val() === TRUE;
        var colorImpression = parseInt(edit_target_get_id('' + serialNumber + '-colorImpression').val());

        var useSmallSheets = edit_target_get_id('' + serialNumber + '-useSmallSheets').val() === TRUE;
        var smallSheets = parseInt(edit_target_get_id('' + serialNumber + '-smallSheets').val());
        var useLargeSheets = edit_target_get_id('' + serialNumber + '-useLargeSheets').val() === TRUE;
        var largeSheets = parseInt(edit_target_get_id('' + serialNumber + '-largeSheets').val());
        var useXLargeSheets = edit_target_get_id('' + serialNumber + '-useXLargeSheets').val() === TRUE;
        var xlargeSheets = parseInt(edit_target_get_id('' + serialNumber + '-xlargeSheets').val());
        var useXXLargeSheets = edit_target_get_id('' + serialNumber + '-useXXLargeSheets').val() === TRUE;
        var xxlargeSheets = parseInt(edit_target_get_id('' + serialNumber + '-xxlargeSheets').val());
        var useXXXLargeSheets = edit_target_get_id('' + serialNumber + '-useXXXLargeSheets').val() === TRUE;
        var xxxlargeSheets = parseInt(edit_target_get_id('' + serialNumber + '-xxxlargeSheets').val());

        // set values
        if (targetTypeIsImpression)
        {
            edit_target_get_id('Radio1').attr('checked', true);
        }
        else
        {
            edit_target_get_id('Radio2').attr('checked', true);
        }
        setCheckbox('useBlackImpression', useBlackImpression);
        edit_target_get_id('blackImpressionsTarget').val(blackImpression);
        setCheckbox('useColorImpression', useColorImpression);
        edit_target_get_id('colorImpressionsTarget').val(colorImpression);


        setCheckbox('useSmallSheets', useSmallSheets);
        edit_target_get_id('smallSheetsTarget').val(smallSheets);
        setCheckbox('useLargeSheets', useLargeSheets);
        edit_target_get_id('largeSheetsTarget').val(largeSheets);
        setCheckbox('useXLargeSheets', useXLargeSheets);
        edit_target_get_id('xlargeSheetsTarget').val(xlargeSheets);
        setCheckbox('useXXLargeSheets', useXXLargeSheets);
        edit_target_get_id('xxlargeSheetsTarget').val(xxlargeSheets);
        setCheckbox('useXXXLargeSheets', useXXXLargeSheets);
        edit_target_get_id('xxxlargeSheetsTarget').val(xxxlargeSheets);

        // refresh ui
        updateImpressions();
        updateSheets();
        if (targetTypeIsImpression)
        {
            showImpressions();
        }
        else
        {
            showSheets();
        }
    }
    closePopup('GetTargetsPopUp')
}
