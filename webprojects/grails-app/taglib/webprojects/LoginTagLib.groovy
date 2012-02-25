package webprojects


/**
 * Created by IntelliJ IDEA.
 * UserJDO: nweldon

 */

class LoginTagLib
{
    def springSecurityService

    def loginControl={
        if (springSecurityService.isLoggedIn()) {
            out << """ <li> Current UserJDO:  <b>${springSecurityService.getCurrentUser().username}</b> </li>"""
            out << """ <li> <a href="${request.contextPath}/logout">Logout</a> </li>"""
		}
		else {
			out << """ <li> <a href="#" onclick="popup('loginPopup')">Login</a> </li> """
            out << """ <li> <a href=#" onclick="popup('loginPopup')">Register</a></li> """
		}
    }

}
