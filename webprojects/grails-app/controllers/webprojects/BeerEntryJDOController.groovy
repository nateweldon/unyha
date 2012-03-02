package webprojects

import com.google.appengine.api.datastore.*

class BeerEntryJDOController {

    def persistenceManager

    def index = { redirect(action: list, params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def query = persistenceManager.newQuery(BeerEntryJDO)
        def beerEntryJDOInstanceList = query.execute()
        def total = 0
        if (beerEntryJDOInstanceList && beerEntryJDOInstanceList.size() > 0) {
            total = beerEntryJDOInstanceList.size()
        }
        [beerEntryJDOInstanceList: beerEntryJDOInstanceList, beerEntryJDOInstanceTotal: total]
    }

    def show = {
        def beerEntryJDOInstance = persistenceManager.getObjectById(BeerEntryJDO.class, Long.parseLong(params.id))
        if (!beerEntryJDOInstance) {
            flash.message = "BeerEntryJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else { return [beerEntryJDOInstance: beerEntryJDOInstance] }
    }

    def delete = {
        def beerEntryJDOInstance = persistenceManager.getObjectById(BeerEntryJDO.class, Long.parseLong(params.id))
        if (beerEntryJDOInstance) {
            try {
                persistenceManager.deletePersistent(beerEntryJDOInstance)
                flash.message = "BeerEntryJDO ${params.id} deleted"
                redirect(action: list)
            }
            catch (Exception e) {
                flash.message = "BeerEntryJDO ${params.id} could not be deleted"
                redirect(action: show, id: params.id)
            }
        }
        else {
            flash.message = "BeerEntryJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def beerEntryJDOInstance = persistenceManager.getObjectById(BeerEntryJDO.class, Long.parseLong(params.id))
        if (!beerEntryJDOInstance) {
            flash.message = "BeerEntryJDO not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            beerEntryJDOInstance = persistenceManager.detachCopy(beerEntryJDOInstance)
            return [beerEntryJDOInstance: beerEntryJDOInstance]
        }
    }

    def update = {
        def beerEntryJDOInstance = persistenceManager.getObjectById(BeerEntryJDO.class, Long.parseLong(params.id))

        if (beerEntryJDOInstance) {
            beerEntryJDOInstance.properties = params
            if (!beerEntryJDOInstance.hasErrors()) {

                try {
                    persistenceManager.makePersistent(beerEntryJDOInstance)
                } catch (Exception e) {
                    render(view: 'edit', model: [beerEntryJDOInstance: beerEntryJDOInstance])
                } finally {
                    flash.message = "BeerEntryJDO ${params.id} updated"
                    redirect(action: show, id: beerEntryJDOInstance.id)
                }
            }
            else {
                render(view: 'edit', model: [beerEntryJDOInstance: beerEntryJDOInstance])
            }
        }
        else {
            flash.message = "BeerEntryJDO not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def create = {
        def beerEntryJDOInstance = new BeerEntryJDO()
        def beerCategory = [1:'Light Lager', 2:'Pilsner', 3:'European Amber Lager', 4:'Dark Lager',
                5:'Bock', 6:'Light Hybrid', 7:'Amber Hybrid', 8:'English Pale Ale', 9:'Scottish And Irish Ale',
                10:'American Ale', 11:'English Brown Ale', 12:'Porter', 13:'Stout', 14:'India Pale Ale (IPA',
                15:'German Wheat And Rye', 16:'Belgian And French', 17:'Sour Ale', 18:'Belgian Strong',
                19:'Strong', 20:'Fruit', 21:'Spice / Herb / Vegtable', 22:'Smoke-Flavored / Wood-Aged', 23:'SpecialBeer',
                24:'Traditional Mead', 25:'Melomel (Fruit Mead)', 26:'Other Mead', 27:'Standard Cider and Perry',
                28:'Specialty Cider and Perry']

        beerEntryJDOInstance.properties = params
        return ['beerEntryJDOInstance': beerEntryJDOInstance, 'beerCategory':beerCategory]
    }

    def save = {
        def beerEntryJDOInstance = new BeerEntryJDO(params)
        def query = persistenceManager.newQuery(BeerEntryJDO)
        def beerEntryJDOInstanceList = query.execute()
        def total = 1
        if (beerEntryJDOInstanceList && beerEntryJDOInstanceList.size() > 0) {
            total = beerEntryJDOInstanceList.size()+1
        }
        beerEntryJDOInstance.setEntryId(total);
        if (!beerEntryJDOInstance.hasErrors()) {
            try {
                persistenceManager.makePersistent(beerEntryJDOInstance)
            } finally {
                flash.message = "BeerEntryJDO ${beerEntryJDOInstance.id} created"
                redirect(action: show, id: beerEntryJDOInstance.id)
            }
        }

        render(view: 'create', model: [beerEntryJDOInstance: beerEntryJDOInstance])

    }
}
