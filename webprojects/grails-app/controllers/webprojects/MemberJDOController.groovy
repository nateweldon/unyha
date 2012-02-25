package webprojects

import com.google.appengine.api.datastore.*

class MemberJDOController {

    def persistenceManager

    def index = { redirect(action: list, params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def query = persistenceManager.newQuery(MemberJDO)
        def memberJDOInstanceList = query.execute()
        def total = 0
        if (memberJDOInstanceList && memberJDOInstanceList.size() > 0) {
            total = memberJDOInstanceList.size()
        }
        [memberJDOInstanceList: memberJDOInstanceList, memberJDOInstanceTotal: total]
    }

    def show = {
        def memberJDOInstance = persistenceManager.getObjectById(MemberJDO.class, Long.parseLong(params.id))
        if (!memberJDOInstance) {
            flash.message = "MemberJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else { return [memberJDOInstance: memberJDOInstance] }
    }

    def delete = {
        def memberJDOInstance = persistenceManager.getObjectById(MemberJDO.class, Long.parseLong(params.id))
        if (memberJDOInstance) {
            try {
                persistenceManager.deletePersistent(memberJDOInstance)
                flash.message = "MemberJDO ${params.id} deleted"
                redirect(action: list)
            }
            catch (Exception e) {
                flash.message = "MemberJDO ${params.id} could not be deleted"
                redirect(action: show, id: params.id)
            }
        }
        else {
            flash.message = "MemberJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def memberJDOInstance = persistenceManager.getObjectById(MemberJDO.class, Long.parseLong(params.id))
        if (!memberJDOInstance) {
            flash.message = "MemberJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            memberJDOInstance = persistenceManager.detachCopy(memberJDOInstance)
            return [memberJDOInstance: memberJDOInstance]
        }
    }

    def update = {
        def memberJDOInstance = persistenceManager.getObjectById(MemberJDO.class, Long.parseLong(params.id))

        if (memberJDOInstance) {
            memberJDOInstance.properties = params
            if (!memberJDOInstance.hasErrors()) {

                try {
                    persistenceManager.makePersistent(memberJDOInstance)
                } catch (Exception e) {
                    render(view: 'edit', model: [memberJDOInstance: memberJDOInstance])
                } finally {
                    flash.message = "MemberJDO ${params.id} updated"
                    redirect(action: show, id: memberJDOInstance.id)
                }
            }
            else {
                render(view: 'edit', model: [memberJDOInstance: memberJDOInstance])
            }
        }
        else {
            flash.message = "MemberJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def create = {
        def memberJDOInstance = new MemberJDO()
        memberJDOInstance.properties = params
        return ['memberJDOInstance': memberJDOInstance]
    }

    def save = {
        def memberJDOInstance = new MemberJDO(params)
        if (!memberJDOInstance.hasErrors()) {
            try {
                persistenceManager.makePersistent(memberJDOInstance)
            } finally {
                flash.message = "MemberJDO ${memberJDOInstance.id} created"
                redirect(action: show, id: memberJDOInstance.id)
            }
        }

        render(view: 'create', model: [memberJDOInstance: memberJDOInstance])

    }
}
