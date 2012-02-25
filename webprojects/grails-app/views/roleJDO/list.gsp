<%@ page import="webprojects.RoleJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>RoleJDO List</title>
</head>

<body>


<div class="body">
    <div class="BodyContentContainer">
        <div class="ColumnContainer">

            <g:link controller="admin">Admin Home</g:link>
            <h1>RoleJDO List</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                    <tr>

                        <g:sortableColumn property="id" title="Id"/>

                        <g:sortableColumn property="authority" title="Authority"/>

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${roleJDOInstanceList}" status="i" var="roleJDOInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="show"
                                        id="${roleJDOInstance.id}">${fieldValue(bean: roleJDOInstance, field: 'id')}</g:link></td>

                            <td>${fieldValue(bean: roleJDOInstance, field: 'authority')}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

            <div class="paginateButtons">
                <g:paginate total="${roleJDOInstanceTotal}"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>
