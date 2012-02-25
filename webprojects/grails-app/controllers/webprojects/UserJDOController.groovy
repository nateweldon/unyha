package webprojects

import com.google.appengine.api.datastore.*

class UserJDOController {

    def persistenceManager

    def index = { redirect(action: list, params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def query = persistenceManager.newQuery(UserJDO)
        def userJDOInstanceList = query.execute()
        def total = 0
        if (userJDOInstanceList && userJDOInstanceList.size() > 0) {
            total = userJDOInstanceList.size()
        }
        [userJDOInstanceList: userJDOInstanceList, userJDOInstanceTotal: total]
    }

    def show = {
        def userJDOInstance = persistenceManager.getObjectById(UserJDO.class, Long.parseLong(params.id))
        if (!userJDOInstance) {
            flash.message = "UserJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else { return [userJDOInstance: userJDOInstance] }
    }

    def delete = {
        def userJDOInstance = persistenceManager.getObjectById(UserJDO.class, Long.parseLong(params.id))
        if (userJDOInstance) {
            try {
                persistenceManager.deletePersistent(userJDOInstance)
                flash.message = "UserJDO ${params.id} deleted"
                redirect(action: list)
            }
            catch (Exception e) {
                flash.message = "UserJDO ${params.id} could not be deleted"
                redirect(action: show, id: params.id)
            }
        }
        else {
            flash.message = "UserJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def userJDOInstance = persistenceManager.getObjectById(UserJDO.class, Long.parseLong(params.id))
        if (!userJDOInstance) {
            flash.message = "UserJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            userJDOInstance = persistenceManager.detachCopy(userJDOInstance)
            return [userJDOInstance: userJDOInstance]
        }
    }

    def update = {
        def userJDOInstance = persistenceManager.getObjectById(UserJDO.class, Long.parseLong(params.id))

        if (userJDOInstance) {
            userJDOInstance.properties = params
            if (!userJDOInstance.hasErrors()) {

                try {
                    persistenceManager.makePersistent(userJDOInstance)
                } catch (Exception e) {
                    render(view: 'edit', model: [userJDOInstance: userJDOInstance])
                } finally {
                    flash.message = "UserJDO ${params.id} updated"
                    redirect(action: show, id: userJDOInstance.id)
                }
            }
            else {
                render(view: 'edit', model: [userJDOInstance: userJDOInstance])
            }
        }
        else {
            flash.message = "UserJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def create = {
        def userJDOInstance = new UserJDO()
        userJDOInstance.properties = params
        return ['userJDOInstance': userJDOInstance]
    }

    def save = {
        def userJDOInstance = new UserJDO(params)
        if (!userJDOInstance.hasErrors()) {
            try {
                persistenceManager.makePersistent(userJDOInstance)
            } finally {
                flash.message = "UserJDO ${userJDOInstance.id} created"
                redirect(action: show, id: userJDOInstance.id)
            }
        }

        render(view: 'create', model: [userJDOInstance: userJDOInstance])

    }
}
