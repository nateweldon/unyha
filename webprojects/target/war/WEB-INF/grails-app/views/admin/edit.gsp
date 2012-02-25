<%@ page import="webprojects.CalendarEventsJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Edit CalendarEvents</title>
</head>
<body>

<div class="body">
    <div class="BodyContentContainer">
        <div class="ColumnContainer">

            <g:link controller="admin">Admin Home</g:link>
            <h1>Edit CalendarEvents</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${calendarEventsInstance}">
                <div class="errors">
                    <g:renderErrors bean="${calendarEventsInstance}" as="list" />
                </div>
            </g:hasErrors>
            <g:form controller="calendarEvents" method="post" >
                <input type="hidden" name="id" value="${calendarEventsInstance?.id}" />
                <input type="hidden" name="version" value="${calendarEventsInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                                            <td valign="top" class="name">
                                                <label for="title">Title:</label>
                                            </td>
                                            <td valign="top" class="value ${hasErrors(bean:calendarEventsInstance,field:'title','errors')}">
                                                %{--<g:textField name="day" value="${calendarEventsInstance?.day}" />--}%
                                                <input id="title" class="textbox normal required" type="text" name="title" minlength="2" size="35"/>
                                            </td>
                                        </tr>


                                        <tr class="prop">
                                            <td valign="top" class="name">
                                                <label >Date:</label>
                                            </td>
                                            <td valign="top" class="value ${hasErrors(bean:calendarEventsInstance,field:'date','errors')}">
                                                %{--<g:textField name="day" value="${calendarEventsInstance?.day}" />--}%
                                                <input type="text" id="datepicker">

                                            </td>
                                        </tr>

                                           <tr class="prop">
                                            <td valign="top" class="name">
                                                <label >All Day:</label>
                                            </td>
                                            <td valign="top" class="value ${hasErrors(bean:calendarEventsInstance,field:'allDay','errors')}">
                                                <input type="checkbox" id="allDay">

                                            </td>
                                        </tr>
                                           <tr class="prop">
                                            <td valign="top" class="name">
                                                <label >Start Time:</label>
                                            </td>
                                            <td valign="top" class="value ${hasErrors(bean:calendarEventsInstance,field:'date','errors')}">
                                                %{--<g:textField name="day" value="${calendarEventsInstance?.day}" />--}%
                                                <g:select name="startHour" from="1..12"/>
                                                <g:select name="startMin" from="0..59"/>
                                                <g:select name="startAMPM" from="${['am', 'pm']}"/>

                                            </td>
                                        </tr>

                                           </tr>
                                           <tr class="prop">
                                            <td valign="top" class="name">
                                                <label >End Time:</label>
                                            </td>
                                            <td valign="top" class="value ${hasErrors(bean:calendarEventsInstance,field:'date','errors')}">
                                                %{--<g:textField name="day" value="${calendarEventsInstance?.day}" />--}%
                                                <g:select name="endHour" from="1..12"/>
                                                <g:select name="endMin" from="0..59"/>
                                                <g:select name="endAMPM" from="${['am', 'pm']}"/>

                                            </td>
                                        </tr>

                                        <tr class="prop">
                                            <td valign="top" class="name">
                                                <label for="summary">Summary:</label>
                                            </td>
                                            <td valign="top" class="value ${hasErrors(bean:calendarEventsInstance,field:'summary','errors')}">
                                                %{--<g:textField name="day" value="${calendarEventsInstance?.day}" />--}%
                                                <input id="summary" class="textbox normal required" type="text" name="summary" minlength="2" size="35"/>
                                            </td>
                                        </tr>

                                        <tr class="prop">
                                            <td valign="top" class="name">
                                                <label for="location">Location:</label>
                                            </td>
                                            <td valign="top" class="value ${hasErrors(bean:calendarEventsInstance,field:'Location','errors')}">
                                                %{--<g:textField name="day" value="${calendarEventsInstance?.day}" />--}%
                                               <g:textArea name="location" rows="3" cols="3"/>
                                                %{--<input id="Location" class="textbox normal required" type="text" name="Location" minlength="2" size="100"/>--}%
                                            </td>
                                        </tr>


                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </div>
</div>

</body>
</html>
