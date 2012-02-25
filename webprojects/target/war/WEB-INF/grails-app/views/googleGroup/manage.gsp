<%--
  Created by IntelliJ IDEA.
  User: nweldon
  Date: 11/2/11
  Time: 9:09 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <title>Google Groups</title>
     <meta name="layout" content="main"/>


</head>
<body>

<div class="BodyContentContainer">
<span style="font-size: 15px; margin-left: 1em; margin-right: 1em;"><iframe id="forum_embed"
                                                                            src="javascript:void(0)"
                                                                            scrolling="no"
                                                                            frameborder="0"
                                                                            width="900"
                                                                            height="700">
</iframe>
    <script type="text/javascript">
        document.getElementById("forum_embed").src =
                "https://groups.google.com/forum/embed/?place=forum/unyha"
        "&amp;showsearch=true&amp;showpopout=true&amp;parenturl="
        encodeURIComponent(window.location.href);
    </script></span>

     </div>
</body>
</html>