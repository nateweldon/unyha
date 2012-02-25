<%@ page import="webprojects.MemberJDO" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>MemberJDO List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New MemberJDO</g:link></span>
        </div>
        <div class="body">
            <h1>MemberJDO List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="bjcpStatus" title="Bjcp Status" />
                        
                   	        <g:sortableColumn property="cellIncluded" title="Cell Included" />
                        
                   	        <g:sortableColumn property="cellPhone" title="Cell Phone" />
                        
                   	        <g:sortableColumn property="city" title="City" />
                        
                   	        <g:sortableColumn property="email" title="Email" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${memberJDOInstanceList}" status="i" var="memberJDOInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${memberJDOInstance.id}">${fieldValue(bean:memberJDOInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:memberJDOInstance, field:'bjcpStatus')}</td>
                        
                            <td>${fieldValue(bean:memberJDOInstance, field:'cellIncluded')}</td>
                        
                            <td>${fieldValue(bean:memberJDOInstance, field:'cellPhone')}</td>
                        
                            <td>${fieldValue(bean:memberJDOInstance, field:'city')}</td>
                        
                            <td>${fieldValue(bean:memberJDOInstance, field:'email')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${memberJDOInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
