<%@ page import="webprojects.MemberJDO" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show MemberJDO</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">MemberJDO List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New MemberJDO</g:link></span>
        </div>
        <div class="body">
            <h1>Show MemberJDO</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Bjcp Status:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'bjcpStatus')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Cell Included:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'cellIncluded')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Cell Phone:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'cellPhone')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">City:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'city')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Email:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'email')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">First:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'first')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">First Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'firstName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Home Included:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'homeIncluded')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Home Phone:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'homePhone')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'last')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'lastName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Property1:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'property1')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Starting Brew Date:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'startingBrewDate')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">State:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'state')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Street:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'street')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Street Address:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'streetAddress')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Zip:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:memberJDOInstance, field:'zip')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${memberJDOInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
