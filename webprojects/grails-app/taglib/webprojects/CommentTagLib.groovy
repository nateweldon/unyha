package webprojects


/**
 * Created by IntelliJ IDEA.
 * UserJDO: nweldon

 */
class CommentTagLib
{
    def commentBeginEnd = { attrs, body ->
        out << "<!-- BEGIN generated from " + attrs.filename + " -->"
        out << body()
        out << "<!-- END generated from " + attrs.filename + " -->"

    }
}
