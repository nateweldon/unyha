<%--
  Created by IntelliJ IDEA.
  User: nweldon
  Date: 11/2/11
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>UNHYA Membership Page</title></head>
<body>
<div class="BodyContentContainer">
    <div class="ColumnContainer">
        <div id="blanket" style="display:none;"></div>
        <g:render template="becomeAMember"/>
        <div class="boundingBox default">

            <h2>Member Ship Information</h2>
            <div class="line-separator" style="margin-top: 20px;"></div>
            <div align="left" style="padding-left: 20px">


                %{--<g:message code="competitions" default="Competitions"/>--}%
                %{--<g:message code="competitions.info" default="Info"/>--}%
                %{--<g:message code="guest.speaker" default=""/>--}%
                %{--<g:message code="guest.speakers.info"/>--}%
                %{--<g:message code="trips.tours"/>--}%
                %{--<g:message code="trips.tours.info"/>--}%
                %{--<g:message code="discounts"/>--}%
                %{--<g:message code="discounts.info"/>--}%
                %{--<g:message code="beer.judging"/>--}%
                %{--<g:message code="beer.judging.info"/>--}%
                %{--<g:message code="access"/>--}%
                %{--<g:message code="access.info" />--}%
                %{----}%

<h4>Competitions -</h4>
<p>The ability to enter club only competitions and the opportunity to host and participate in club sponsored competitions.  </p>
<h4>Guest Speakers -</h4>
<p>Listen to various experts talk about issues that can improve your brewing. Experienced brewers to help you improve your brew </p>
<h4>Trips and Tours -</h4>
<p>Breweries, Yeast factories, Distilleries, Pub Crawls, Club Picnic and Christmas party. </p>
<h4>Discounts -</h4>
<p>brewing supplies on meeting days</p>
<h4>Beer Judging -</h4>
<p> Refine your palate and get feedback from club members on your brewing efforts.
            Training groups for Beer appreciation. Study for the BJCP to become a certified beer judge. </p>
<h4>Access -</h4>
<p>The clubs library and equipment</p>
                The cost of membership is $25 per year for an individual members and $40 for a family.
            </p>


                %{--<div align="center">--}%
               %{--<div align="right" style="float: none;padding:40px;">--}%
                    %{--<a id="PopUpButton" href="#" onclick="popup('becomeAMember')">--}%
                        %{--<g:message code="member.become" default="Become A Mmber"/>--}%
                    %{--</a>--}%

                %{--</div>--}%


            </div>



        </div>
    </div>
</div>
</body>

</html>