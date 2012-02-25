<%--
  Created by IntelliJ IDEA.
  User: Nate
  Date: 1/20/12
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon3.ico')}" type="image/x-icon" />
    <meta name="layout" content="main"/>
    <title>Monthly Mash</title></head>
<body>

<div class="BodyContentContainer">
    <div class="ColumnContainer TwoColl">
        <div class="LeftColl">
            <g:render template="/layouts/sideNavBar"/>
        </div>
        <div class="RightColl">
            <div class="boundingBox default">
               <h2> Comming Soon!</h2>

            </div>
        </div>
    </div>


    %{--<img src="${resource(dir:'image/unyha', file:'facebook.png')}" alt="Grails"/>--}%


</div>
</body>
</html>