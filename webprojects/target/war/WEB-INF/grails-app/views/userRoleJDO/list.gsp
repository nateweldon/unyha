<%@ page import="webprojects.UserRoleJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>UserRoleJDO List</title>
</head>
<body>
<div class="body">
    <div class="BodyContentContainer">
        <div class="ColumnContainer">

            <g:link controller="admin">Admin Home</g:link>
            <h1>UserRoleJDO List</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                    <tr>

                        <g:sortableColumn property="id" title="Id" />

                        <th>Role</th>

                        <th>User</th>

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userRoleJDOInstanceList}" status="i" var="userRoleJDOInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show" id="${userRoleJDOInstance.id}">${fieldValue(bean:userRoleJDOInstance, field:'id')}</g:link></td>

                            <td>${fieldValue(bean:userRoleJDOInstance, field:'role')}</td>

                            <td>${fieldValue(bean:userRoleJDOInstance, field:'user')}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${userRoleJDOInstanceTotal}" />
            </div>
        </div>
    </div>
</div>
</body>
</html>
