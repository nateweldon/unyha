<%@ page import="webprojects.RoleJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Edit RoleJDO</title>
</head>

<body>


<div class="body">
    <div class="BodyContentContainer">
        <div class="ColumnContainer">

            <g:link controller="admin">Admin Home</g:link>
            <h1>Edit RoleJDO</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${roleJDOInstance}">
                <div class="errors">
                    <g:renderErrors bean="${roleJDOInstance}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form method="post">
                <input type="hidden" name="id" value="${roleJDOInstance?.id}"/>
                <input type="hidden" name="version" value="${roleJDOInstance?.version}"/>

                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="authority">Authority:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: roleJDOInstance, field: 'authority', 'errors')}">
                                <g:textField name="authority" value="${roleJDOInstance?.authority}"/>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update"/></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');"
                                                         value="Delete"/></span>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
