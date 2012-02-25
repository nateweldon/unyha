package webprojects


/**
 * Created by IntelliJ IDEA.
 * UserJDO: nweldon

 */
class SettingsWindowTagLib
{
    def settingsBody = { attrs, body ->
        String src = attrs.imgsrc
        String alt = attrs.imgalt
        out.println '<div style="margin-right: 62px;">'
        out.println '<table>'
        out.println '<tbody>'
        out.println '<tr>'
        out.println '<td style="padding: 0;"><img src="' + src + '" alt="' + alt + '"/></td>'
        out << '<td style="padding: 0; width: 100%; padding-top: 20px">' << body() << '</td>\n'
        out.println '</tr>'
        out.println '</tbody>'
        out.println '</table>'
        out.println '</div>'
    }
}
