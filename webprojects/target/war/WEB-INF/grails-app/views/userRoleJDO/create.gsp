<%@ page import="webprojects.RoleJDO; webprojects.UserRoleJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Create UserRoleJDO</title>
</head>
<body>
<div class="body">
    <div class="BodyContentContainer">
        <div class="ColumnContainer">

            <g:link controller="admin">Admin Home</g:link>
            <h1>Create UserRoleJDO</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userRoleJDOInstance}">
                <div class="errors">
                    <g:renderErrors bean="${userRoleJDOInstance}" as="list" />
                </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="role">Role:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean:userRoleJDOInstance,field:'role','errors')}">
                                <g:select name="role.id" from="${roleJDOInstanceList}" optionKey="id" value="${userRoleJDOInstance?.role?.id}"  />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="user">User:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean:userRoleJDOInstance,field:'user','errors')}">
                                <g:select name="user.id" from="${userJDOInstanceList}" optionKey="id" value="${userRoleJDOInstance?.user?.id}"  />
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
