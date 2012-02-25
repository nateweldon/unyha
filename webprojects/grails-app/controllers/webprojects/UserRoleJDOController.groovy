package webprojects

import com.google.appengine.api.datastore.*

class UserRoleJDOController {

    def persistenceManager

    def index = { redirect(action: list, params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def query = persistenceManager.newQuery(UserRoleJDO)
        def userRoleJDOInstanceList = query.execute()
        def total = 0
        if (userRoleJDOInstanceList && userRoleJDOInstanceList.size() > 0) {
            total = userRoleJDOInstanceList.size()
        }
        [userRoleJDOInstanceList: userRoleJDOInstanceList, userRoleJDOInstanceTotal: total]
    }

    def show = {
        def userRoleJDOInstance = persistenceManager.getObjectById(UserRoleJDO.class, Long.parseLong(params.id))
        if (!userRoleJDOInstance) {
            flash.message = "UserRoleJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else { return [userRoleJDOInstance: userRoleJDOInstance] }
    }

    def delete = {
        def userRoleJDOInstance = persistenceManager.getObjectById(UserRoleJDO.class, Long.parseLong(params.id))
        if (userRoleJDOInstance) {
            try {
                persistenceManager.deletePersistent(userRoleJDOInstance)
                flash.message = "UserRoleJDO ${params.id} deleted"
                redirect(action: list)
            }
            catch (Exception e) {
                flash.message = "UserRoleJDO ${params.id} could not be deleted"
                redirect(action: show, id: params.id)
            }
        }
        else {
            flash.message = "UserRoleJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def userRoleJDOInstance = persistenceManager.getObjectById(UserRoleJDO.class, Long.parseLong(params.id))
        if (!userRoleJDOInstance) {
            flash.message = "UserRoleJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            userRoleJDOInstance = persistenceManager.detachCopy(userRoleJDOInstance)
            return [userRoleJDOInstance: userRoleJDOInstance]
        }
    }

    def update = {
        def userRoleJDOInstance = persistenceManager.getObjectById(UserRoleJDO.class, Long.parseLong(params.id))

        if (userRoleJDOInstance) {
            userRoleJDOInstance.properties = params
            if (!userRoleJDOInstance.hasErrors()) {

                try {
                    persistenceManager.makePersistent(userRoleJDOInstance)
                } catch (Exception e) {
                    render(view: 'edit', model: [userRoleJDOInstance: userRoleJDOInstance])
                } finally {
                    flash.message = "UserRoleJDO ${params.id} updated"
                    redirect(action: show, id: userRoleJDOInstance.id)
                }
            }
            else {
                render(view: 'edit', model: [userRoleJDOInstance: userRoleJDOInstance])
            }
        }
        else {
            flash.message = "UserRoleJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def create = {
        def userRoleJDOInstance = new UserRoleJDO()
        userRoleJDOInstance.properties = params
        //return ['userRoleJDOInstance': userRoleJDOInstance]

        def query = persistenceManager.newQuery(RoleJDO)
        def roleJDOInstanceList = query.execute()
        def total = 0
        if (roleJDOInstanceList && roleJDOInstanceList.size() > 0) {
            total = roleJDOInstanceList.size()
        }

        def queryUser = persistenceManager.newQuery(UserJDO)
        def userJDOInstanceList = queryUser.execute()
        def totalUser = 0
        if (userJDOInstanceList && userJDOInstanceList.size() > 0) {
            totalUser = userJDOInstanceList.size()
        }
       ['userRoleJDOInstance': userRoleJDOInstance, roleJDOInstanceList: roleJDOInstanceList, roleJDOInstanceTotal: total,
       userJDOInstanceList: userJDOInstanceList, userJDOInstanceTotal: totalUser]
    }

    def save = {
        def userRoleJDOInstance = new UserRoleJDO(params)
        if (!userRoleJDOInstance.hasErrors()) {
            try {
                persistenceManager.makePersistent(userRoleJDOInstance)
            } finally {
                flash.message = "UserRoleJDO ${userRoleJDOInstance.id} created"
                redirect(action: show, id: userRoleJDOInstance.id)
            }
        }

        render(view: 'create', model: [userRoleJDOInstance: userRoleJDOInstance])

    }
}
