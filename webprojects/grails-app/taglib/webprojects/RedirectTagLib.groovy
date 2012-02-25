package webprojects


/**
 * Created by IntelliJ IDEA.
 * UserJDO: nweldon

 */
class RedirectTagLib
{

    def redirectToPage = { attrs ->
        response.sendRedirect("${request.contextPath}/${attrs.controller}")
    }

}
