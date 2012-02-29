package webprojects

import com.google.appengine.api.datastore.*

class ContestantJDOController {

    def persistenceManager

    def index = { redirect(action: list, params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def query = persistenceManager.newQuery(ContestantJDO)
        def contestantJDOInstanceList = query.execute()
        def total = 0
        if (contestantJDOInstanceList && contestantJDOInstanceList.size() > 0) {
            total = contestantJDOInstanceList.size()
        }
        [contestantJDOInstanceList: contestantJDOInstanceList, contestantJDOInstanceTotal: total]
    }

    def show = {
        def contestantJDOInstance = persistenceManager.getObjectById(ContestantJDO.class, Long.parseLong(params.id))
        if (!contestantJDOInstance) {
            flash.message = "ContestantJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else { return [contestantJDOInstance: contestantJDOInstance] }
    }

    def delete = {
        def contestantJDOInstance = persistenceManager.getObjectById(ContestantJDO.class, Long.parseLong(params.id))
        if (contestantJDOInstance) {
            try {
                persistenceManager.deletePersistent(contestantJDOInstance)
                flash.message = "ContestantJDO ${params.id} deleted"
                redirect(action: list)
            }
            catch (Exception e) {
                flash.message = "ContestantJDO ${params.id} could not be deleted"
                redirect(action: show, id: params.id)
            }
        }
        else {
            flash.message = "ContestantJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def contestantJDOInstance = persistenceManager.getObjectById(ContestantJDO.class, Long.parseLong(params.id))
        if (!contestantJDOInstance) {
            flash.message = "ContestantJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            contestantJDOInstance = persistenceManager.detachCopy(contestantJDOInstance)
            return [contestantJDOInstance: contestantJDOInstance]
        }
    }

    def update = {
        def contestantJDOInstance = persistenceManager.getObjectById(ContestantJDO.class, Long.parseLong(params.id))

        if (contestantJDOInstance) {
            contestantJDOInstance.properties = params
            if (!contestantJDOInstance.hasErrors()) {

                try {
                    persistenceManager.makePersistent(contestantJDOInstance)
                } catch (Exception e) {
                    render(view: 'edit', model: [contestantJDOInstance: contestantJDOInstance])
                } finally {
                    flash.message = "ContestantJDO ${params.id} updated"
                    redirect(action: show, id: contestantJDOInstance.id)
                }
            }
            else {
                render(view: 'edit', model: [contestantJDOInstance: contestantJDOInstance])
            }
        }
        else {
            flash.message = "ContestantJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def create = {
        def contestantJDOInstance = new ContestantJDO()
        contestantJDOInstance.properties = params
        return ['contestantJDOInstance': contestantJDOInstance]
    }

    def save = {
        def contestantJDOInstance = new ContestantJDO(params)
        if (contestantJDOInstance.validate())
        {
        if (!contestantJDOInstance.hasErrors()) {
            try {
                persistenceManager.makePersistent(contestantJDOInstance)
            } finally {
                flash.message = "ContestantJDO ${contestantJDOInstance.id} created"
                redirect(action: show, id: contestantJDOInstance.id)
            }
        }
        }
        render(view: 'create', model: [contestantJDOInstance: contestantJDOInstance])

    }
       def validate = {
        String result = "false"
//        def oldPassword = params.adminPassword[1]
//
//        if (xeroxpresto.SecUser.findByUsername('admin').password.equalsIgnoreCase(springSecurityService.encodePassword(oldPassword)))
//        {
//            result = "true"
//        }
        response.setContentType("text/json;charset=UTF-8");

        render result

    }
}
