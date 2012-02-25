<%@ page import="webprojects.CalendarEventsJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Show CalendarEvents</title>
</head>
<body>


<div class="body">
    <div class="BodyContentContainer">
        <div class="ColumnContainer">
             <span class="button"><g:link controller="admin">Admin Home</g:link></span>

            <h1>Show CalendarEvents</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>


                    <tr class="prop">
                        <td valign="top" class="name">Id:</td>

                        <td valign="top" class="value">${fieldValue(bean:calendarEventsInstance, field:'id')}</td>

                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">Summary:</td>

                        <td valign="top" class="value">${fieldValue(bean:calendarEventsInstance, field:'summary')}</td>

                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">Day:</td>

                        <td valign="top" class="value">${fieldValue(bean:calendarEventsInstance, field:'day')}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">Month:</td>

                        <td valign="top" class="value">${fieldValue(bean:calendarEventsInstance, field:'month')}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">Property1:</td>

                        <td valign="top" class="value">${fieldValue(bean:calendarEventsInstance, field:'property1')}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">Year:</td>

                        <td valign="top" class="value">${fieldValue(bean:calendarEventsInstance, field:'year')}</td>

                    </tr>

                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${calendarEventsInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
