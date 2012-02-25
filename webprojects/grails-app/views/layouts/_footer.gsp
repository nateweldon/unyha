

<%--
  Created by IntelliJ IDEA.
  UserJDO: nweldon
--%>

<g:commentBeginEnd filename="${groovyPageFileName}">
    <div id='global_footer'>
        <div class="BannerFooter">
            <ul class='listOfLinks helperLinks'>
                <li><g:link controller="homeViewer" action="home"><img src="${resource(dir: 'images/unyha', file: 'home_16.gif')}"></g:link></li>
                <li><g:link controller="membership" action="manage">Membership</g:link></li>
                <li><g:link controller="events" action="manage">Events</g:link></li>
                <li><g:link controller="beerJudge" action="manage">BJCP</g:link></li>
                <li><g:link controller="googleGroup" action="manage">Forum</g:link></li>
                <li><g:link controller="homeViewer" action="about">About</g:link></li>
                %{--<li><g:link controller="admin" action="index">Admin</g:link></li>--}%
            </ul>
        </div>
        <g:copyright startYear="2012"> All Rights Reserved.</g:copyright>
    </div>
    </div> <!-- mainContentContainer -->
</g:commentBeginEnd>
