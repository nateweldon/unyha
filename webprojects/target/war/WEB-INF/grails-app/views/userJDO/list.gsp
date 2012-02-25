<%@ page import="webprojects.UserJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>UserJDO List</title>
</head>

<body>
<div class="body">
    <div class="BodyContentContainer">
        <div class="ColumnContainer">

            <g:link controller="admin">Admin Home</g:link>
            <h1>UserJDO List</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                    <tr>

                        <g:sortableColumn property="id" title="Id"/>

                        <g:sortableColumn property="username" title="Username"/>

                        <g:sortableColumn property="password" title="Password"/>

                        <g:sortableColumn property="passwordExpired" title="Password Expired"/>

                        <g:sortableColumn property="accountExpired" title="Account Expired"/>

                        <g:sortableColumn property="accountLocked" title="Account Locked"/>

                        <g:sortableColumn property="enabled" title="Enabled"/>



                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userJDOInstanceList}" status="i" var="userJDOInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show"
                                        id="${userJDOInstance.id}">${fieldValue(bean: userJDOInstance, field: 'id')}</g:link></td>

                            <td>${fieldValue(bean: userJDOInstance, field: 'username')}</td>
                            <td>${fieldValue(bean: userJDOInstance, field: 'password')}</td>

                            <td>${fieldValue(bean: userJDOInstance, field: 'passwordExpired')}</td>

                            <td>${fieldValue(bean: userJDOInstance, field: 'accountExpired')}</td>

                            <td>${fieldValue(bean: userJDOInstance, field: 'accountLocked')}</td>

                            <td>${fieldValue(bean: userJDOInstance, field: 'enabled')}</td>


                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

            <div class="paginateButtons">
                <g:paginate total="${userJDOInstanceTotal}"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>
