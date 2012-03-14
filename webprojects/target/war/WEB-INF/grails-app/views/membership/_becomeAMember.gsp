<%--
  Created by IntelliJ IDEA.
  User: nweldon
  Date: 11/9/11
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>


<div id="becomeAMember" class="formWindow" style="display:none;">

    <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
        <input type="hidden" name="cmd" value="_xclick">
        <input type="hidden" name="business" value="paypal@unyha.com">
        <input type="hidden" name="lc" value="US">
        <input type="hidden" name="item_name" value="UNYHA Membership Fee">
        <input type="hidden" name="button_subtype" value="services">
        <input type="hidden" name="no_note" value="0">
        <input type="hidden" name="currency_code" value="USD">
        <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">

        <div class="dialog">
            <table>
                <tbody>
                <tr>
                    <td>
                        <img src="${resource(dir: 'images/unyha', file: 'add_32.png')}">
                    </td>
                    <td style="width:100%;padding: 25 0 0 0">
                        <span style="font: bold 26px auto Arial, Helvetica, sans-serif;">
                            Become A Member
                        </span>

                    </td>
                </tr>
                </tbody>
            </table>
            <div class="line-separator" style="margin-top: 50px"></div>
            <table>
                <tbody>
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="firstName">First Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'firstName','errors')}">
                        <g:textField name="firstName" value="${memberJDOInstance?.firstName}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="lastName">Last Name:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'lastName','errors')}">
                        <g:textField name="lastName" value="${memberJDOInstance?.lastName}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="email">Email:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'email','errors')}">
                        <g:textField name="email" value="${memberJDOInstance?.email}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="emailVerify">ReEnter Email:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'email','errors')}">
                        <g:textField name="emailVerify" value="${memberJDOInstance?.email}" />
                    </td>
                </tr>




                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="streetAddress">Street Address:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'streetAddress','errors')}">
                        <g:textField name="streetAddress" value="${memberJDOInstance?.streetAddress}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="city">City:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'city','errors')}">
                        <g:textField name="city" value="${memberJDOInstance?.city}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="state">State:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'state','errors')}">
                        <g:textField name="state" value="${memberJDOInstance?.state}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="zip">Zip:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'zip','errors')}">
                        <g:textField name="zip" value="${fieldValue(bean: memberJDOInstance, field: 'zip')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="homePhone">Home Phone:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'homePhone','errors')}">
                        <g:textField name="homePhone" value="${fieldValue(bean: memberJDOInstance, field: 'homePhone')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="homeIncluded">Home Included:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'homeIncluded','errors')}">
                        <g:checkBox name="homeIncluded" value="${memberJDOInstance?.homeIncluded}" />
                    </td>
                </tr>


                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="cellPhone">Cell Phone:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'cellPhone','errors')}">
                        <g:textField name="cellPhone" value="${fieldValue(bean: memberJDOInstance, field: 'cellPhone')}" />
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="cellIncluded">Cell Included:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'cellIncluded','errors')}">
                        <g:checkBox name="cellIncluded" value="${memberJDOInstance?.cellIncluded}" />
                    </td>
                </tr>

                <tr><td><input type="hidden" name="on0" value="Membership Type">Membership Type</td></tr><tr><td><select name="os0">
                    <option value="Single">Single $20.00 USD</option>
                    <option value="Family">Family $40.00 USD</option>
                </select> </td></tr>


                </tbody>
            </table>
        </div>



        <div class="line-separator" style="margin-top: 50px"></div>
        <div>
            <div style="float: right;padding:10px;">

                <input type="hidden" name="currency_code" value="USD">
                <input type="hidden" name="option_select0" value="Single">
                <input type="hidden" name="option_amount0" value="20.00">
                <input type="hidden" name="option_select1" value="Family">
                <input type="hidden" name="option_amount1" value="40.00">
                <input type="hidden" name="option_index" value="0">
                %{--<paypal:button itemName="membership" originalURL="${grailsApplication.config.grails.serverURL}" itemNumber="1"--}%
                %{--amount="40,00" buyerId="Nate" discountAmount="0"/>--}%
                %{--<input class="Button" type="submit" name="saveButton" value="<g:message code="button.save.label.label" default="Save"/>"/>--}%

                %{--<input class="Button" type="submit" name="cancelButton" value="<g:message code="button.cancel.label" default="Cancel"/>"/>--}%
                <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">

            </div>
        </div>

    </form>

</div>






