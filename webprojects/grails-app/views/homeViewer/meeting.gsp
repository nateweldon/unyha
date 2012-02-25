<%--
  Created by IntelliJ IDEA.
  User: nweldon
  Date: 11/9/11
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Monthly Meeting</title>
    <script type="text/javascript"
            src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA6R8nRic7i5vBP11t6NjOPerhPTll-G6k&sensor=false">
    </script>
    <script type="text/javascript">
        function initialize() {
            var myposition = new google.maps.LatLng(43.170269,-77.55951);
            var myOptions = {
                center: myposition,
                zoom: 16,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"),
                    myOptions);
            var contentString = '<div id="content">'+
                    '<div id="siteNotice">'+
                    '</div>'+
                    '<h2 id="firstHeading" class="firstHeading">UNYHA Monthly Meeting</h2>'+
                    '<div id="bodyContent">'+
                    '<p><b>881 Merchants Road, Rochester, NY Second Floor</b> </p>' +
                    'Happening the second wednesday of every month at 7:30pm'+
                    '</div>'+
                    '</div>';

            var infowindow = new google.maps.InfoWindow({
                content: contentString
            });
            var marker = new google.maps.Marker({
                position: myposition,
                map: map,
                title:"UNYHA Monthly Meeting Location"
            });

            google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map,marker);
            });
        }
    </script>
</head>
<body onload="initialize()">

<div class="BodyContentContainer">
    <div class="ColumnContainer TwoColl">
        <div class="LeftColl">
            <g:render template="/layouts/sideNavBar"/>
        </div>
        <div class="RightColl">


            <div id="map_canvas" style="width:100%; height:100%"></div>


        </div>
    </div>

    %{--<img src="${resource(dir:'image/unyha', file:'facebook.png')}" alt="Grails"/>--}%



</div>
</body>
</html>