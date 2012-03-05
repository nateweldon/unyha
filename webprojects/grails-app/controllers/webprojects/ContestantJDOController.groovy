package webprojects

import com.google.appengine.api.datastore.*
import grails.converters.JSON
import webprojects.ContestantJDO
import webprojects.BeerEntryJDO
import javax.jdo.Query;


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
        def beerEntryJDOInstance = new BeerEntryJDO()
        def beerCategory = [1:'Light Lager', 2:'Pilsner', 3:'European Amber Lager', 4:'Dark Lager',
                5:'Bock', 6:'Light Hybrid', 7:'Amber Hybrid', 8:'English Pale Ale', 9:'Scottish And Irish Ale',
                10:'American Ale', 11:'English Brown Ale', 12:'Porter', 13:'Stout', 14:'India Pale Ale (IPA',
                15:'German Wheat And Rye', 16:'Belgian And French', 17:'Sour Ale', 18:'Belgian Strong',
                19:'Strong', 20:'Fruit', 21:'Spice / Herb / Vegtable', 22:'Smoke-Flavored / Wood-Aged', 23:'SpecialBeer',
                24:'Traditional Mead', 25:'Melomel (Fruit Mead)', 26:'Other Mead', 27:'Standard Cider and Perry',
                28:'Specialty Cider and Perry']

        beerEntryJDOInstance.properties = params
        contestantJDOInstance.properties = params
        return ['contestantJDOInstance': contestantJDOInstance,
                'beerEntryJDOInstance': beerEntryJDOInstance, 'beerCategory':beerCategory]
    }

    def save = {
         def contestantJDOInstance = new ContestantJDO(params.fname, params.mname, params.lname, params.addr, params.state,
                                                        Integer.parseInt(params.zip), params.hPhone, params.wPhone, params.email)

        persistenceManager.makePersistent(contestantJDOInstance)
        render params as JSON

    }
    def createBeer = {

        def beerEntryJDOInstance = new BeerEntryJDO(params.cat, params.sub, params.bName, params.ingred,
                                                     params.comment, params.addit, params.fname, params.lname)
        def query = persistenceManager.newQuery(BeerEntryJDO)
        def beerEntryJDOInstanceList = query.execute()
        def total = 0;


//        ContestantJDO contestant = persistenceManager.getObjectById(ContestantJDO.class, params.fname)
        Query queryContest = persistenceManager.newQuery(ContestantJDO.class)

        def contestant = queryContest.execute()

        Iterator iter = contestant.iterator()
        while(iter.hasNext())
        {
            ContestantJDO contest = iter.next();
            if (contest.lastName.equalsIgnoreCase(params.lname) && contest.firstName.equalsIgnoreCase(params.fname))
                contest.setNumberOfEntries(contest.getNumberOfEntries()+1);

        }

        if (beerEntryJDOInstanceList && beerEntryJDOInstanceList.size() > 0) {
            total = beerEntryJDOInstanceList.size() + 1



        }
        else
        {
            total = 1

        }
        beerEntryJDOInstance.setEntryId(total);
         persistenceManager.makePersistent(beerEntryJDOInstance)
        render params as JSON
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
