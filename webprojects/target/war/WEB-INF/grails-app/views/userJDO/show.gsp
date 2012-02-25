<%@ page import="webprojects.UserJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show UserJDO</title>
</head>

<body>
<div class="body">
    <div class="BodyContentContainer">
        <div class="ColumnContainer">

            <g:link controller="admin">Admin Home</g:link>
            <h1>Show UserJDO</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">Id:</td>

                        <td valign="top" class="value">${fieldValue(bean: userJDOInstance, field: 'id')}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">Account Expired:</td>

                        <td valign="top" class="value">${fieldValue(bean: userJDOInstance, field: 'accountExpired')}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">Account Locked:</td>

                        <td valign="top" class="value">${fieldValue(bean: userJDOInstance, field: 'accountLocked')}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">Authorities:</td>

                        <td valign="top" class="value">${fieldValue(bean: userJDOInstance, field: 'authorities')}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">Enabled:</td>

                        <td valign="top" class="value">${fieldValue(bean: userJDOInstance, field: 'enabled')}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">Password:</td>

                        <td valign="top" class="value">${fieldValue(bean: userJDOInstance, field: 'password')}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">Password Expired:</td>

                        <td valign="top" class="value">${fieldValue(bean: userJDOInstance, field: 'passwordExpired')}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">Spring Security Service:</td>

                        <td valign="top" class="value">${fieldValue(bean: userJDOInstance, field: 'springSecurityService')}</td>

                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">Username:</td>

                        <td valign="top" class="value">${fieldValue(bean: userJDOInstance, field: 'username')}</td>

                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${userJDOInstance?.id}"/>
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
