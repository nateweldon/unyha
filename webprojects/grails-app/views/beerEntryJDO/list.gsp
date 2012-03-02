<%@ page import="webprojects.BeerEntryJDO" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />
    <title>BeerEntryJDO List</title>
</head>
<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
    <span class="menuButton"><g:link class="create" action="create">New BeerEntryJDO</g:link></span>
</div>
<div class="body">
    <h1>BeerEntryJDO List</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="Id" />
                <g:sortableColumn property="name" title="Name" />
                <g:sortableColumn property="catNum" title="Category Number" />
                <g:sortableColumn property="subCat" title="Sub Category"/>
                <g:sortableColumn property="ingredients" title="Ingredients" />
                <g:sortableColumn property="comments" title="Comments" />
                <g:sortableColumn property="additionalBrewers" title="Additional Brewers" />
                <g:sortableColumn property="entryId" title="Entry Id"/>









            </tr>
            </thead>
            <tbody>
            <g:each in="${beerEntryJDOInstanceList}" status="i" var="beerEntryJDOInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show" id="${beerEntryJDOInstance.id}">${fieldValue(bean:beerEntryJDOInstance, field:'id')}</g:link></td>
                    <td>${fieldValue(bean:beerEntryJDOInstance, field:'name')}</td>


                    <td>${fieldValue(bean:beerEntryJDOInstance, field:'catNum')}</td>
                    <td>${fieldValue(bean:beerEntryJDOInstance, field:'subCat')}</td>
                    <td>${fieldValue(bean:beerEntryJDOInstance, field:'ingredients')}</td>
                    <td>${fieldValue(bean:beerEntryJDOInstance, field:'comments')}</td>


                    <td>${fieldValue(bean:beerEntryJDOInstance, field:'additionalBrewers')}</td>
                    <td>${fieldValue(bean:beerEntryJDOInstance, field:'entryId')}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${beerEntryJDOInstanceTotal}" />
    </div>
</div>
</body>
</html>
