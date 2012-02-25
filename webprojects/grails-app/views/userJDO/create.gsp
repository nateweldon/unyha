<%@ page import="webprojects.UserJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Create UserJDO</title>
</head>

<body>


<div class="body">
    <div class="BodyContentContainer">
        <div class="ColumnContainer">

            <g:link controller="admin">Admin Home</g:link>
            <h1>Create UserJDO</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userJDOInstance}">
                <div class="errors">
                    <g:renderErrors bean="${userJDOInstance}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form action="save" method="post">
                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="accountExpired">Account Expired:</label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: userJDOInstance, field: 'accountExpired', 'errors')}">
                                <g:checkBox name="accountExpired" value="${userJDOInstance?.accountExpired}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="accountLocked">Account Locked:</label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: userJDOInstance, field: 'accountLocked', 'errors')}">
                                <g:checkBox name="accountLocked" value="${userJDOInstance?.accountLocked}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="enabled">Enabled:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userJDOInstance, field: 'enabled', 'errors')}">
                                <g:checkBox name="enabled" value="${userJDOInstance?.enabled}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="password">Password:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userJDOInstance, field: 'password', 'errors')}">
                                <g:textField name="password" value="${userJDOInstance?.password}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="passwordExpired">Password Expired:</label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: userJDOInstance, field: 'passwordExpired', 'errors')}">
                                <g:checkBox name="passwordExpired" value="${userJDOInstance?.passwordExpired}"/>
                            </td>
                        </tr>



                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="username">Username:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userJDOInstance, field: 'username', 'errors')}">
                                <g:textField name="username" value="${userJDOInstance?.username}"/>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create"/></span>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
