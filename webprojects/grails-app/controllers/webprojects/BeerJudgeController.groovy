package webprojects

class BeerJudgeController {
    static navigation = [
            order:4,
            title:'BCJP',
            action:'manage'

    ]

    def index = {
    redirect(action:"manage")
    }

    def manage = {
         def beerCategory = [1:'Light Lager', 2:'Pilsner', 3:'European Amber Lager', 4:'Dark Lager',
                5:'Bock', 6:'Light Hybrid', 7:'Amber Hybrid', 8:'English Pale Ale', 9:'Scottish And Irish Ale',
                10:'American Ale', 11:'English Brown Ale', 12:'Porter', 13:'Stout', 14:'India Pale Ale (IPA',
                15:'German Wheat And Rye', 16:'Belgian And French', 17:'Sour Ale', 18:'Belgian Strong',
                19:'Strong', 20:'Fruit', 21:'Spice / Herb / Vegtable', 22:'Smoke-Flavored / Wood-Aged', 23:'SpecialBeer',
                24:'Traditional Mead', 25:'Melomel (Fruit Mead)', 26:'Other Mead', 27:'Standard Cider and Perry',
                28:'Specialty Cider and Perry']


        return ['beerCategory':beerCategory]

    }
}
