package webprojects

class GoogleGroupController {
    static navigation = [
            order:5,
            title:'Forum',
            action:'manage'

    ]

    def index = {
    redirect(action:"manage")
    }

    def manage = {

    }
}
