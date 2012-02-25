<%@ page import="webprojects.MemberJDO" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create MemberJDO</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">MemberJDO List</g:link></span>
        </div>
        <div class="body">
            <h1>Create MemberJDO</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${memberJDOInstance}">
            <div class="errors">
                <g:renderErrors bean="${memberJDOInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bjcpStatus">Bjcp Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'bjcpStatus','errors')}">
                                    <g:textField name="bjcpStatus" value="${fieldValue(bean: memberJDOInstance, field: 'bjcpStatus')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cellIncluded">Cell Included:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'cellIncluded','errors')}">
                                    <g:checkBox name="cellIncluded" value="${memberJDOInstance?.cellIncluded}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cellPhone">Cell Phone:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'cellPhone','errors')}">
                                    <g:textField name="cellPhone" value="${fieldValue(bean: memberJDOInstance, field: 'cellPhone')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city">City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'city','errors')}">
                                    <g:textField name="city" value="${memberJDOInstance?.city}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'email','errors')}">
                                    <g:textField name="email" value="${memberJDOInstance?.email}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="first">First:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'first','errors')}">
                                    <g:textField name="first" value="${memberJDOInstance?.first}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName">First Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'firstName','errors')}">
                                    <g:textField name="firstName" value="${memberJDOInstance?.firstName}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="homeIncluded">Home Included:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'homeIncluded','errors')}">
                                    <g:checkBox name="homeIncluded" value="${memberJDOInstance?.homeIncluded}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="homePhone">Home Phone:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'homePhone','errors')}">
                                    <g:textField name="homePhone" value="${fieldValue(bean: memberJDOInstance, field: 'homePhone')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="last">Last:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'last','errors')}">
                                    <g:textField name="last" value="${memberJDOInstance?.last}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName">Last Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'lastName','errors')}">
                                    <g:textField name="lastName" value="${memberJDOInstance?.lastName}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="property1">Property1:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'property1','errors')}">
                                    <g:textField name="property1" value="${memberJDOInstance?.property1}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startingBrewDate">Starting Brew Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'startingBrewDate','errors')}">
                                    <g:textField name="startingBrewDate" value="${fieldValue(bean: memberJDOInstance, field: 'startingBrewDate')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state">State:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'state','errors')}">
                                    <g:textField name="state" value="${memberJDOInstance?.state}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="street">Street:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'street','errors')}">
                                    <g:textField name="street" value="${memberJDOInstance?.street}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="streetAddress">Street Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'streetAddress','errors')}">
                                    <g:textField name="streetAddress" value="${memberJDOInstance?.streetAddress}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="zip">Zip:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'zip','errors')}">
                                    <g:textField name="zip" value="${fieldValue(bean: memberJDOInstance, field: 'zip')}" />
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
