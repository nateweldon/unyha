<%--
  Created by IntelliJ IDEA.
  User: nweldon
  Date: 11/1/11
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon3.ico')}" type="image/x-icon" />
    <meta name="layout" content="main"/>
    <title>Welcome Homebrewers</title></head>
<body>
<script type="text/javascript">
     $(function() {
     $( "#competion" )
                .button()
                .click(function() {
                 document.location = '/beerJudge/manage';
             });

      $( "#nextMeeting" )
         .button()
         .click(function() {
                  document.location = 'meeting' ;
              })

    });
</script>

<div class="BodyContentContainer">
    <div class="ColumnContainer TwoColl">

        <div class="LeftColl">
            <g:render template="/layouts/sideNavBar"/>
        </div>
        <div class="RightColl">
            <div class="boundingBox default" style="height: 800px">
                <h2> Welcome Homebrewers !! </h2>
                <div class="line-separator" style="margin-top: 20px;"></div>

                <br/>
                <br/>
                <p>
                    This organization and site is devoted to promoting and coordinating the homebrewing movement in New York State.
                    On this site you can find valuable information on learning about homebrewing, locating local homebrewers, becoming a
                    <g:link controller="beerJudge" style="font: bold;color: green"> beer judge</g:link>, improving our state's homebrewing laws,
                    and finding what else is going on in New York homebrewing.  Take a second to get registered on the site,
                    browse through the resources, post in the forum, and become a part of New York's homebrewing culture!


                    <br/>
                    <br/>
                 <div align="center">
                    <div align="center" style="float: none;padding:40px;">

                        <button id="nextMeeting">Check out our Meeting</button>
                    </div>

                </div>
                <div align="center">
                    <div align="center" style="float: none;padding:40px;">

                        <button id="competion">Enter Homebrew Competition</button>
                    </div>

                </div>

            </p>
                <div align="right" style="padding: 100px 0 00 100; ">
                    <g:link align="right" class="ButtonFacebook" action="facebook"/>
                        <br/>
                    <g:link alig="left" class="ButtonTwitter" action="twitter"/>

                    %{--<g:link class="ButtonRSS" action="subscribe"/>--}%

                    %{--<g:actionSubmit class="ButtonFacebook" action="" disabled="true" value="" style="float: right"/>--}%
                    %{--<g:actionSubmit class="ButtonTwitter" action="saveSecuritySettings" disabled="true" value="" style="float: right"/>--}%
                    %{--<img src="${resource(dir: 'images/unyha', file: 'facebook.png')}" alt="facebook button" onclick=""/>--}%
                    %{--<img  src="${resource(dir: 'images/unyha', file: 'twitter.png')}" alt="twitter button" />--}%
                </div>
            </div>
        </div>
    </div>

    %{--<img src="${resource(dir:'image/unyha', file:'facebook.png')}" alt="Grails"/>--}%


</div>
</body>
</html>