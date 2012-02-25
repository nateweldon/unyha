package webprojects



class MembershipController {
    static navigation = [
            order:2,
            title:'Membership',
            action:'manage'

    ]



    def index = {
    redirect(action:"manage")
    }

    def manage = {

    }

    def becomeAMember = {

      redirect(controller: "memberJDO", action: "list")
    }

    def showCal = {
        redirect(action: "manage")
    }
}
