<%@ page import="org.grails.paypal.BuyerInformation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>BuyerInformation List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New BuyerInformation</g:link></span>
        </div>
        <div class="body">
            <h1>BuyerInformation List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="addressConfirmed" title="Address Confirmed" />
                        
                   	        <g:sortableColumn property="city" title="City" />
                        
                   	        <g:sortableColumn property="companyName" title="Company Name" />
                        
                   	        <g:sortableColumn property="country" title="Country" />
                        
                   	        <g:sortableColumn property="countryCode" title="Country Code" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${buyerInformationInstanceList}" status="i" var="buyerInformationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${buyerInformationInstance.id}">${fieldValue(bean:buyerInformationInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:buyerInformationInstance, field:'addressConfirmed')}</td>
                        
                            <td>${fieldValue(bean:buyerInformationInstance, field:'city')}</td>
                        
                            <td>${fieldValue(bean:buyerInformationInstance, field:'companyName')}</td>
                        
                            <td>${fieldValue(bean:buyerInformationInstance, field:'country')}</td>
                        
                            <td>${fieldValue(bean:buyerInformationInstance, field:'countryCode')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${buyerInformationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
