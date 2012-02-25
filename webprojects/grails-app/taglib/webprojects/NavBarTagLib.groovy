package webprojects


/**
 * Created by IntelliJ IDEA.
 * UserJDO: nweldon

 */
class NavBarTagLib
{
    def navbar = { attrs, body ->
        out << "<div id=\"navigationBar\">"
        out << "<ul class=\"cssmenu\">"
        out << "<li id=\"status\"><g:link controller=\"status\"  " + getSelected(request.getRequestURI(), "status") + " title=\"Status\"><span>Status</span></g:link></li>"
        out << "<li id=\"history\"><g:link controller=\"history\"  " + getSelected(request.getRequestURI(), "history") + " title=\"History\"><span>History</span></g:link></li>"
        out << "<li id=\"printer\"><g:link controller=\"deviceGroups\"  " + getSelected(request.getRequestURI(), "printer") + " title=\"Printer Groups\"><span>Printer Groups</span></g:link> </li>"
        out << "<li id=\"shifts\"><g:link controller=\"shifts\" title=\"Shifts\"><span>Shifts</span></g:link></li>"
        out << "<li id=\"admin\"><g:link controller=\"admins\" title=\"Administration\"><span>Administration</span></g:link></li>"
        out << "</ul>"
        out << "</div"
    }

    def navSelect = {
        out << getSelected(request.getRequestURI(), "status")
        out << getSelected(request.getRequestURI(), "history")
    }

    String getSelected(String uri, String navPoint)
    {
        String navSelection = "";
        if (uri.contains("/" + navPoint))
        {
            navSelection = """ class="selectedBtn " """

        }
        return navSelection
    }

    private def addButton()
    {
        out << "                        <li>\n"
        out << "                            <a id=\"add\" class=\"enable\" href=\"#\" onclick=\"popup('AddPopUp')\">\n"
        out << "                                <img id=\"addImg\" src=\"${resource(dir: 'images/unyha', file: 'add.png')}\" alt=\"" + g.message(code: "navbar.add.label", default: "Add") + "\">\n"
        out << "                                <span class=\"AEDNavBar\">" + g.message(code: "navbar.add.label", default: "Add") + "</span>\n"
        out << "                            </a>\n"
        out << "                        </li>\n"
    }

    private def editButton()
    {
        out << "                        <li>\n"
        out << "                            <a id=\"edit\" class=\"disable\" href=\"#\" onclick=\"populateEdit();validateSelectedRowCellPopUp('EditPopUp')\">\n"
        out << "                                <img id=\"editImg\" src=\"${resource(dir: 'images/unyha', file: 'edit_box_d.png')}\" alt=\"" + g.message(code: "navbar.edit.label", default: "Edit") + "\">\n"
        out << "                                <span class=\"AEDNavBar\">" + g.message(code: "navbar.edit.label", default: "Edit") + "</span>\n"
        out << "                            </a>\n"
        out << "                        </li>\n"
    }

    private def deleteButton()
    {
        out << "                        <li>\n"
        out << "                            <a id=\"delete\" class=\"disable\" href=\"#\" onclick=\"populateDelete();validateSelectedRowCellPopUp('DeletePopUp');\">\n"
        out << "                                <img id=\"deleteImg\" src=\"${resource(dir: 'images/unyha', file: 'del_d.png')}\" alt=\"" + g.message(code: "navbar.delete.label", default: "Delete") + "\">\n"
        out << "                                <span class=\"AEDNavBar\">" + g.message(code: "navbar.delete.label", default: "Delete") + "</span>\n"
        out << "                            </a>\n"
        out << "                        </li>\n"
    }

    private def navBarBegin()
    {
        out << "<div style=\"padding-top: 10px;\"></div>\n"
        out << "<div class=\"AEDNavBar\">\n"
        out << "    <table class=\"AEDNavBar\">\n"
        out << "        <thead>\n"
        out << "            <tr>\n"
        out << "                <th>\n"
        out << "                    <ul class=\"AEDNavBar\">\n"
    }

    private def navBarEnd()
    {
        out << "                    </ul>\n"
        out << "                </th>\n"
        out << "            </tr>\n"
        out << "        </thead>\n"
        out << "    </table>\n"
        out << "</div>\n"
    }

    /** Navigation Bar with Add & Edit buttons  */
    def edNavBar = { attrs, body ->
        navBarBegin()
        editButton()
        deleteButton()
        navBarEnd()
    }

    /** Navigation Bar with Add, Edit, & Delete buttons  */
    def aedNavBar = { attrs, body ->
        navBarBegin()
        addButton()
        editButton()
        deleteButton()
        navBarEnd()
    }

    /** Navigation Bar with Add button  */
    def aNavBar = { attrs, body ->
        navBarBegin()
        addButton()
        navBarEnd()
    }

}
