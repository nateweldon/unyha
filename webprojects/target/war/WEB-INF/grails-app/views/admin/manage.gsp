<%--
  Created by IntelliJ IDEA.
  User: Nate
  Date: 1/20/12
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService()
%>

<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Admin Page</title>

    <g:javascript library="jquery"/>

    <script type="text/javascript">
        $(document).ready(function()
        {
            $("#datepicker").datepicker({dateFormat: 'yy/mm/dd'});
        })

    </script>

</head>
<body>
<div class="BodyContentContainer">
    <div class="ColumnContainer">


        <h1>Administration </h1>
        <br/>
        <br/>


                <span class="button" style="width: 150px"><g:link controller="admin" action="createCE">Create Calendar Events</g:link></span>

                <span class="button" style="width: 150px"><g:link controller="admin" action="listCE">List Calendar Events</g:link></span>

            <span class="button" style="width: 150px"><g:link controller="admin" action="createUser">Create Users</g:link></span>
            <span class="button" style="width: 150px"><g:link controller="admin" action="listUsers">List Users</g:link></span>
            <span class="button" style="width: 150px"><g:link controller="admin" action="createRole">Create Role</g:link></span>
            <span class="button" style="width: 150px"><g:link controller="admin" action="listRole">List Role</g:link></span>
            <span class="button" style="width: 150px"><g:link controller="admin" action="createUserRole">List User / Role</g:link></span>
            <span class="button" style="width: 150px"><g:link controller="admin" action="listUserRole">List User / Roles</g:link></span>







    </div>
</div>
</body>
</html>