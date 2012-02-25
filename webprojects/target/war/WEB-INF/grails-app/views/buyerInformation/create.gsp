<%@ page import="org.grails.paypal.BuyerInformation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create BuyerInformation</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">BuyerInformation List</g:link></span>
        </div>
        <div class="body">
            <h1>Create BuyerInformation</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${buyerInformationInstance}">
            <div class="errors">
                <g:renderErrors bean="${buyerInformationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addressConfirmed">Address Confirmed:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'addressConfirmed','errors')}">
                                    <g:checkBox name="addressConfirmed" value="${buyerInformationInstance?.addressConfirmed}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city">City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'city','errors')}">
                                    <g:textField name="city" value="${buyerInformationInstance?.city}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="companyName">Company Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'companyName','errors')}">
                                    <g:textField name="companyName" value="${buyerInformationInstance?.companyName}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="country">Country:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'country','errors')}">
                                    <g:textField name="country" value="${buyerInformationInstance?.country}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="countryCode">Country Code:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'countryCode','errors')}">
                                    <g:textField name="countryCode" value="${buyerInformationInstance?.countryCode}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'email','errors')}">
                                    <g:textField name="email" value="${buyerInformationInstance?.email}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName">First Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'firstName','errors')}">
                                    <g:textField name="firstName" value="${buyerInformationInstance?.firstName}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName">Last Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'lastName','errors')}">
                                    <g:textField name="lastName" value="${buyerInformationInstance?.lastName}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phoneNumber">Phone Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'phoneNumber','errors')}">
                                    <g:textField name="phoneNumber" value="${buyerInformationInstance?.phoneNumber}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="receiverName">Receiver Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'receiverName','errors')}">
                                    <g:textField name="receiverName" value="${buyerInformationInstance?.receiverName}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state">State:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'state','errors')}">
                                    <g:textField name="state" value="${buyerInformationInstance?.state}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="street">Street:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'street','errors')}">
                                    <g:textField name="street" value="${buyerInformationInstance?.street}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="uniqueCustomerId">Unique Customer Id:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'uniqueCustomerId','errors')}">
                                    <g:textField name="uniqueCustomerId" value="${buyerInformationInstance?.uniqueCustomerId}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="zip">Zip:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:buyerInformationInstance,field:'zip','errors')}">
                                    <g:textField name="zip" value="${buyerInformationInstance?.zip}" />
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
