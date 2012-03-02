<%@ page import="webprojects.BeerEntryJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Edit BeerEntryJDO</title>
</head>
<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
    <span class="menuButton"><g:link class="list" action="list">BeerEntryJDO List</g:link></span>
    <span class="menuButton"><g:link class="create" action="create">New BeerEntryJDO</g:link></span>
</div>
<div class="body">
    <h1>Edit BeerEntryJDO</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${beerEntryJDOInstance}">
        <div class="errors">
            <g:renderErrors bean="${beerEntryJDOInstance}" as="list" />
        </div>
    </g:hasErrors>
    <g:form method="post" >
        <input type="hidden" name="id" value="${beerEntryJDOInstance?.id}" />
        <input type="hidden" name="version" value="${beerEntryJDOInstance?.version}" />
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="name">Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'name','errors')}">
                        <g:textField name="name" value="${beerEntryJDOInstance?.name}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="catNum">Cat Num:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'catNum','errors')}">
                        <g:textField name="catNum" value="${fieldValue(bean: beerEntryJDOInstance, field: 'catNum')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="subCat">Sub Cat:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'subCat','errors')}">
                        <g:textField name="subCat" value="${fieldValue(bean: beerEntryJDOInstance, field: 'subCat')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="ingredients">Ingredients:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'ingredients','errors')}">
                        <g:textField name="ingredients" value="${beerEntryJDOInstance?.ingredients}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="comments">Comments:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'comments','errors')}">
                        <g:textField name="comments" value="${beerEntryJDOInstance?.comments}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="additionalBrewers">Additional Brewers:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'additionalBrewers','errors')}">
                        <g:textField name="additionalBrewers" value="${beerEntryJDOInstance?.additionalBrewers}" />
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
</body>
</html>
