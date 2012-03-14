package webprojects

import webprojects.BeerEntryJDO
import java.util.Properties
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

class EmailBeerContestantService {

    static transactional = true

    def emailContestant(BeerEntryJDO entryInfo)
    {
        Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);
        String beerName = "<br/><h2> " + entryInfo.getName() + "<h2>";
        String beerid = "<br/><h2> " + entryInfo.getEntryId() + "<h2>";
        String msgBody = """
        <h1>UNYHA's Homebrew Competition 34th Annual/23nd Empire State Open/HOTY-I Qualifier <h1>
        <br/><br/>
        <p>You will recieve a email about final Registartion when your payment has been confirmed</p>
        <br/><br/>
        <p> please attach to each bottle and send to one of our drop off locations
         Location 1: Niagara Traditions (1296 Sheridan Dr, Tonawanda)     NO LATER THAN FRIDAY APRIL 6th NOON!!

         Location 2: E.J. Wren (Ponderosa Plz/Old Liverpool Rd, Liverpool)   NO LATER THAN FRIDAY APRIL 6th NOON!!

         Location 3: Southtown Beverage (2933 W. Henrietta Rd, Rochester)   NO LATER THAN SATURDAY APRIL 7th 11AM!!

         Shipping:  Southtown Beverage (2933 W. Henrietta Rd, Rochester ZIP)  NO LATER THAN APRIL 6th

         <b>DO NOT SHIP OR DROP OFF @ ROC BREWING !!!!</b><p><br/><br/>


        """;

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("nate.weldon@gmail.com", "UNYHA.com ContestantReplyer"));
            msg.addRecipient(Message.RecipientType.TO,
                             new InternetAddress(entryInfo.getEmail(), entryInfo.getFname() + " " + entryInfo.getLname()));
            msg.setSubject("Your Beer Has Been Confirmed");
            msg.setText(msgBody + beerName + beerid);
            Transport.send(msg);

        } catch (AddressException e) {
            // ...
        } catch (MessagingException e) {
            // ...
        }
    }
}
