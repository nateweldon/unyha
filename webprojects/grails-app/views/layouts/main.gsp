<html>
<head>
    <nav:resources override="true"/>

    <title>
        <g:layoutTitle default="Upstate New York HomeBrewers Assocation"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'unyha/headerfooter.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'unyha/navigation_bar.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'unyha/sidebar.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'unyha/page_layout.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'unyha/bounding_box.css')}"/>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon3.ico')}" type="image/x-icon"/>
    <link rel="stylesheet" href="${resource(dir: 'css/unyha', file: 'modal_windows.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css/unyha', file: 'command_button.css')}"/>




    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Cache-control" content="no-cache"/>
    <meta http-equiv="Cache-control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>

    <%
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store");
    %>

    <g:layoutHead/>
    %{--<g:javascript library="application"/>--}%
    <g:layoutHead/>


    <g:javascript library="/unyha/modal_windows"/>
    <g:javascript library="jquery"/>
    <jqui:resources theme="unyha"/>


</head>

<body onload="${pageProperty(name: 'body.onload')}">
<div id="blanket" style="display:none;"></div>

        <g:render template="/login/loginPopup"/>



<div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir: 'images', file: 'spinner.gif')}"
         alt="${message(code: 'spinner.alt', default: 'Loading...')}"/>
</div>
<g:render template="/layouts/header"/>
<div id="clearer"></div>
%{--<div id="menu">--}%
    %{--<nav:render/>--}%
%{--</div>--}%
<g:layoutBody/>

<g:render template="/layouts/footer"/>
</body>

</html>
