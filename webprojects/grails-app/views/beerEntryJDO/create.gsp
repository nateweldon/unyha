<%@ page import="webprojects.BeerEntryJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Create BeerEntryJDO</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $("#createBeerEntryJDO").validate({

            rules: {
                'name':{
                    required: true
                    %{--remote: {--}%
                    %{--url: "${createLink(controller:'admins', action:'validateAdmin',--}%
                    %{--params: [adminPassword: 'adminPassword'])}",--}%
                    %{--type: "post",--}%
                    %{--data: {--}%
                    %{--adminPassword: function() {--}%
                    %{--return $("#adminPassword").val();--}%
                    %{--}--}%
                    %{--}--}%
                    %{--}--}%
                },
                'catNum':{
                    required: true

                },
                'subCat':{
                    required: true

                }
//
            },
            messages: {
                'name': {
                    required: "Enter Beer Name"

                },
                'catNum': {
                    required: "Enter Category"


                },
                'subCat':{
                    required: "Enter SubCategory"
                }
//
            }
        });
    });
</script>
<div class="nav">
    <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
    <span class="menuButton"><g:link class="list" action="list">BeerEntryJDO List</g:link></span>
</div>
<div class="body">

    <h1>Create BeerEntryJDO</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${beerEntryJDOInstance}">
        <div class="errors">
            <g:renderErrors bean="${beerEntryJDOInstance}" as="list" />
        </div>
    </g:hasErrors>
    <g:form name="createBeerEntryJDO" id="createBeerEntryJDO" action="save" method="post" >
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
                        <label for="catNum">Category Num:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'catNum','errors')}">
                        %{--<g:textField name="catNum" value="${fieldValue(bean: beerEntryJDOInstance, field: 'catNum')}" />--}%
                        <g:select name="catNum" from="${beerCategory}" value="catNum" noSelection="['':'- Choose Category -']"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="subCat">SubCategory:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'subCat','errors')}">
                        %{--<g:textField name="subCat" value="${fieldValue(bean: beerEntryJDOInstance, field: 'subCat')}" />--}%
                       <g:select name="subCat" from="${'A'..'F'}" value="subCat" noSelection="['':'- Choose SubCategory -']"/>
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
            <span class="button"><input class="save" type="submit" value="Create" /></span>
        </div>
    </g:form>
</div>
</body>
</html>
