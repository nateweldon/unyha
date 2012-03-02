<%@ page import="webprojects.ContestantJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>Create ContestantJDO</title>

</head>
<body>
<script type="text/javascript">
    $(function () {
        $("#createContestantJDO").validate({

            rules: {
                'firstName':{
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
                'lastName':{
                    required: true

                },
                'address':{
                    required: true
                },
                'state':{
                    required: true
                },
                'zip':{
                    required: true
                },
                'homePhone':{
                    required: true

                },
                'email':{
                    required: true,
                    email: true
                }
//
            },
            messages: {
                'firstName': {
                    required: "Enter First Name",
                    remote: "Old Password Does not Match"
                },
                'lastName': {
                    required: "Enter in Last Name"

                },
                'address':{
                    required: "Enter in Address"
                },
                'state':{
                    required: "Enter State"
                },
                'zip':{
                    required: "Enter Zip"
                },
                'homePhone':{
                    required: "Enter Home Phone",
                    phoneUS: "Please Enter a Phone Number"
                },
                'workPhone':{
                    phoneUS: "Please Enter a Phone Number"
                }
//
            }
        });
    });
</script>
<div class="nav">
    <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
    <span class="menuButton"><g:link class="list" action="list">ContestantJDO List</g:link></span>
</div>
<div class="body">
    <h1>Create ContestantJDO</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${contestantJDOInstance}">
        <div class="errors">
            <g:renderErrors bean="${contestantJDOInstance}" as="list" />
        </div>
    </g:hasErrors>
    <g:form id="createContestantJDO" name="createContestantJDO" action="save" method="post" >
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="firstName">First Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'firstName','errors')}">
                        <g:textField name="firstName" value="${contestantJDOInstance?.firstName}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="middleInitial">Middle Initial:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'middleInitial','errors')}">
                        <g:textField name="middleInitial" value="${contestantJDOInstance?.middleInitial}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="lastName">Last Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'lastName','errors')}">
                        <g:textField name="lastName" value="${contestantJDOInstance?.lastName}" />
                    </td>
                </tr>



                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="address">Address:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'address','errors')}">
                        <g:textField name="address" value="${contestantJDOInstance?.address}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="city">City:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'city','errors')}">
                        <g:textField name="city" value="${contestantJDOInstance?.city}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="state">State:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'state','errors')}">
                        <g:textField name="state" value="${contestantJDOInstance?.state}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="zip">Zip:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'zip','errors')}">
                        <g:textField name="zip" value="${fieldValue(bean: contestantJDOInstance, field: 'zip')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="homePhone">Home Phone:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'homePhone','errors')}">
                        <g:textField name="homePhone" value="${contestantJDOInstance?.homePhone}" />
                    </td>
                </tr>


                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="workPhone">Work Phone:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'workPhone','errors')}">
                        <g:textField name="workPhone" value="${contestantJDOInstance?.workPhone}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="email">Email:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'email','errors')}">
                        <g:textField name="email" value="${contestantJDOInstance?.email}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="clubInfo">Club Info:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'clubInfo','errors')}">
                        <g:textField name="clubInfo" value="${contestantJDOInstance?.clubInfo}" />
                    </td>
                </tr>


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
