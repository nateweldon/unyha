package webprojects

import java.text.SimpleDateFormat


/**
 * Created by IntelliJ IDEA.
 * UserJDO: nweldon

 */
class TargetTagLib
{
    private static final String na = "n/a"

    /**
     * This is a wrapper for g:textField.  Except that it adds a property 'enabled'
     * that can be used to set the readonly field
     */
    def targetTextField = { attrs, body ->
        if (attrs?.enabled)
        {
            attrs.put('readonly', 'readonly')
        }
        attrs.remove('enabled')
        out << g.textField(attrs)
    }

    /**
     * Prints out a summary of the individual targets.  Pass in an argument of
     * target=PrinterTarget
     */
//    def printTargets = { attrs ->
//        xeroxpresto.PrinterTarget target = attrs.target
//        if (target)
//        {
//            xeroxpresto.PrinterTargetIndividualType[] individualType = xeroxpresto.PrinterTargetIndividualType.getFor(target.targetType)
//            individualType.each {
//                out << it.displayName << ": "
//                out << (it.use(target) ? it.value(target) : na)
//                out << "    "
//            }
//        }
//        else
//        {
//            out << "No Targets"
//        }
//    }

    /**
     * Create an array of hidden inputs holding the data for the PrinterTarget
     */
//    def targetHiddenInfo = { attrs ->
//        xeroxpresto.SerialNumberData_v8 serialNumberData = attrs.serialNumberData
//        xeroxpresto.PrinterTarget target = serialNumberData.target
//        String serialNumber = serialNumberData.serialNumber
//        def getInput = { fieldName, value ->
//            String.format('<input type="hidden" id="%s-%s" value="%s"/>', serialNumber, fieldName, value)
//        }
//        if (target)
//        {
//            out << getInput("targetType", target.targetType == xeroxpresto.PrinterTargetType.Impressions)
//
//            out << getInput("useBlackImpression", target.useBlackImpression)
//            out << getInput("blackImpression", target.blackImpressionsPPHGoal)
//            out << getInput("useColorImpression", target.useColorImpression)
//            out << getInput("colorImpression", target.colorImpressionsPPHGoal)
//
//            out << getInput("useSmallSheets", target.useSmallSheets)
//            out << getInput("smallSheets", target.smallSheetsPPHGoal)
//            out << getInput("useLargeSheets", target.useLargeSheets)
//            out << getInput("largeSheets", target.largeSheetsPPHGoal)
//            out << getInput("useXLargeSheets", target.useXLargeSheets)
//            out << getInput("xlargeSheets", target.xlargeSheetsPPHGoal)
//            out << getInput("useXXLargeSheets", target.useXXLargeSheets)
//            out << getInput("xxlargeSheets", target.xxlargeSheetsPPHGoal)
//            out << getInput("useXXXLargeSheets", target.useXXXLargeSheets)
//            out << getInput("xxxlargeSheets", target.xxxlargeSheetsPPHGoal)
//        }
//    }
//
//    def getActiveStatuses = { attrs ->
//        String serialNumber = attrs.serialNumber
//        StringBuilder sb = new StringBuilder()
//        xeroxpresto.ActiveStatuses_v2 statuses = xeroxpresto.ActiveStatuses_v2.findBySerialNumber(serialNumber)
//
//        if (statuses != null && statuses.shortStrings.length > 0)
//        {
//            String[] shortStrings = statuses.shortStrings
//
//            sb.append("<div style:\"padding-top: 0px\">")
//            int l = Math.min(shortStrings.length, 4)
//            for (int i = 0; i < l; i++)
//            {
//                if (i == (l - 1))
//                {
//                    sb.append(shortStrings[i])
//                }
//                else {
//                    sb.append(shortStrings[i]).append("<br>")
//                }
//
//            }
//            sb.append("</div>")
//        }
//
//
//        out << sb.toString()
//    }
//
//    def getCurrentState = { attrs ->
//        String serialNumber = attrs.serialNumber
//        String stateString = 'unknown'
//        String diagString = null
//
//        xeroxpresto.DeviceCurrentState currentState = xeroxpresto.DeviceCurrentState.findBySerialNumber(serialNumber)
//        if (currentState != null)
//        {
//            if (currentState.inDiag)
//            {
//                if (currentState.user != null && currentState.user.equals("psp"))
//                    diagString = "CSE Diagnostics"
//                else diagString = "UserJDO Diagnostics"
//            }
//
//            switch (currentState.currentState)
//            {
//                case xeroxpresto.PrintStationEventData_v8.State.Running:
//                    stateString = "Printing"
//                    break;
//                case xeroxpresto.PrintStationEventData_v8.State.Idle:
//                    stateString = "Idle"
//                    break;
//                case xeroxpresto.PrintStationEventData_v8.State.Off:
//                    stateString = "Off"
//                    break;
//                case xeroxpresto.PrintStationEventData_v8.State.Waiting:
//                    stateString = "Waiting"
//                    break;
//                case xeroxpresto.PrintStationEventData_v8.State.Disconnected:
//                    stateString = "Disconnected"
//                    break;
//            }
//        }
//
//        String stateToReturn = ""
//        if (diagString != null)
//            stateToReturn = diagString + "/"
//        out << stateToReturn + stateString
//    }
//
//    private static String STANDARD_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
//    private static SimpleDateFormat formatter = new SimpleDateFormat(STANDARD_DATE_FORMAT)
//
//    def getTimeOfLastPush = { attrs ->
//        String serialNumber = attrs.serialNumber
//        String ret = "unknown"
//        xeroxpresto.LastDataPush lastPush = xeroxpresto.LastDataPush.findBySerialNumber(serialNumber)
//        if (lastPush != null)
//        {
//            long time = lastPush.timeStamp
//            ret = formatter.format(new Date(time))
//        }
//
//        out << ret
//    }
}
