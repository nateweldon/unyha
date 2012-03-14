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
    <meta name="layout" content="main"/>
    <title>Beer Judge Main Page</title></head>
<body>
<style>

div#users-contain { width: 350px; margin: 20px 0; }
div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
.ui-dialog .ui-state-error { padding: .3em; }
.validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>
<script type="text/javascript">
    $(function() {
        var firstName = $( "#firstName" ),
                middleName = $ ( "#middleInitial" ),
                lastName = $ ( "#lastName" ),
                address = $( "#address" ),
                state = $( "#state" ),
                zip = $( "#zip" ),
                homePhone = $( "#homePhone" ),
                workPhone = $( "#workPhone"),
                email = $( "#email" ),
                allFields = $( [] ).add( firstName ).add( lastName ).add( address ).add( state ).add( zip).add( email ).add( homePhone ),
                tips = $( ".validateTips" );

        function clearForm(form)
        {
            $(":input", form).each(function()
            {
                var type = this.type;
                var tag = this.tagName.toLowerCase();
                if (type == 'text')
                {
                    this.value = "";
                }
            });
        }
        function updateTips( t ) {
            tips
                    .text( t )
                    .addClass( "ui-state-highlight" );
            setTimeout(function() {
                tips.removeClass( "ui-state-highlight", 1500 );
            }, 500 );
        }

        function checkLength( o, n, min, max ) {
            if ( o.val().length > max || o.val().length < min ) {
                o.addClass( "ui-state-error" );
                updateTips( "Length of " + n + " must be between " +
                        min + " and " + max + "." );
                return false;
            } else {
                return true;
            }
        }

        function checkRegexp( o, regexp, n ) {
            if ( !( regexp.test( o.val() ) ) ) {
                o.addClass( "ui-state-error" );
                updateTips( n );
                return false;
            } else {
                return true;
            }
        }
        $( "#personal-form" ).dialog({
            autoOpen: false,
            height: 600,
            width: 650,
            modal: true,
            open: function() {
                clearForm("#personal-form");

            },
            buttons: {
                "Next": function() {
                    var bValid = true;

                    allFields.removeClass( "ui-state-error" );

                    bValid = bValid && checkLength( firstName, "firstName", 1, 16 );
                    bValid = bValid && checkLength( lastName, "lastName", 1, 16 );
                    bValid = bValid && checkLength( address, "address", 5, 80 );

                    bValid = bValid && checkLength(zip, "zip", 5, 9);
                    bValid = bValid && checkLength(homePhone, "homePhone", 7, 12);
                    bValid = bValid && checkLength(email, "email", 2, 80);


                    bValid = bValid && checkRegexp( firstName, /^[a-z]+$/i, "First Name may consist of a-z" );
                    bValid = bValid && checkRegexp( lastName, /^[a-z]+$/i, "Last Name may consist of a-z" );


                    bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );


                    if ( bValid ) {
                        $( "#users tbody" ).append( "<tr>" +
                                "<td>" + firstName.val() + "</td>" +
                                "<td>" + lastName.val() + "</td>" +
                                "<td>" + address.val() + "</td>" +
                                "<td>" + state.val() + "</td>" +
                                "<td>" + zip.val() + "</td>" +
                                "<td>" + homePhone.val() + "</td>" +
                                "<td>" + email.val() + "</td>" +

                                "</tr>" );
                        $('body').data( 'fName', firstName.val());
                        $('body').data( 'mName', middleName.val());
                        $('body').data( 'lName', lastName.val());
                        $('body').data('address', address.val());
                        $('body').data('state', state.val());
                        $('body').data('zip', zip.val());
                        $('body').data('hPhone', homePhone.val());
                        $('body').data('wPhone', workPhone.val());
                        $('body').data('email', email.val());

                        $.ajax({
                            type: 'POST',
                            url: '${createLink(controller:'contestantJDO', action:'save')}',
                            data: {
                                'fname' :  $('body').data('fName'),
                                'mname' : $('body').data('mName'),
                                'lname' :   $('body').data('lName'),
                                'addr' :   $('body').data('address'),
                                'state' :   $('body').data('state'),
                                'zip' : $('body').data('zip'),
                                'hPhone' : $('body').data('hPhone'),
                                'wPhone' : $('body').data('wPhone'),
                                'email' :  $('body').data('email')


                            },
                            success: function( data ) {
                                var parsed = jQuery.parseJSON(data);
                                allFields.val( "" ).removeClass( "ui-state-error" );
                                $( "#beer-form" ).dialog( "open" );
                            }
                        });


                    }



                },

                Cancel: function() {
                    $( this ).dialog( "close" );
                }
            },
            close: function() {
                allFields.val( "" ).removeClass( "ui-state-error" );


            }
        });
        $( "#beer-form" ).dialog({


            autoOpen: false,
            height: 600,
            width: 650,
            open: function() {
                clearForm("#personal-form");
                $("#personal-form").dialog("close");
                $("#done-dialog").dialog("close");

            },
            modal: true,

            buttons: {
                "Next": function() {
                    var bValid = true;

                    allFields.removeClass( "ui-state-error" );
                    var beerName = $( "#beername" )
                    bValid = bValid && checkLength( beerName, "beername", 1, 34 );




                    if ( bValid ) {
                        $( "#users tbody" ).append( "<tr>" +
                                "<td>" + firstName.val() + "</td>" +
                                "<td>" + lastName.val() + "</td>" +
                                "<td>" + address.val() + "</td>" +
                                "<td>" + state.val() + "</td>" +
                                "<td>" + zip.val() + "</td>" +
                                "<td>" + homePhone.val() + "</td>" +
                                "<td>" + email.val() + "</td>" +

                                "</tr>" );
                        $.ajax({
                            type: 'POST',
                            url: '${createLink(controller:'contestantJDO', action:'createBeer')}',
                            data: {
                                'fname' :  $('body').data('fName'),
                                'mname' : $('body').data('mName'),
                                'lname' :   $('body').data('lName'),
                                'addr' :   $('body').data('address'),
                                'state' :   $('body').data('state'),
                                'zip' : $('body').data('zip'),
                                'hPhone' : $('body').data('hPhone'),
                                'wPhone' : $('body').data('wPhone'),
                                'email' :  $('body').data('email'),
                                'bName' : $("#beername").val(),
                                'cat' : ($("#catNum").val().split("="))[0],
                                'sub' : ($("#subCat").val().split("="))[0],
                                'ingred' : $("#ingredients").val(),
                                'addit' : $("#additionalBrewers").val(),
                                'comment' : $("#comments").val()

                            },
                            success: function( data ) {
                                var parsed = jQuery.parseJSON(data);

                                $(this).dialog("close");
                                $( "#done-dialog" ).dialog( "open" );


                                allFields.val( "" ).removeClass( "ui-state-error" );

                            }
                        });


                    }


                },


                Cancel: function() {
                    $( this ).dialog( "close" );
                }
            },



            close: function() {
                allFields.val( "" ).removeClass( "ui-state-error" );
            }


        });

        $( "#done-dialog" ).dialog({


            autoOpen: false,
            height: 400,
            width: 450,
            modal: true,
            open: function() {
                clearForm("#beer-form");
                $("#beer-form").dialog("close");

            },
            buttons: {
                "Yes": function() {
                    $( "#beer-form" ).dialog( "open" );

                },
                "No": function() {



                    $.ajax({
                        type: 'POST',
                        url: '${createLink(controller:'contestantJDO', action:'paypalBuy')}',
                        data: {
                            'fname' :  $('body').data('fName'),
                            'lname' :   $('body').data('lName'),
                            'email':   $('body').data('email')

                        },
                        success: function( data ) {
                            //    var parsed = jQuery.parseJSON(data);

                            $(this).dialog("close");
                            $('input[name=amount]').val(data);

//                                alert( parsed );
                            $("#paypalForm").submit();
                        }
                    });

                }
            }
        });



        $( "#enter-contest" )
                .button()
                .click(function() {
                    $( "#personal-form" ).dialog( "open" );
                });


    });

</script>
<div class="BodyContentContainer" style="height: 1255px">
<div id="personal-form" title="Enter Personal Info">

    <p class="validateTips">All form fields are required.</p>
    <g:form id="createContestantJDO" name="createContestantJDO" action="save" method="post" >
        <fieldset>
            <table>
                <tbody>
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="firstName">First Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'firstName','errors')}">
                        <g:textField name="firstName" value="${contestantJDOInstance?.firstName}"  class="text ui-widget-content ui-corner-all"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="middleInitial">Middle Initial:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'middleInitial','errors')}">
                        <g:textField name="middleInitial" value="${contestantJDOInstance?.middleInitial}"  class="text ui-widget-content ui-corner-all"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="lastName">Last Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'lastName','errors')}">
                        <g:textField name="lastName" value="${contestantJDOInstance?.lastName}" class="text ui-widget-content ui-corner-all" />
                    </td>
                </tr>



                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="address">Address:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'address','errors')}">
                        <g:textField name="address" value="${contestantJDOInstance?.address}"  class="text ui-widget-content ui-corner-all"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="city">City:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'city','errors')}">
                        <g:textField name="city" value="${contestantJDOInstance?.city}"  class="text ui-widget-content ui-corner-all"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="state">State:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'state','errors')}">
                        <g:textField name="state" value="${contestantJDOInstance?.state}"  class="text ui-widget-content ui-corner-all"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="zip">Zip:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'zip','errors')}">
                        <g:textField name="zip" value="${fieldValue(bean: contestantJDOInstance, field: 'zip')}"  class="text ui-widget-content ui-corner-all"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="homePhone">Home Phone:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'homePhone','errors')}">
                        <g:textField name="homePhone" value="${contestantJDOInstance?.homePhone}"  class="text ui-widget-content ui-corner-all" />
                    </td>
                </tr>


                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="workPhone">Work Phone:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'workPhone','errors')}">
                        <g:textField name="workPhone" value="${contestantJDOInstance?.workPhone}"  class="text ui-widget-content ui-corner-all"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="email">Email:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'email','errors')}">
                        <g:textField name="email" value="${contestantJDOInstance?.email}"  class="text ui-widget-content ui-corner-all"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="clubInfo">Club Info:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:contestantJDOInstance,field:'clubInfo','errors')}">
                        <g:textField name="clubInfo" value="${contestantJDOInstance?.clubInfo}" class="text ui-widget-content ui-corner-all" />
                    </td>
                </tr>
                </tbody>
            </table>

            %{--<label for="firstName">First Name</label>--}%
            %{--<input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />--}%
            %{--<label for="email">Email</label>--}%
            %{--<input type="text" name="email" id="email" value="" class="text ui-widget-content ui-corner-all" />--}%
            %{--<label for="password">Password</label>--}%
            %{--<input type="password" name="password" id="password" value="" class="text ui-widget-content ui-corner-all" />--}%
        </fieldset>
    </g:form>
</div>
<div id ="done-dialog" title="Add Another Beer ?">


    <form  id="paypalForm" action="https://www.paypal.com/cgi-bin/webscr" method="post">
        <input type="hidden" name="cmd" value="_xclick">
        <input type="hidden" name="business" value="paypal@unyha.com">
        <input type="hidden" name="lc" value="US">
        <input type="hidden" name="item_name" value="Homebrew Competition Entry Fee">
        <input type="hidden" name="amount" value=0.00/>
        <input type="hidden" name="currency_code" value="USD">
        <input type="hidden" name="button_subtype" value="services">
        <input type="hidden" name="no_note" value="0">
        <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
        <p> Would you like to add another beer?</p>
        %{--<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">--}%
        %{--<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">--}%
    </form>

</div>

<div id="beer-form" title="Enter Beer Info">
    <g:form id="createBeerEntryJDO" name="createBeerJDO" action="save" method="post" >
        <fieldset>
            <table>
                <tbody>
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="beername">Beer Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'name','errors')}">
                        <g:textField name="beername" value="${beerEntryJDOInstance?.name}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="catNum">Category Num:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'catNum','errors')}">
                        %{--<g:textField name="catNum" value="${fieldValue(bean: beerEntryJDOInstance, field: 'catNum')}" />--}%
                        <g:select name="catNum" from="${beerCategory}" value="catNum" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="subCat">SubCategory:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'subCat','errors')}">
                        %{--<g:textField name="subCat" value="${fieldValue(bean: beerEntryJDOInstance, field: 'subCat')}" />--}%
                        <g:select name="subCat" from="${'A'..'F'}" value="subCat"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="ingredients">Ingredients:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'ingredients','errors')}">
                        <g:textField name="ingredients" value="${beerEntryJDOInstance?.ingredients}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="comments">Comments:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'comments','errors')}">
                        <g:textField name="comments" value="${beerEntryJDOInstance?.comments}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="additionalBrewers">Additional Brewers:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:beerEntryJDOInstance,field:'additionalBrewers','errors')}">
                        <g:textField name="additionalBrewers" value="${beerEntryJDOInstance?.additionalBrewers}" />
                    </td>
                </tr>
                </tbody>
            </table>
        </fieldset>
    </g:form>
</div>

<div class="ColumnContainer" >

    <div class="boundingbox default" style="height: 1240px">

        <div align="center">
            <h3>UNYHA Homebrew Competition</h3>
            <br/>
            <h3>34th Annual/23nd Empire State Open/HOTY-I Qualifier </h3>
        </div>
        <br/>
        <div class="line-separator" style="margin-top: 20px;"></div>
        <br/>
        <b><u>Entry Deadline:</u></b>
        <br/>
        <p>Sat. April 7th @ 11 AM at Southtown Beverage (Fri. Apr. 6th noon in Buff/Syr drop offs)   </p>
        <br/>
        <br/>
        <b><u>Judging Date:</u></b> <br/>
        <p>Sat. April 21st @ 8 am at Roc Brewing, 56 S. Union St., Rochester – same as 2011
        (with prejudging sessions April 17-20 as needed, location TBA)   </p>
        <br/>
        <br/>
        <b><u>Entry Rules:</u></b><p>Two bottles per entry (10-17 oz. glass bottles; capped, corked, or swing tops; no labels
    on bottles – please read our bottle rules!)
    $7 per 2-bottle entry – check payable to UNYHA, or use PayPal Preferred!
    Brewer to specify style and provide additional information, if required for style, using
    BJCP 2008 Guidelines (styles may be telescoped)
    Go to www.unyha.com, print and fill out the brewer & entry forms and bottle tags
    </p>
        <br/>
        <b><u>Get ‘em to us:</u></b>
        <p>
            Bring to our meeting Wed. Apr. 11, 7:30-9:00 PM @ Merchants Grill (near Culver Rd.)
            <br/> <br/>
            <b>Drop off</b> <br/> Niagara Traditions (1296 Sheridan Dr, Tonawanda) or E.J. Wren
        (Ponderosa Plz/Old Liverpool Rd, Liverpool) no later than noon on Fri. April 6th
            <br/>
            <br/>
            <b>Drop off</b> <br/> Southtown Beverage (2933 W. Henrietta Rd, Rochester)
        no later than 11 AM Sat. Apr. 7th
            <br/> <br/>
            <b>Ship to</b> <br/>Southtown Beverage (2933 W. Henrietta Rd, Rochester ZIP) for receipt by
        Fri., April 6th – Please note the NEW ship-to address!
            <br/>
            <br/>
            <b>DO NOT SHIP OR DROP OFF to Roc Brewing period!! THEY WILL GET LOST!</b>
        </p>
        <br/>
        <p> UNYHA’s competition is part of the New York State Homebrewer Invitational program
        (HOTY-I). Read the NEW rules & regs, view details & rankings at www.nyshoty.org
        </p>
        <br/>
        <b> Prizes: </b> <p>Ribbons & prizes awarded for Best in Category, Placing in Category,
    and Best of Show will include all styles this year. The BOS Beer grand prize is a
    handsome, handmade wooden stein made by UNYHA’s own Doug Dalke, and the BOS BEER
    winner’s recipe will be brewed by Rohrbach Brewing Co. Plus, all first, second and third place
    finishers will be awarded prizes. We’re proud to be sponsored by the best beer folks on the
    planet, so please support the businesses that support us!
    </p><br/>
        <b>Judges/Stewards needed:</b><p>  BJCP-ranked or otherwise well-qualified judges and
    stewards should complete the registration form on our website, or contact Judge Director Thomas Barnes,
    585-328-0148, (thomasbarnes@frontiernet.net) no later than 4-19-2012.  Beds for judges can be arranged.
    </p>
        <p>
        <br/>
        Questions? Contact Organizer Tom Ocque 315.576.0296, tommyok@mac.com
        <br/>
        A fabulous post-competition Dinner for us & spouses/guests will be held at Roc Brewing on the evening
        of Saturday, April 21st - details available soon at www.unyha.com.
        </p>

        <div align="center">
            <div align="center" style="float: none;padding:40px;">

                <button id="enter-contest">Enter Homebrew Competition</button>
            </div>

        </div>

    </div>
</div>
</div>
</body>
</html>