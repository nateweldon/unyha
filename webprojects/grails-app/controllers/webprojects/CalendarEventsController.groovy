package webprojects

class CalendarEventsController {

    def persistenceManager

    def index = { redirect(action: list, params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

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

    def delete = {
        def calendarEventsInstance = persistenceManager.getObjectById(CalendarEventsJDO.class, Long.parseLong(params.id))
        if (calendarEventsInstance) {
            try {
                persistenceManager.deletePersistent(calendarEventsInstance)
                flash.message = "CalendarEventsJDO ${params.id} deleted"
                redirect(action: list)
            }
            catch (Exception e) {
                flash.message = "CalendarEventsJDO ${params.id} could not be deleted"
                redirect(action: show, id: params.id)
            }
        }
        else {
            flash.message = "CalendarEventsJDO not found with id ${params.id}"
            redirect(action: list)
        }
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

    def update = {
        def calendarEventsInstance = persistenceManager.getObjectById(CalendarEventsJDO.class, Long.parseLong(params.id))

        if (calendarEventsInstance) {
            calendarEventsInstance.properties = params
            if (!calendarEventsInstance.hasErrors()) {

                try {
                    persistenceManager.makePersistent(calendarEventsInstance)
                } catch (Exception e) {
                    render(view: '/admin/edit', model: [calendarEventsInstance: calendarEventsInstance])
                } finally {
                    flash.message = "CalendarEventsJDO ${params.id} updated"
                    redirect(controller: 'admin', action: 'list')
                }
            }
            else {
                render(view: '/admin/edit', model: [calendarEventsInstance: calendarEventsInstance])
            }
        }
        else {
            flash.message = "CalendarEventsJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def create = {
        def calendarEventsInstance = new CalendarEventsJDO()
        calendarEventsInstance.properties = params
        return ['calendarEventsInstance': calendarEventsInstance]
    }

    def save = {



        def calendarEventsInstance = new CalendarEventsJDO(new Date(params.date), params.title, params.summary,
                params.location)
        if (!calendarEventsInstance.hasErrors()) {
            try {
                persistenceManager.makePersistent(calendarEventsInstance)
            } finally {
                flash.message = "CalendarEventsJDO ${calendarEventsInstance.id} created"
                redirect(controller:'admin',action: list )
            }
        }

        render(view: '/admin/create', model: [calendarEventsInstance: calendarEventsInstance])

    }
}
