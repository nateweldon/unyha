<%@ page import="webprojects.ContestantJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>ContestantJDO List</title>
</head>
<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
    <span class="menuButton"><g:link class="create" action="create">New ContestantJDO</g:link></span>
</div>
<div class="body">
    <h1>ContestantJDO List</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="Id" />
                <g:sortableColumn property="firstName" title="First Name" />

                <g:sortableColumn property="middleInitial" title="Middle Initial"/>

                <g:sortableColumn property="lastName" title="Last Name"/>
                <g:sortableColumn property="address" title="Address" />

                <g:sortableColumn property="city" title="City" />

                <g:sortableColumn property="state" title="State"/>
                <g:sortableColumn property="zip" title="Zip"/>
                <g:sortableColumn property="homePhone" title="Home Phone"/>
                <g:sortableColumn property="workPhone" title="Work Phone"/>

                <g:sortableColumn property="email" title="Email" />
                <g:sortableColumn property="clubInfo" title="Club Info" />




            </tr>
            </thead>
            <tbody>
            <g:each in="${contestantJDOInstanceList}" status="i" var="contestantJDOInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show" id="${contestantJDOInstance.id}">${fieldValue(bean:contestantJDOInstance, field:'id')}</g:link></td>

                    <td>${fieldValue(bean:contestantJDOInstance, field:'firstName')}</td>

                    <td>${fieldValue(bean:contestantJDOInstance, field:'middleInitial')}</td>

                    <td>${fieldValue(bean:contestantJDOInstance, field:'lastName')}</td>

                    <td>${fieldValue(bean:contestantJDOInstance, field:'address')}</td>

                    <td>${fieldValue(bean:contestantJDOInstance, field:'city')}</td>

                    <td>${fieldValue(bean:contestantJDOInstance, field:'state')}</td>

                    <td>${fieldValue(bean:contestantJDOInstance, field:'zip')}</td>

                    <td>${fieldValue(bean:contestantJDOInstance, field:'homePhone')}</td>

                    <td>${fieldValue(bean:contestantJDOInstance, field:'workPhone')}</td>

                    <td>${fieldValue(bean:contestantJDOInstance, field:'email')}</td>

                    <td>${fieldValue(bean:contestantJDOInstance, field:'clubInfo')}</td>





                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${contestantJDOInstanceTotal}" />
    </div>
</div>
</body>
</html>
