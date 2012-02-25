<!DOCTYPE html>
<html>
<head>
    <title>Grails Spring Social Core Plugin - <g:layoutTitle default="Grails"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css/springsocial', file: 'page.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/springsocial', file: 'form.css')}"/>
    <g:layoutHead/>
</head>

<body>
<div id="header">
    <h1>Grails Spring Social Core Plugin</h1>
</div>

<g:set var="leftMenu" value="${pageProperty(name:'page.leftMenu')}"/>

<g:if test="${leftMenu}">
    <div id="leftNav">
        <g:render template="${leftMenu}"/>
    </div>
</g:if>


<div id="content">
    <g:layoutBody/>
</div>

</body>
</html>




