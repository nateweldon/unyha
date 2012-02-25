package webprojects



import javax.jdo.annotations.*;
// import com.google.appengine.api.datastore.Key;

@PersistenceCapable(identityType = IdentityType.APPLICATION, detachable = "true")
public class CalendarEventsJDO implements Serializable {

    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    Long id

   @Persistent
   private Date eventDate;


    @Persistent
    private boolean paypal;

    @Persistent
    private int totalNumberReservations;

    @Persistent
    private int currentNumberReservations;

    @Persistent
    private String title;

    @Persistent
    private String summary;

    @Persistent
    private String location;




    public CalendarEventsJDO(Date date, String title, String summary, String location)
     {
         this.eventDate = date;
         this.summary = summary;
         this.title = title;

     }

    public String getSummary()
    {
        return summary;
    }

    public String getTitle()
    {
        return title;

    }

    public Date getDate()
    {
        return eventDate;
    }

    public String getLocation() {
        return location;
    }

    static constraints = {
        id(visible: false)
        day blank: false, range: 1..12
        month blank: false, range: 1..12
        year blank: false, range: 2012..2200
    }
}
