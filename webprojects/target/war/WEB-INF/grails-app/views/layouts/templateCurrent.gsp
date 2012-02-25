

<%--
  Created by IntelliJ IDEA.
  UserJDO: nweldon
  Date: 5/16/11
  Time: 2:57 PM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
  <title><g:layoutTitle default="Presto"/></title>
  <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon3.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <g:javascript library="application" />
</head>
<body>
<div id="spinner" class="spinner" style="display:none;">
  <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />

</div>
       <div id="xeroxLogo">
          <g:link action="manage" controller="status">
            <img src="${resource(dir:'images/unyha',file:'xerox_logo.gif')}" alt="Xerox" border="0" />
          </g:link>
          <!--
          <g:link action="manage" controller="status">
            <br/><b>PRESTO Management System</b>
          </g:link>
          -->
          <br/><br/>
        </div>


<g:layoutBody/>
</body>
</html>