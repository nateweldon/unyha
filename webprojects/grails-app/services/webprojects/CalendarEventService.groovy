package webprojects

import java.text.SimpleDateFormat



class CalendarEventService {

    static transactional = true

    def serviceMethod() {

    }

    def convertDate(Date date) {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd");

        def dateString = formatter.format(date);
        return (dateString)
    }
}