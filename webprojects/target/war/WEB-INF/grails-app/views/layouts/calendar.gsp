<%--
  Created by IntelliJ IDEA.
  User: Nate
  Date: 1/17/12
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title><g:layoutTitle default="Upstate New York Homebrewers Association"/></title>
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon3.ico')}" type="image/x-icon" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'unyha/fullcalendar.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: '../js/jquery/jquery-ui/css/south-street/jquery-ui-1.8.17.custom.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'unyha/headerfooter.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'unyha/navigation_bar.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'unyha/page_layout.css')}"/>
     <link rel="stylesheet" href="${resource(dir: 'css/unyha', file: 'modal_windows.css')}"/>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon3.ico')}" type="image/x-icon"/>

    <g:layoutHead />
    <g:javascript library="jquery" plugin="jquery" />

     <jqui:resources theme="unyha"/>
    <g:javascript library="unyha/fullcalendar"/>
    <g:javascript library="/unyha/modal_windows"/>


</head>
<body onload="${pageProperty(name: 'body.onload')}">
<div id="blanket" style="display:none;"></div>
<div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
</div>
<g:render template="/layouts/header"/>
<div id="clearer"></div>

<g:layoutBody/>

<g:render template="/layouts/footer"/>


</body>
</html>


