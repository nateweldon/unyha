<%@ page import="webprojects.EventsController" %>


<%--
  Created by IntelliJ IDEA.
  UserJDO: nweldon
--%>

<g:commentBeginEnd filename="${groovyPageFileName}">
    <%

        String requestURI=request.forwardURI
        String notSelected="";
        String selected="checked"
        String home= requestURI.contains("homeViewer")?selected:notSelected
        String events= requestURI.contains("events")?selected:notSelected
        String membership=requestURI.contains("membership")?selected:notSelected
        String beer= requestURI.contains("beerJudge")?selected:notSelected
        String groups = requestURI.contains("googleGroup")?selected:notSelected;

    %>
    <div id="mainContentContainer">
        <div id="global_header">
%{--<div id="logo"></div>--}%
    %{--<ul class="listOfLinks helperLinks">--}%
        %{--<g:loginControl/>--}%
    %{--</ul>--}%
    <div id="branding">&nbsp;</div>

    <div class="clearer"></div>

    <g:javascript>
        $(function() {
            $( "#radio" ).buttonset();
            $("#homeButton").button(
            ).click(function() {
                document.location = '/homeViewer/home';
            }).attr("checked", true);
            $("#eventsButton").button().click(function() {
                document.location = '/events/manage';
            });
            $("#memberButton").button().click(function() {
                document.location = '/membership/manage';
            });
            $("#judgeButton").button().click(function() {
                document.location = '/beerJudge/manage';
            });
            $("#googleButton").button().click(function() {
                document.location = '/googleGroup/manage';
            });

        });
    </g:javascript>




    <div id class="nextNavBar">
        <div id="radio">
            <input type="radio" id="homeButton"  name="radio" value="1"/><label for="homeButton">Home</label>
            <input type="radio" id="eventsButton"  name="radio" value="2"/><label for="eventsButton">Events</label>
            <input type="radio" id="memberButton"  name="radio" value="3"/><label for="memberButton">Membership</label>
            <input type="radio" id="judgeButton"  name="radio" value="4"/><label for="judgeButton">BJCP</label>
            <input type="radio" id="googleButton"  name="radio" value="5"/><label for="googleButton">Google Groups Form</label>
        </div>
    </div>

    <div class="clearer"></div>
    <br/><br/><br/><br/>


    </div>
</g:commentBeginEnd>


