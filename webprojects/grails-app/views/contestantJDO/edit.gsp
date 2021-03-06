<%@ page import="webprojects.ContestantJDO" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit ContestantJDO</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ContestantJDO List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ContestantJDO</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ContestantJDO</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${contestantJDOInstance}">
            <div class="errors">
                <g:renderErrors bean="${contestantJDOInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${contestantJDOInstance?.id}" />
                <input type="hidden" name="version" value="${contestantJDOInstance?.version}" />
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
