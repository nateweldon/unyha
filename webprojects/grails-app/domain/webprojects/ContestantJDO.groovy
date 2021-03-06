package webprojects



import javax.jdo.annotations.*;
import webprojects.BeerEntryJDO;
// import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable = "true")
class ContestantJDO implements Serializable {


    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    Long id

     @Persistent
     String lastName;

     @Persistent
     String firstName;

    @Persistent
    String middleInitial;

    @Persistent
    String address;

    @Persistent
    String city;

    @Persistent
    String state;

    @Persistent
    int zip;

    @Persistent
    String clubInfo;


    @Persistent
    String homePhone

    @Persistent
    String workPhone;

    @Persistent
    String email

    int getNumberOfEntries() {
        return numberOfEntries
    }

    void setNumberOfEntries(int numberOfEntries) {
        this.numberOfEntries = numberOfEntries
    }

    @Persistent
    int numberOfEntries



    static constraints = {
        id(visible: false)

    }

    public ContestantJDO(String fname, String m, String lname, String addr, String state, int zip, String hPhone,
                         String wPhone, String email)
    {
        firstName = fname;
        middleInitial = m;
        lastName = lname;
        address = addr;
        this.state = state;
        this.zip = zip;
        homePhone = hPhone;
        workPhone = wPhone;
        this.email = email;
    }

    public String getAddress() {
        return address
    }

    public void setAddress(String address) {
        this.address = address
    }

    public String getCity() {
        return city
    }

    public void setCity(String city) {
        this.city = city
    }

    public String getState() {
        return state
    }

    public void setState(String state) {
        this.state = state
    }

    public int getZip() {
        return zip
    }

    public void setZip(int zip) {
        this.zip = zip
    }

    public String getClubInfo() {
        return clubInfo
    }

    public void setClubInfo(String clubInfo) {
        this.clubInfo = clubInfo
    }

    public String getHomePhone() {
        return homePhone
    }

    public void setHomePhone(String homePhone) {
        this.homePhone = homePhone
    }

    public String getWorkPhone() {
        return workPhone
    }

    public void setWorkPhone(String workPhone) {
        this.workPhone = workPhone
    }

    public String getEmail() {
        return email
    }

    public void setEmail(String email) {
        this.email = email
    }



}
