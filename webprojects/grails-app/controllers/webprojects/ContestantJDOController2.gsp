package webprojects

import com.google.appengine.api.datastore.*
import grails.converters.JSON
import webprojects.ContestantJDO
import webprojects.BeerEntryJDO
import javax.jdo.Query;

import java.util.Properties;




class ContestantJDOController {

    def persistenceManager

    def emailBeerContestantService

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
    def updateSubCat = {
        def subCat =  [
                [name:"Light Lager",
                           sublist:[
                "1A. Lite American Lager",
                "1B. Standard American Lager",
                "1C. Premium American Lager",
                "1D. Munich Helles",
                "1E. Dortmunder Export" ],
                [name:"Pilsner",
                        sublist:[
                "2A. German Pilsner (Pils)",
                "2B. Bohemian Pilsener",
                "2C. Classic American Pilsner"],
                [name:"Europan Amber Lager",
                        sublist:[
                "3A. Vienna Lager",
                "3B. Oktoberfest/Märzen"],
                [name:"Dark Lager",
                        sublist:[
                "4A. Dark American Lager",
                "4B. Munich Dunkel",
                "4C. Schwarzbier (Black Beer)"],
                [name:"Bock",
                        sublist:[
                "5A. Maibock/Helles Bock",
                "5B. Traditional Bock",
                "5C. Doppelbock",
                "5D. Eisbock"],
                [name:"Light Hybrid Beer",
                        sublist:[
                "6A. Cream Ale",
                "6B. Blonde Ale ",
                "6C. Kölsch ",
                "6D. American Wheat or Rye Beer"],
                [name:"Amber Hybrid Beer",
                        sublist:[
                "7A. Northern German Altbier",
                "7B. California Common Beer",
                "7C. Düsseldorf Altbier"],
                [name:"English Pale Ale",
                        sublist:[
                "8A. Standard/Ordinary Bitter",
                "8B. Special/Best/Premium Bitter",
                "8C. Extra Special/Strong Bitter (English Pale Ale)"],
                [name:"Scottish And Irish Ale",
                        sublist:[
                "9A. Scottish Light 60/-",
        "9B. Scottish Heavy 70/-",
        "9C. Scottish Export 80/- " ,
        "9D. Irish Red Ale",
                "9E. Strong Scotch Ale"],
                [name:"AmericanAle",sublist:[
                "10A. American Pale Ale",
                "10B. American Amber Ale ",
                "10C. American Brown Ale"],
                [name:"English BrownAle", sublist:[

"1A. Mild",
                "1B. Southern English Brown",
                "1C. Northern English Brown Ale"],
                [name:"Porter", sublist:[
                "12A. Brown Porter",
                "12B. Robust Porter",
                "12C. Baltic Porter"],
                [name: "Stout" sublist:[
                "13A. Dry Stout",
                "13B. Sweet Stout",
                "13C. Oatmeal Stout",
                "13D. Foreign Extra Stout",
                "13E. American Stout",
                "13F. Russian Imperial Stout"],
                [name:"Indial Pale Ale (IPA)", sublist:[
                "14A. English IPA",
                "14B. American IPA",
                "14C. Imperial IPA"],
               [name:"Germain Wheat And Rye Beer", sublist:[
                "15A. Weizen/Weissbier",
                "15B. Dunkelweizen",
                "15C. Weizenbock",
                "15D. Roggenbier (German Rye Beer)"],
               [name:"Beligan And French Ale", sublist:[
               "16A. Witbier",
                "16B. Belgian Pale Ale",
                "16C. Saison",
                "16D. Bière de Garde",
                "16E. Belgian Specialty Ale"],
                [name: "Sour Ale", sublist:[
                "17A. Berliner Weisse",
                "17B. Flanders Red Ale",
                "17C. Flanders Brown Ale/Oud Bruin",
                "17D. Straight (Unblended) Lambic",
                "17E. Gueuze",
                "17F. Fruit Lambic"],
                [name:"Beligan Strong Ale", sublist:[
                "18A. Belgian Blond Ale",
                "18B. Belgian Dubbel",
                "18C. Belgian Tripel",
                "18D. Belgian Golden Strong Ale",
                "18E. Belgian Dark Strong Ale"],
                [name:"Strong Ale", sublist:[
                "19A. Old Ale",
                "19B. English Barleywine",
                "19C. American Barleywine"],
                [name:"Fruit Beer", sublist:[]],
                [name:"Spice / Herb / Vegetable / Beer", sublist:[
                "21A. Spice, Herb, or Vegetable Beer",
                "21B. Christmas/Winter Specialty Spiced Beer",]],
                [name:Smoked-Flavoed /Wood-Aged Beer", sublist:[
                "22A. Classic Rauchbier",
                "22B. Other Smoked Beer",
                "22C. Wood-Aged Beer"],

                [name:"Traditional Mead", sublist:[
               "24A. Dry Mead",
                "24B. Semi-sweet Mead",
                "24C. Sweet Mead"],
                [name:"Melomel (Fruit Mead)",
                        sublist:[
                "25A. Cyser",
                "25B. Pyment",
                "25C. Other Fruit Melomel"],
                [name:"Other Mead",
                        sublist:{
                "26A. Metheglin",
                "26B. Braggot",
                "26C. Open Category Mead"],

                        [name:"Standard Cider And Perry",
                sublist:["27A. Common Cider",
                "27B. English Cider ",
                "27C. French Cider",
                "27D. Common Perry",
                "27E. Traditional Perry"],
                [name:"Specialty Cider And Perry",
                        sublist:[
                                "28A. New England Cider",
                "28B. Fruit Cider",
                "28C. Applewine",
                "28D. Other Specialty Cider/Perry"]
        ]
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

        def beerEntryJDOInstance = new BeerEntryJDO(Integer.parseInt(params.cat), params.sub, params.bName, params.ingred,
                params.comment, params.addit, params.fname, params.lname, params.email)
        def query = persistenceManager.newQuery(BeerEntryJDO)
        def beerEntryJDOInstanceList = query.execute()
        def total = 1001;

        Query queryContest = persistenceManager.newQuery(ContestantJDO.class)

        def contestant = queryContest.execute()

        Iterator iter = contestant.iterator()
        while(iter.hasNext())
        {
            ContestantJDO contest = iter.next();
            if (contest.getLastName().equalsIgnoreCase(params.lname) && contest.getFirstName().equalsIgnoreCase(params.fname) && contest.getEmail().equalsIgnoreCase(params.email))
                contest.setNumberOfEntries(contest.getNumberOfEntries()+1);

        }

        if (beerEntryJDOInstanceList && beerEntryJDOInstanceList.size() > 0) {
            total = beerEntryJDOInstanceList.size() + 1001

        }
        else
        {
            total = 1001

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

    def paypalBuy = {

        def query = persistenceManager.newQuery(BeerEntryJDO)
        def beerEntryTotal = query.execute()

        Iterator iter = beerEntryTotal.iterator()


        def totalNumberOfEntries = 0
        while(iter.hasNext())
        {

            BeerEntryJDO contest = (BeerEntryJDO)iter.next();
            if (contest.getLname().equalsIgnoreCase(params.lname) && contest.getFname().equalsIgnoreCase(params.fname))
            {
                totalNumberOfEntries++
                emailBeerContestantService.emailContestant(contest)
            }
        }

        //render beerEntryTotal
        render totalNumberOfEntries * 7


    }

}

