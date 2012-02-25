package webprojects

class BeerJudgeController {
    static navigation = [
            order:4,
            title:'BCJP',
            action:'manage'

    ]

    def index = {
    redirect(action:"manage")
    }

    def manage = {

    }
}
