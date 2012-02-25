<%--
  Created by IntelliJ IDEA.
  User: nweldon
  Date: 11/2/11
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="calendar"/>
    <title>Upcoming Events</title>
    <g:javascript library="jquery"/>

    <script>

        $(document).ready(function()
        {
            $( "#dialog:ui-dialog" ).dialog( "destroy" );

            $( "#dialog-modal" ).dialog({
                autoOpen: false,
                height: 500,
                width:  450,
                modal: true,
                buttons: {
                    Ok: function() {
                        $( this).dialog("close");
                    }
                }
            });


        });
    </script>
</head>
<body>
<div id="dialog-modal" title="Event" >

</div>
<div class="hiddenInViewSource" style="padding:20px;">
    <div class="BodyContentContainer" style="height: 900px">
        %{--<div id="blanket" style="display:none;"></div>--}%
        %{--<g:render template="CalendarEvents"/>--}%

        <br/><br/>




        <fullcal:calendar id="cal">
            header: { left: "prev, next, today", center: "title", right: "month,agendaWeek,agendaDay" },
           columnFormat: { week: 'ddd d/M' },
           timeFormat: 'HH:mm{ - HH:mm}',
           height: 700,
           editable: false,
           selectable: true,
           events: '${createLink(controller:"events", action:"eventList")}',
           eventClick: function(event) {
                {
               $("#dialog-modal").dialog("open");
               $("#name").val(event.title);

                return false;
                }

    }
        </fullcal:calendar>
    </div>
</div>
</body>
</html>