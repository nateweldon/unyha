package webprojects



import javax.jdo.annotations.*;
import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable = "true")
class BeerEntryJDO implements Serializable {

    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    Long id;

    @Persistent
    Long entryId;

    @Persistent
    int catNum;

    @Persistent
    char subCat;

    @Persistent
    String name;

    @Persistent
    String ingredients;

    @Persistent
    String comments;

    @Persistent
    String additionalBrewers;

    @Persistent
    String fname;

    @Persistent
    String lname;

    long getEntryId() {
        return entryId;
    }
    void setEntryId(Long id) {
        entryId = id;
    }
    int getCatNum() {
        return catNum
    }

    void setCatNum(int catNum) {
        this.catNum = catNum
    }

    char getSubCat() {
        return subCat
    }

    void setSubCat(char subCat) {
        this.subCat = subCat
    }

    String getName() {
        return name
    }

    void setName(String name) {
        this.name = name
    }

    String getIngredients() {
        return ingredients
    }

    void setIngredients(String ingredients) {
        this.ingredients = ingredients
    }

    String getComments() {
        return comments
    }

    void setComments(String comments) {
        this.comments = comments
    }

    String getAdditionalBrewers() {
        return additionalBrewers
    }

    void setAdditionalBrewers(String additionalBrewers) {
        this.additionalBrewers = additionalBrewers
    }




    BeerEntryJDO(String catNum, String subCat, String name, String ingredients, String comments,
                 String additionalBrewers, String fname, String lname) {
        this.catNum = catNum[0]
        this.subCat = subCat[0]
        this.name = name
        this.ingredients = ingredients
        this.comments = comments
        this.additionalBrewers = additionalBrewers
        this.fname = fname;
        this.lname = lname;

    }

    static constraints = {

        id(visible: false)
    }
}
