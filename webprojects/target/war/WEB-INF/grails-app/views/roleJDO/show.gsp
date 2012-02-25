<%@ page import="webprojects.RoleJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show RoleJDO</title>
</head>

<body>


<div class="body">
    <div class="BodyContentContainer">
        <div class="ColumnContainer">

            <g:link controller="admin">Admin Home</g:link>
            <h1>Show RoleJDO</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">Id:</td>

                        <td valign="top" class="value">${fieldValue(bean: roleJDOInstance, field: 'id')}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">Authority:</td>

                        <td valign="top" class="value">${fieldValue(bean: roleJDOInstance, field: 'authority')}</td>

                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${roleJDOInstance?.id}"/>
                    <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');"
                                                         value="Delete"/></span>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
