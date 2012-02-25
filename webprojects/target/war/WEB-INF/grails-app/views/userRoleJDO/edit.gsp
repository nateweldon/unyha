<%@ page import="webprojects.UserRoleJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Edit UserRoleJDO</title>
</head>
<body>
<div class="body">
    <div class="BodyContentContainer">
        <div class="ColumnContainer">

            <g:link controller="admin">Admin Home</g:link>
            <h1>Edit UserRoleJDO</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userRoleJDOInstance}">
                <div class="errors">
                    <g:renderErrors bean="${userRoleJDOInstance}" as="list" />
                </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${userRoleJDOInstance?.id}" />
                <input type="hidden" name="version" value="${userRoleJDOInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="role">Role:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean:userRoleJDOInstance,field:'role','errors')}">
                                <g:select name="role.id" from="${webprojects.RoleJDO.list()}" optionKey="id" value="${userRoleJDOInstance?.role?.id}"  />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="user">User:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean:userRoleJDOInstance,field:'user','errors')}">
                                <g:select name="user.id" from="${webprojects.UserJDO.list()}" optionKey="id" value="${userRoleJDOInstance?.user?.id}"  />
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
