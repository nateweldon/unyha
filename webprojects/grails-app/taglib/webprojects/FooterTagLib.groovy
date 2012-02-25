package webprojects


/**
 * Created by IntelliJ IDEA.
 * UserJDO: nweldon

 */
class FooterTagLib {

    def thisYear = {
        out << new Date().format("yyyy")
    }

    def copyright = { attrs, body ->
        out << "&copy; "
        if (thisYear() != attrs.startYear)
        {
            out << attrs.startYear + " - "
        }
        out << thisYear() + " " + body()
    }

}
