package webprojects

import com.google.appengine.api.datastore.*

class RoleJDOController {

    def persistenceManager

    def index = { redirect(action: list, params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def query = persistenceManager.newQuery(RoleJDO)
        def roleJDOInstanceList = query.execute()
        def total = 0
        if (roleJDOInstanceList && roleJDOInstanceList.size() > 0) {
            total = roleJDOInstanceList.size()
        }
        [roleJDOInstanceList: roleJDOInstanceList, roleJDOInstanceTotal: total]
    }

    def show = {
        def roleJDOInstance = persistenceManager.getObjectById(RoleJDO.class, Long.parseLong(params.id))
        if (!roleJDOInstance) {
            flash.message = "RoleJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else { return [roleJDOInstance: roleJDOInstance] }
    }

    def delete = {
        def roleJDOInstance = persistenceManager.getObjectById(RoleJDO.class, Long.parseLong(params.id))
        if (roleJDOInstance) {
            try {
                persistenceManager.deletePersistent(roleJDOInstance)
                flash.message = "RoleJDO ${params.id} deleted"
                redirect(action: list)
            }
            catch (Exception e) {
                flash.message = "RoleJDO ${params.id} could not be deleted"
                redirect(action: show, id: params.id)
            }
        }
        else {
            flash.message = "RoleJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def roleJDOInstance = persistenceManager.getObjectById(RoleJDO.class, Long.parseLong(params.id))
        if (!roleJDOInstance) {
            flash.message = "RoleJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            roleJDOInstance = persistenceManager.detachCopy(roleJDOInstance)
            return [roleJDOInstance: roleJDOInstance]
        }
    }

    def update = {
        def roleJDOInstance = persistenceManager.getObjectById(RoleJDO.class, Long.parseLong(params.id))

        if (roleJDOInstance) {
            roleJDOInstance.properties = params
            if (!roleJDOInstance.hasErrors()) {

                try {
                    persistenceManager.makePersistent(roleJDOInstance)
                } catch (Exception e) {
                    render(view: 'edit', model: [roleJDOInstance: roleJDOInstance])
                } finally {
                    flash.message = "RoleJDO ${params.id} updated"
                    redirect(action: show, id: roleJDOInstance.id)
                }
            }
            else {
                render(view: 'edit', model: [roleJDOInstance: roleJDOInstance])
            }
        }
        else {
            flash.message = "RoleJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def create = {
        def roleJDOInstance = new RoleJDO()
        roleJDOInstance.properties = params
        return ['roleJDOInstance': roleJDOInstance]
    }

    def save = {
        def roleJDOInstance = new RoleJDO(params)
        if (!roleJDOInstance.hasErrors()) {
            try {
                persistenceManager.makePersistent(roleJDOInstance)
            } finally {
                flash.message = "RoleJDO ${roleJDOInstance.id} created"
                redirect(action: show, id: roleJDOInstance.id)
            }
        }

        render(view: 'create', model: [roleJDOInstance: roleJDOInstance])

    }
}
