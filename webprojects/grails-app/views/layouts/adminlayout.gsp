

<%--
  Created by IntelliJ IDEA.
  UserJDO: nweldon
  Date: 8/10/11
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title><g:layoutTitle default="Upstate New York HomeBrewers Association"/></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'unyha/headerfooter.css')}"/>
    <link rel="stylesheet" href="${resource(dir:'css', file: 'unyha/navigation_bar.css')}"/>
    <link rel="stylesheet" href="${resource(dir:'css', file: 'unyha/sidebar.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'unyha/page_layout.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'unyha/bounding_box.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/unyha', file: 'modal_windows.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/unyha', file: 'command_button.css')}"/>

    <link rel="stylesheet" href="${resource(dir:'images',file:'favicon3.ico')}"/>
    <g:layoutHead />
    <g:javascript library="application" />
    <g:javascript library="/unyha/modal_windows"/>
</head>
<body>
<div id="blanket" style="display:none;"></div>
%{--<g:render template="/login/loginPopup"/>--}%
<div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
</div>
<g:render template="/layouts/header"/>
<g:layoutBody/>
<g:render template="/layouts/footer"/>
</body>
</html>
