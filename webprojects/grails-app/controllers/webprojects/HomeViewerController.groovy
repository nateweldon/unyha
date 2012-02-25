package webprojects

class HomeViewerController {
    static navigation = [
            order:1,
            title:'Home',
            action:'home'

    ]

    def index = {
    redirect(action:"home")
    }

    def home = {

    }

    def mash = {

    }

    def meeting = {

    }

    def about = {

    }

    def officer = {

    }

    def twitter = {
        redirect(url: "http://twitter.com/#!/unyha")
    }

    def facebook = {
        redirect(url: "http://www.facebook.com/groups/47799813567/")
    }
}
