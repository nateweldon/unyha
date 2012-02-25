<%@ page import="webprojects.CalendarEventsJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>CalendarEvents List</title>
</head>
<body>
<div class="body">
    <div class="BodyContentContainer">
        <div class="ColumnContainer">

            <g:link controller="admin">Admin Home</g:link>
            <h1>CalendarEvents List</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                    <tr>

                        <g:sortableColumn property="id" title="Id" />

                        <g:sortableColumn property="title" title="Title"/>

                        <g:sortableColumn property="date" title="Date" />



                        <g:sortableColumn property="summary" title="Summary"/>
                        <g:sortableColumn property="location" title="Location"/>

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${calendarEventsInstanceList}" status="i" var="calendarEventsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${calendarEventsInstance.id}">${fieldValue(bean:calendarEventsInstance, field:'id')}</g:link></td>
                            <td>${fieldValue(bean:calendarEventsInstance, field:'title')}</td>

                            <td>${fieldValue(bean:calendarEventsInstance, field:'eventDate')}</td>
                            <td>${fieldValue(bean:calendarEventsInstance, field:'summary')}</td>
                            <td>${fieldValue(bean:calendarEventsInstance, field:'location')}</td>




                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">--}%
                %{--<g:paginate total="${calendarEventsInstanceTotal}" />--}%
            %{--</div>--}%
        </div>
    </div>
</div>
</body>
</html>
