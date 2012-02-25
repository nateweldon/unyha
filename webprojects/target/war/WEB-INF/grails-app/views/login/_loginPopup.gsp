<%--
  Created by IntelliJ IDEA.
  User: Nate
  Date: 2/22/12
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>

<g:commentBeginEnd filename="${groovyPageFileName}">
<div id="loginPopup" class="settingsWindow" style="display:none;">

    <form action='/webprojects/j_spring_security_check' method='POST'
          id='loginForm' autocomplete='off'>
        <div>
            <table>
                <tbody>
                    <tr>
                        <td>
                            <img src="${resource(dir: 'images/unyha', file: 'access_40.png')}" alt="Login">
                        </td>
                        <td style="width:100%;padding: 25 0 0 0">
                            <span class="Login bold">Login</span>
                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td style="padding: 0">
                            <select name="j_username" class="LoginSelect" id="username">
                                <option value="">- Enter Name</option>
                                <option value="admin">admin</option>

                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td style="padding: 0">
                            <input type='password' class='textbox normal LoginPassword' name='j_password' id='password'/>
                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td style="padding: 0">
                            <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'/>
                            <label class="Login bold" for='remember_me'>Remember me</label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div style="margin-top:50px;" class="line-separator"></div>
        <div class="btn_container">
            <input type="submit" name="cancelButton"  class="button normal" value="<g:message code="button.cancel.label" default="logout"/>"/>
            <input type="submit" name="saveButton" class="button normal" value="<g:message code="button.login.label" default="Login"/>"/>
        </div>
    </form>
</div>
</g:commentBeginEnd>