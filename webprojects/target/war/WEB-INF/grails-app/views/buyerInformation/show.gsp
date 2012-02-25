<%@ page import="org.grails.paypal.BuyerInformation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show BuyerInformation</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">BuyerInformation List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New BuyerInformation</g:link></span>
        </div>
        <div class="body">
            <h1>Show BuyerInformation</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Address Confirmed:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'addressConfirmed')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">City:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'city')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Company Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'companyName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Country:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'country')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Country Code:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'countryCode')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Email:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'email')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">First Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'firstName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'lastName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Phone Number:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'phoneNumber')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Receiver Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'receiverName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">State:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'state')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Street:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'street')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Unique Customer Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'uniqueCustomerId')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Zip:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:buyerInformationInstance, field:'zip')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${buyerInformationInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
