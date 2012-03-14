package webprojects

import grails.test.*
import webprojects.BeerEntryJDO
class EmailBeerContestantServiceTests extends GrailsUnitTestCase {
    def emailBeerContestantService
    protected void setUp() {
        emailBeerContestantService = new EmailBeerContestantService()
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testEmail() {
//        BeerEntryJDO beerEntryJDO = new BeerEntryJDO(1, "A", "Nates Beer", "", "", "", "Nate", "Weldon", "nate.weldon@gmail.com")
//        beerEntryJDO.setEntryId(1001)
//        emailBeerContestantService.emailContestant(beerEntryJDO)

    }
}
