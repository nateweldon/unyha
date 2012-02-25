%{--

  --}%

<%--
  Created by IntelliJ IDEA.
  UserJDO: nweldon 8/9/11
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
  Date:
--%>


<g:commentBeginEnd filename="${groovyPageFileName}">
    <g:javascript library="unyha/sidebar"/>
    <g:javascript>
        $(function() {

            //  $("#radio").buttonsetv();
            $("#checkbox").buttonsetv();
            $("#meeting").button(
            ).click(function() {
                document.location = 'meeting'
            });
            $("#mash").button (
            ).click(function() {
                document.location = 'mash'
            });
            $("#info").button (
            ).click(function() {
                document.location = 'about'
            });
            $("#officers").button (
            ).click(function() {
                document.location = 'officer'
            });

            //            $("#homeButton").button(
            //            ).click(function() {
            //                document.location = '/homeViewer/home';
            //            }).attr("checked", true);
            //            $("#eventsButton").button().click(function() {
            //                document.location = '/events/manage';
            //            });
            //            $("#memberButton").button().click(function() {
            //                document.location = '/membership/manage';
            //            });
            //            $("#judgeButton").button().click(function() {
            //                document.location = '/beerJudge/manage';
            //            });
            //            $("#googleButton").button().click(function() {
            //                document.location = '/googleGroup/manage';
            //            });

        });
    </g:javascript>
    <div>
        <!--------------------------------------------------------------------------------->
        <!--                               Side Bar                                        -->
        <!--------------------------------------------------------------------------------->

        %{--<div class="BodyContentContainer">--}%
            <div class="ColumnContainer TwoColl">

                <div class="LeftColl">


                    <div id="checkbox">
                        <input type="radio" id="meeting" name="radio" value="1"/><label for="meeting">Club Meeting</label>
                        <input type="radio" id="mash" name="radio" value="2"/><label for="mash">Montly Mash</label>
                        <input type="radio" id="info" name="radio" value="3"/><label for="info">Club Information</label>
                        <input type="radio" id="officers" name="radio" value="4"/><label for="officers">Club Officers</label>
                    </div>
                    %{--<div id="sidebar">--}%
                    %{--<ul id="sidebar_fourth_full" class="listOfLinks sidebar_fourth sidebar_full sidebar_imgs">--}%

                    %{--<%--}%

                    %{--String requestURI=request.getRequestURI()--}%
                    %{--String notSelected="";--}%
                    %{--String selected="selected"--}%
                    %{--String meeting= requestURI.contains("meeting")?selected:notSelected--}%
                    %{--String mash= requestURI.contains("monthlyMash")?selected:notSelected--}%
                    %{--String about=requestURI.contains("about")?selected:notSelected--}%
                    %{--String officers= requestURI.contains("officer")?selected:notSelected--}%

                    %{--%>--}%




                    %{--<li class ="top ${meeting}"><g:link controller="homeViewer" title="Meeting" action="meeting" ><img src="../images/unyha/calendar.png" alt="" ><span class="sidebarLbl">Monthly Club Meeting</span></g:link></li>--}%
                    %{--<li class="middle ${mash}"><g:link controller="homeViewer" title="Monthly Mash" action="mash"><img src="../images/unyha/report_32.png" alt=""><span class="sidebarLbl">Monthly Mash</span></g:link></li>--}%
                    %{--<li class="middle ${about}"><g:link controller="homeViewer" title="About" action="about"><img src="../images/unyha/Info_icon.png" alt=""><span class="sidebarLbl">Club Information</span></g:link></li>--}%
                    %{--<li class="bottom ${officers}"><g:link controller="homeViewer" title="Officers" action="officer"><img src="../images/unyha/operator.png" alt=""><span class="sidebarLbl">Club Officers</span></g:link> </li>--}%
                    %{--<li class="middle ${proxySelection}"><g:link controller="homeViewer" title="" action="" ><img src="../images/unyha/proxySettings_silver.png" alt="" ><span class="sidebarLbl">Proxy Setup</span></g:link></li>--}%
                    %{--<li class="bottom ${aboutSelection}"><g:link controller="homeViewer" title="" action=""><img src="../images/unyha/Info_icon.png" alt=""><span class="sidebarLbl">About</span></g:link></li>--}%

                    %{--</ul>--}%
                    %{--</ul>--}%
                    %{--</div> <!-- side Bar -->--}%
                    %{--                </div>--}%



                </div>

            </div>
        </div>
    %{--</div>--}%





</g:commentBeginEnd>


