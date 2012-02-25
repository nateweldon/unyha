<%--
  Created by IntelliJ IDEA.
  User: nweldon
  Date: 11/9/11
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>


<div id="becomeAMember" class="formWindow" style="display:none;">
%{--<h1>Create MemberJDO</h1>--}%
%{--<g:if test="${flash.message}">--}%
%{--<div class="message">${flash.message}</div>--}%
%{--</g:if>--}%
%{--<g:hasErrors bean="${memberJDOInstance}">--}%
%{--<div class="errors">--}%
%{--<g:renderErrors bean="${memberJDOInstance}" as="list" />--}%
%{--</div>--}%
%{--</g:hasErrors>--}%
    <g:form id="becomeAMember" name="becomeAMember" controller="PPal" action="buy">
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

                %{--<tr class="prop">--}%
                    %{--<td align="top" class="name">--}%
                        %{--<g:select name="membershipOption" from="${['Single - $20', 'Family - $40']}" noSelection="'':'-Select MemberShip-']" />--}%
                    %{--</td>--}%
                %{--</tr>--}%

                %{--<tr class="prop">--}%
                    %{--<td valign="top" class="name">--}%
                        %{--<label for="startingBrewDate">Starting Brew Date:</label>--}%
                    %{--</td>--}%
                    %{--<td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'startingBrewDate','errors')}">--}%
                        %{--<g:textField name="startingBrewDate" value="${fieldValue(bean: memberJDOInstance, field: 'startingBrewDate')}" />--}%
                    %{--</td>--}%
                %{--</tr>--}%

                %{--<tr class="prop">--}%
                    %{--<td valign="top" class="name">--}%
                        %{--<label for="bjcpStatus">Bjcp Status:</label>--}%
                    %{--</td>--}%
                    %{--<td valign="top" class="value ${hasErrors(bean:memberJDOInstance,field:'bjcpStatus','errors')}">--}%
                        %{--<g:textField name="bjcpStatus" value="${fieldValue(bean: memberJDOInstance, field: 'bjcpStatus')}" />--}%
                    %{--</td>--}%
                %{--</tr>--}%

                </tbody>
            </table>
        </div>


        <div class="line-separator" style="margin-top: 50px"></div>
        <div>
            <div style="float: right;padding:10px;">


                 <paypal:button itemName="membership" originalURL="${grailsApplication.config.grails.serverURL}" itemNumber="1"
                     amount="40" buyerId="2"/>
                <input class="Button" type="submit" name="saveButton" value="<g:message code="button.save.label.label" default="Save"/>"/>

                <input class="Button" type="submit" name="cancelButton" value="<g:message code="button.cancel.label" default="Cancel"/>"/>

            </div>
        </div>
    </g:form>
</div>

