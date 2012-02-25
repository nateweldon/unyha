package webprojects

/**
 * Created by IntelliJ IDEA.
 * UserJDO: nweldon

 */
class ColorKeyTagLib {

    def colorKeyTag = { attrs, body ->
        out << "<table border=\"0\" class=\"ColorKeyTable\">\n"
        out << "    <tr>\n"
        out << "        <td style=\"background: #252525;\"/>\n"
        out << "        <td style=\"background: #FED207;\"/>\n"
        out << "        <td style=\"background: #0071C3;\"/>\n"
        //out << "        <td style=\"background: #C30064;\"/>\n"
        out << "        <td style=\"background: #FE5207;\"/>\n"
        out << "        <td style=\"background: #6A6A6A;\"/>\n"
        out << "        <td style=\"border: 1px solid #C5C5C5;background: #FFFFFF;\">&nbsp;</td>\n"
        out << "        <td style=\"background: #95D804;\"/>\n"
        out << "    </tr>\n"
        out << "    <tr>\n"
        out << "        <td>Off</td>\n"
        out << "        <td>Not Ready</td>\n"
        out << "        <td>Maintenance</td>\n"
        //out << "        <td>Faulted / Waiting</td>\n"
        out << "        <td>In Service</td>\n"
        out << "        <td>Idle</td>\n"
        out << "        <td>No Data Received</td>\n"
        out << "        <td>In Production</td>\n"
        out << "    </tr>\n"
        out << "</table>\n"
    }
}
