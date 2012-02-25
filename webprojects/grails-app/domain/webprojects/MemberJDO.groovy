package webprojects



import javax.jdo.annotations.*;
// import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable = "true")
class MemberJDO implements Serializable {

    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    Long id

    @Persistent
    String property1

    @Persistent
    String firstName;

    @Persistent
    String lastName;

    @Persistent
    String email;

    @Persistent
    String streetAddress;

    @Persistent
    String city;

    @Persistent
    String state;

    @Persistent
    Integer zip;

    @Persistent
    Integer homePhone;

    @Persistent
    Boolean homeIncluded;

    @Persistent
    Integer cellPhone;

    @Persistent
    Boolean cellIncluded;

    @Persistent
    Integer startingBrewDate;

    @Persistent
    Integer bjcpStatus;

    public MemberJDO(String first, String last, String email)
    {
        this.firstName = first;
        this.lastName = last;
        this.email = email;
    }

    public String getFirst()
    {
        return firstName;
    }

    public String getLast() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }
    public void setbjcpStatus(Integer status)
    {
        bjcpStatus = status;
    }

    public void setStreetAddress(String street) {
        this.streetAddress = street;
    }

    public String getStreet() {
        return streetAddress;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void setZip(Integer zip) {
        this.zip = zip;
    }

    public void setHomePhone(Integer phone, Boolean include) {
        this.homePhone = phone;
        this.homeIncluded = include;
    }

    public void setCellPhone(Integer phone, Boolean include) {
        this.cellPhone = phone;
        this.cellIncluded = include;
    }


    Integer getBjcpStatus() {
        return bjcpStatus
    }

    void setBjcpStatus(Integer bjcpStatus) {
        this.bjcpStatus = bjcpStatus
    }

    Integer getStartingBrewDate() {
        return startingBrewDate
    }

    void setStartingBrewDate(Integer startingBrewDate) {
        this.startingBrewDate = startingBrewDate
    }


    static constraints = {
        id(visible: false)
    }
}
