package webprojects

import javax.jdo.Extent
//import grails.plugins.springsecurity.Secured


//  @Secured(['ROLE_ADMIN'])
class AdminController {


  def persistenceManager

    def index = {
        redirect(action:"manage")
    }

    def manage = {


    }

    def uploadmash = {


    }

    def createUser = {
        redirect(controller: "userJDO", action:"create")
    }

    def listUsers = {
        redirect(controller: "userJDO", action: "list")
    }

    def createRole = {
        redirect(controller: "roleJDO", action: "create")
    }

    def listRole = {
        redirect(controller: "roleJDO", action: "list")
    }

    def createUserRole = {
        redirect(controller: "userRoleJDO", action: "create")
    }

    def listUserRole = {
        redirect(controller: "userRoleJDO", action: "list");
    }

    def createCE = {
        render(view: "create")
    }

    def listCE = {
        render(view:"list")
    }

     def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def query = persistenceManager.newQuery(CalendarEventsJDO)
        def calendarEventsInstanceList = query.execute()
        def total = 0
     //   if (calendarEventsInstanceList && calendarEventsInstanceList.size() > 0) {
      //      total = calendarEventsInstanceList.size()
      //  }
        [calendarEventsInstanceList: calendarEventsInstanceList, calendarEventsInstanceTotal: total]
    }

    def show = {
        def calendarEventsInstance = persistenceManager.getObjectById(CalendarEventsJDO.class, Long.parseLong(params.id))
        if (!calendarEventsInstance) {
            flash.message = "CalendarEventsJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else { return [calendarEventsInstance: calendarEventsInstance] }
    }

    def edit = {
        def calendarEventsInstance = persistenceManager.getObjectById(CalendarEventsJDO.class, Long.parseLong(params.id))
        if (!calendarEventsInstance) {
            flash.message = "CalendarEventsJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            calendarEventsInstance = persistenceManager.detachCopy(calendarEventsInstance)
            return [calendarEventsInstance: calendarEventsInstance]
        }
    }


}
